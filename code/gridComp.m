function G = gridComp(L, idx1, idx2, idx3, idx4)

    idxEnd = idx2;
    
    G(1,1) = idx1;
    
    i = 2;
    idx = idx1;    
    while idx~=idxEnd
        idx = searchNextNeighboor(L, idx, 1);
        G(1,i) = idx; 
        i = i+1;
    end

    
    idxEnd = idx4;
    
    i = 2;
    idx = idx1;    
    while idx~=idxEnd
        idx = searchNextNeighboor(L, idx, 2);
        G(i,1) = idx; 
        i = i+1;
    end
    
    
    for i=2:size(G,2)
        idx = G(1,i);
        for j=2:size(G,1)
            idx = searchNextNeighboor(L, idx, 2);
            G(j,i) = idx;
        end
    end
    
    
end