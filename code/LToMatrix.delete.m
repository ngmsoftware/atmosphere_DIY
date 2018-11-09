function [Lx, Ly] = LToMatrix(Lin, R)

    [L, K] = size(R);
    
    Lx = zeros(L,K);
    Ly = zeros(L,K);

    for i=1:length(Lin)
        Lx(i) = Lin(i).cx;
        Ly(i) = Lin(i).cy;
    end
    
    
end