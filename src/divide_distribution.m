function out = divide_distribution(distribution, n)
    
    %n - divides density function into n parts and integrates it

    search_step = 0.01;
    min_value = 0.0001;

    %finding where the distribution starts and ends to grow
    if(distribution(0) > min_value)
        min = 0;
        max = 0;
        while min_value < distribution(min)
            min = min - search_step;
        end
        while min_value < distribution(max)
            max = max + search_step;
        end
    else
        min = 0;
        max = 0;
        while min_value > distribution(max) && min_value > distribution(min)
            min = min - search_step;
            max = max + search_step; 
        end
        
        if min_value < distribution(max)
            min = max;
            while min_value < distribution(max)
                max = max + search_step;
            end 
        else
            max = min;
            while min_value < distribution(min)
                min = min - search_step;
            end
        end
    end
    
    step = abs(max - min)/n;
    x = (min:step:max)';
    y = distribution(x)*step;
    out = [x y];

end