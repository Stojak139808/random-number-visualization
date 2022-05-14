function animate_discrete(X,Y, n, seed, ax1, ax2, delay)

%ax1 and ax2 are the axes objects from gui

a = 1103515245; %multiplier
c = 12345; %increment
m = 2^31; %modulus

%generate random values
random_values = LCG(seed, n, a, c, m);

%generate cummulatove disribution
cdf = CDF([X Y]);

%accumulator for pooling resulsts
acc = zeros(length(cdf(:,1)),1);

%generate animation frames
for i = 1:n
    
    id = ITS(cdf(:,2), random_values(i));
    acc(id) = acc(id) + 1;
    
    %upper part
    cla(ax1);
    hold(ax1,'on')
    stairs(ax1 ,X, Y, 'Color', '#0072BD');
    plot(ax1, [cdf(1,1) cdf(id,1) cdf(id,1)],[random_values(i) random_values(i) 0],'LineStyle', '--', 'Color', 'red');
    plot(ax1, cdf(id,1), random_values(i), 'Color', 'red', 'Marker', '.');
    stairs(ax1, cdf(:,1),cdf(:,2), 'Color', '#7E2F8E'); %stairs
    hold(ax1,'off')
    
    %lower part with current pooling results
    stem(ax2, cdf(:,1),acc/i, 'LineWidth', 1.5, 'Marker', '.');
   
    drawnow
    
    pause(delay)
    
end

end

