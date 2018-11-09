function R = computeRegions(L, G)

    R = cell(size(G));

    for i=2:size(G,1)-1
        for j=2:size(G,2)-1
            p1 = [L(G(i-1,j-1)).cx L(G(i-1,j-1)).cy];
            p2 = [L(G(i-1,j+1)).cx L(G(i-1,j+1)).cy];
            p3 = [L(G(i+1,j+1)).cx L(G(i+1,j+1)).cy];
            p4 = [L(G(i+1,j-1)).cx L(G(i+1,j-1)).cy];
            
            pc = [L(G(i,j)).cx L(G(i,j)).cy];
            
            c1 = (pc+p1)/2;
            c2 = (pc+p2)/2;
            c3 = (pc+p3)/2;
            c4 = (pc+p4)/2;
            
            R{i,j} = [c1; c2; c3; c4];
        end
    end

    for j=2:size(G,2)-1
        
        pc = [L(G(1,j)).cx L(G(1,j)).cy];

        r = R{2,j};

        cr = [0 0];
        for i=1:4
            cr = cr + r(i,:)/4;
        end
        for i=1:4
            r(i,:) = r(i,:) - cr + pc;
        end

        R{1,j} = r;
    end
    

    
    for j=2:size(G,2)-1
        
        pc = [L(G(end,j)).cx L(G(end,j)).cy];

        r = R{end-1,j};

        cr = [0 0];
        for i=1:4
            cr = cr + r(i,:)/4;
        end
        for i=1:4
            r(i,:) = r(i,:) - cr + pc;
        end

        R{end,j} = r;
    end
    

    
    for i=2:size(G,1)-1
        
        pc = [L(G(i,1)).cx L(G(i,1)).cy];

        r = R{i,2};

        cr = [0 0];
        for j=1:4
            cr = cr + r(j,:)/4;
        end
        for j=1:4
            r(j,:) = r(j,:) - cr + pc;
        end

        R{i,1} = r;
    end
    

    
    for i=2:size(G,1)-1
        
        pc = [L(G(i,end)).cx L(G(i,end)).cy];

        r = R{i,end-1};

        cr = [0 0];
        for j=1:4
            cr = cr + r(j,:)/4;
        end
        for j=1:4
            r(j,:) = r(j,:) - cr + pc;
        end

        R{i,end} = r;
    end
    
    
    
    
    
    
    
    
    
    pc = [L(G(1,1)).cx L(G(1,1)).cy];
    r = R{2,2};
    cr = [0 0];
    for j=1:4
        cr = cr + r(j,:)/4;
    end
    for j=1:4
        r(j,:) = r(j,:) - cr + pc;
    end
    R{1,1} = r;    
    

    pc = [L(G(1,end)).cx L(G(1,end)).cy];
    r = R{2,end-1};
    cr = [0 0];
    for j=1:4
        cr = cr + r(j,:)/4;
    end
    for j=1:4
        r(j,:) = r(j,:) - cr + pc;
    end
    R{1,end} = r;    
    
    
    pc = [L(G(end,1)).cx L(G(end,1)).cy];
    r = R{end-1,2};
    cr = [0 0];
    for j=1:4
        cr = cr + r(j,:)/4;
    end
    for j=1:4
        r(j,:) = r(j,:) - cr + pc;
    end
    R{end,1} = r;    
    
    
    pc = [L(G(end,end)).cx L(G(end,end)).cy];
    r = R{end-1,end-1};
    cr = [0 0];
    for j=1:4
        cr = cr + r(j,:)/4;
    end
    for j=1:4
        r(j,:) = r(j,:) - cr + pc;
    end
    R{end,end} = r;    
    
end