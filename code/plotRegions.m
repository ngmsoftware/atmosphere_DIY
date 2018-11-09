function plotRegions(R)

    for i=1:size(R,1)
        for j=1:size(R,2)
            r = R{i,j};
            if ~isempty(r)
                line([r(:,1); r(1,1)], [r(:,2); r(1,2)],'color','k');            
            end
        end
    end

end