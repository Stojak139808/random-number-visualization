# random-number-visualization

This small project uses matlab to visuilize pooling random numbers for different probabiliti distributions.
It provides a simple gui and a real-time animation of pooling results.

The program itself doesn't use matlabs functions and the generator is implemented by me.
It works by firstly getting unit distribution from linear congruential generator, then it
calculates cummulative distribution function based on given distributions, if the distribution was a continuous function, then
it's also discretisized.
With all that inverse transform sampling is done based on numbers from linear congruential generator, giving us a random number
with given distribution.