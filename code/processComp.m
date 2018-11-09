function resL = processComp(setL, H)

    resL = [];

    L = setL.PixelIdxList;

    for i=1:length(L);
        x = zeros(1,length(L{i}));
        y = zeros(1,length(L{i}));
        for j=1:length(L{i});
            y(j) = 1+mod((L{i}(j)-1),H);
            x(j) = 1+fix((L{i}(j)-1)/H);
        end

        cx = sum(x)/length(x);
        cy = sum(y)/length(y);

        resL(i).x = x;
        resL(i).y = y;
        resL(i).cx = cx;
        resL(i).cy = cy;
        resL(i).size = length(x);

    end

end
