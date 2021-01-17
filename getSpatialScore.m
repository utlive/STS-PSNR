function score = getSpatialScore(ref, dis, scale)
	load edge_filter.mat
    [hei, wid] = size(ref);
    if (mod(hei, 2) ~= 0)
        ref = ref(1:hei - 1, :);
        dis = dis(1:hei - 1, :);
    end
    if (mod(wid, 2) ~= 0)
        ref = ref(:, 1:wid - 1);
        dis = dis(:, 1:wid - 1);
    end
    score_ori = method_2D(ref, dis);
	ref_edge = sqrt(imfilter(ref, fx).^2 + imfilter(ref, fy).^2);
	dis_edge = sqrt(imfilter(dis, fx).^2 + imfilter(dis, fy).^2);
	score_edge = method_2D(ref_edge, dis_edge);
	[~, ref_gd] = imgradient(ref);
	[~, dis_gd] = imgradient(dis);
	ref_rm = FGr(ref)
	dis_rm = FGr(dis)
	score_grad = [method_2D(ref_rm, dis_rm), method_2D(ref_gd, dis_gd)];
    dim = 2;
    win = 5;
	score = zeros(1, dim * scale);
	for index_scale = 1:scale
		ref_gauss = getGaussMap(ref, win);
		dis_gauss = getGaussMap(dis, win);
		score(1 + (index_scale - 1) * dim) = method_2D(ref_gauss, dis_gauss);
		ref_gausspyr = imresize(ref_gauss, 0.5);
		dis_gausspyr = imresize(dis_gauss, 0.5); 
		ref_laplace = ref_gauss - imresize(ref_gausspyr, 2);
		dis_laplace = dis_gauss - imresize(dis_gausspyr, 2);	
		score(2 + (index_scale - 1) * dim) = method_2D(ref_laplace, dis_laplace);
	end
	score = [score_ori, score_edge, score_grad, score];
end