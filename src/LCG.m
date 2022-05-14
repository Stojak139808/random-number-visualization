function y = LCG(seed, n, a, c, m)
%linear congruential generator
%returns a vecotr with n random elements in the [0;1] range with even
%distribution for a given seed
%Xn+1 = ( a*Xn + c ) mod m
    y = zeros(n,1);
    y(1) = seed;
    for i = 2:n
        y(i) = mod(a*y(i-1)+c,m);
    end
     y = y/m; %[0;1] range even distribution
end




