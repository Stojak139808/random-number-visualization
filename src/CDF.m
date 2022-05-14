function out = CDF(distribution)
%return cummulative distribution function based on the given discrete
%probability density function
%distribution - an [x y] point list
%out - an [x y] point list of the cummulative distribution function
    %integrating
    y = cumsum(distribution(:,2));
    out = [distribution(:,1) y];
    
end