function [newLx, newLy] = processImage(I, M, R)

    [L, K] = size(R);

    newLx = zeros(L, K);
    newLy = zeros(L, K);
    newLsize = zeros(L, K);

    for i=1:size(I,1)
        for j=1:size(I,2)
            if I(i,j)>0 && M(i,j)>0
                newLx(M(i,j)) = newLx(M(i,j)) + i;
                newLy(M(i,j)) = newLy(M(i,j)) + j;
                newLsize(M(i,j)) = newLsize(M(i,j)) + 1;
            end
        end
    end
    
    for i=1:L
        for j=1:K
            newLx(i,j) = newLx(i,j)/newLsize(i,j);
            newLy(i,j) = newLy(i,j)/newLsize(i,j);
        end
    end
    
end