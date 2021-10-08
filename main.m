ref_video = 'path/to/reference/video.yuv';
dis_video = 'path/to/distorted/video.yuv';
width=720;
height=1280;
score = FRStsFullMap(ref_video, dis_video, height, width);
save video_score.mat score
