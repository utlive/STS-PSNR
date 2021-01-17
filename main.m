function main(ref_path, dis_path, height, width)
%
% Input: (1) ref_path: the reference video's path
%        (2) dis_path: the distorted video's path
%        (3) height: the height of the video
%        (4) width: the width of the video
% Output: map score vector

score = FRStsFullMap(ref_path, dis_path, height, width);
save score.mat score