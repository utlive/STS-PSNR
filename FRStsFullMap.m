function score = FRStsFullMap(refName, disName, height, width)
	refFrames = Yuv2Frame(refName, height, width);
	disFrames = Yuv2Frame(disName, height, width);
	len_frame = min(size(refFrames, 3), size(disFrames, 3));
	if (mod(len_frame, 2) ~= 0)
		len_frame = len_frame - 1;
    end
	refFrames = refFrames(:, :, 1:len_frame);
	disFrames = disFrames(:, :, 1:len_frame);	
	sigma = [3.5, 3.7, 3.9];
	window_size = 5;
	spatial_scale = 1;
	temporal_scale = 1;
	num_map = 5;
	score = [];			
	frame_score = zeros(len_frame, 7);
	count = 1;
	for index_frame = 1:2:len_frame - 1
		refCur = refFrames(:, :, index_frame);
		disCur = disFrames(:, :, index_frame);
		ref_diff = refFrames(:, :, index_frame + 1) - refCur;
		dis_diff = disFrames(:, :, index_frame + 1) - disCur;
		frame_score(count, :) = [getSpatialScore(refCur, disCur, spatial_scale), method_2D(ref_diff, dis_diff)];
		count = count + 1;
	end
	score = [score, mean(frame_score(1:count - 1, :), 1)];
	frame_score = zeros(height, num_map);
	count = 1;
	for index_height = 1:2:height
		refCur = reshape(refFrames(index_height, :, :), [width, len_frame])';
		disCur = reshape(disFrames(index_height, :, :), [width, len_frame])';
		frame_score(count, :) = getTemporalScore(refCur, disCur, temporal_scale);
		count = count + 1;
	end
	score = [score, mean(frame_score(1:count - 1, :), 1)];
	frame_score = zeros(width, num_map);
	count = 1;
	for index_width = 1:2:width
		refCur = reshape(refFrames(:, index_width, :), [height, len_frame])';
		disCur = reshape(disFrames(:, index_width, :), [height, len_frame])';
		frame_score(count, :) = getTemporalScore(refCur, disCur, temporal_scale);
		count = count + 1;
	end
	score = [score, mean(frame_score(1:count - 1, :), 1)];
end
