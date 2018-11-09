function M = maskRegions(W, H, R)

[K, L] = size(R);

r = R(:);

M = zeros(H,W);

for i=1:W
    for j=1:H
        k = 1;
        foundk = nan;
        keep_going = 1;
        while keep_going
            yn = isInsideRegion([i j], r{k});
            if yn
                keep_going = 0;
                foundk = k;
            end
            k = k+1;
            if k>length(r)
                keep_going = 0;
            end
        end
            
        if ~isnan(foundk)
            M(j,i) = foundk;
        end
        
    end
    disp(sprintf('masking %d of %d',i,W));
    
end




