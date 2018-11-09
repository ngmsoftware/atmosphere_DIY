function idxOut = searchNextNeighboor(L, idx, xy)

    p = [L(idx).cx L(idx).cy];

    d = inf*ones(size(L));
    for i=1:length(L);
        if i~=idx
            if xy==1
                if p(1)<L(i).cx
                    d(i) = (p(1)-L(i).cx).^2 + 10*(p(2)-L(i).cy).^2;
                end
            else
                if p(2)>L(i).cy
                    d(i) = 10*(p(1)-L(i).cx).^2 + (p(2)-L(i).cy).^2;
                end
            end
        end
    end

    [t, idxOut] = min(d);
end