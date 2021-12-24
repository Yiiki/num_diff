# Numerical Derivative against Noise

Calculating noisy signal derivatives is a highly ill problem.
According to the algorithm proposed in the paper [A general approach to derivative calculation using wavelet transform](https://doi.org/10.1016/j.chemolab.2003.08.001), a wavelet-based method can be used to suppress the noise.
This repositary uses this principle to calculate derivations.

The requirements for input data are
1. time vector to be monotonic;
2. f value vector to be periodic.

The second requirement can be readily fulfilled for an acyclic signal by adding a dummy extrapolation to the original signal.

Furthermore, to suppress the boundary effect, a fake-repeat trick is suggested as shown in the example file.

## Cite As
Zhaoyi Yan (2021). Derivatives of the noisy signal based on Gaussian wavelet (https://www.mathworks.com/matlabcentral/fileexchange/102549-derivatives-of-the-noisy-signal-based-on-gaussian-wavelet), MATLAB Central File Exchange. Retrieved November 24, 2021.
