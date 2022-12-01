# Numerical Derivative against Noise

Calculating noisy signal derivatives is a highly ill problem.
According to the algorithm proposed in the paper [A general approach to derivative calculation using wavelet transform](https://doi.org/10.1016/j.chemolab.2003.08.001), a wavelet-based method can be used to suppress the noise.
This repositary uses this principle to calculate derivations.

The requirements for input data are

1. Time vector to be monotonic;
2. f value vector to be periodic.

The second requirement can be readily fulfilled for an acyclic signal by adding a dummy extrapolation to the original signal.

Furthermore, to suppress the boundary effect, a fake-repeat trick is suggested as shown in the example file.

# association law in wavelet transform

Let $g_\sigma(t)$ be a wavelet function, i.e.,

$g_\sigma^{(k)} (t)\equiv (d^k g_\sigma)/(dt^k )=0$,$t\rightarrow\infty$, $k$ =0,1,2,….,n.

Define derivative operator $D^{(k)}$ and convolution operator $*$

Then we have association law of two operators

$$D^{(k)} (g_\sigma* f)=(D^{(k)} g_\sigma )* f$$

``Proof``

It can be shown with a direct computation as follows (for simplicity, the subscript $\sigma$ is omitted)

$$\text{LHS}=\frac{d^k}{dt^k} \int_{-\infty}^{+\infty} f(\tau)g(t-\tau)  d\tau = \int_{-\infty}^{+\infty} f(\tau)  \frac{d^k}{dt^k} g(t-\tau)  d\tau=\text{RHS}$$

With $g_\sigma$ set as a Gaussian function, $\sigma$ as deviation, $g_\sigma$ tends to a Dirac delta function as $\sigma \rightarrow 0$, which exactly generates $f$ itself by convolution. In contrast, a non-zero $\sigma$ will smooth the noise contained in $f$.


## Cite As
Zhaoyi Yan (2021). Derivatives of the noisy signal based on Gaussian wavelet (https://www.mathworks.com/matlabcentral/fileexchange/102549-derivatives-of-the-noisy-signal-based-on-gaussian-wavelet), MATLAB Central File Exchange. Retrieved November 24, 2021.
