function output = getGaussMap(img, win)
    output = imgaussfilt(img,1.667, 'FilterSize', 5);
end