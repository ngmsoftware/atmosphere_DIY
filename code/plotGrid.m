function plotGrid(I, L, G)

    imagesc(I);
    
    hold('on');

    for i=1:size(G,1)
        for j=1:size(G,2)
            if G(i,j)>0
                plot(L(G(i,j)).cx, L(G(i,j)).cy , 'ko', 'markersize',20,'linewidth',10);
            end
        end
    end


end