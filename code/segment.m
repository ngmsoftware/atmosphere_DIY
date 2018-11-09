function BW = segment(I, th)

    T = adaptthresh(I, th);

    BW = imbinarize(I,T);

    BW = imclose(BW,[0 0 1 1 1 0 0; 0 1 1 1 1 1 0; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1;  0 1 1 1 1 1 0; 0 0 1 1 1 0 0]);

    BW = medfilt2(BW, [3 3]);
    
end