function idx = getClosestIdx(L, p)

    for i=1:length(L);
        d(i) = (p(1)-L(i).cx).^2 + (p(2)-L(i).cy).^2;
    end
    
    [t, idx] = min(d);

end