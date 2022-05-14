clear;
a = 1103515245; %multiplier
c = 12345; %increment
m = 2^31; %modulus
seed = 123454637;
n = 50; %sequence length
pooling_intevals = 20;
random_values = LCG(seed, n, a, c, m);

fun = @(x)1/(3*sqrt(2*pi)) * exp(-0.5*((x-7)/3).^2); % input distribution

%animate_continous('@(x)1/(3*sqrt(2*pi)) * exp(-0.5*((x-7)/3).^2)', n, pooling_intevals, seed)
animate_discrete([1 2 3 4]', [1/4 1/4 1/4 1/4]', n, seed)


