function out = ITS(cdf, val)
%finds P(-inf < X < val) and retuns x intdex
    for i = 1:length(cdf)
        if cdf(i) > val
            break
        end
    end
    out = i;
    
end