## 7.21 Given the $z\text{-transform}$ pair $x[n] \xleftrightarrow{z} \frac{z^2}{z^2 - 16}$, with ROC $|z| < 4$, use the $z\text{-transform}$ of the following signals:

#### (a) $y[n] = x[n-2]$

# 7.22 Given the $z\text{-transform}$ pair $n^2 3^n \cdot u[n] \xleftrightarrow{z} X(z)$, use the $z\text{-transform}$ properties to determine the time-domain signals corresponding to the following $z$ transforms:

#### (c) $Y(z) = \frac{d}{dz} X(z)$

# 7.24 Use the method of partial fractions to obtain the time-domain signals corresponding to the following $z\text{-transform}$:

#### (a) $X(z) = \frac{1+\frac{7}{6}z^{-1}}{\left(1 - \frac{1}{2} z^{-1} \right) \left( 1 + \frac{1}{3} z^{-1} \right)}\, \text{, } |z| > \frac{1}{2}$

# 7.26 Use the following clues to determine the signals $x[n]$ and rational $z\text{-transform}$ $X(z)$:

#### (a) $X(z)$ has poles at $z = 1/2$ and $z = -1$, $x[1] = 1$, $x[-1] = 1$, and the ROC includes the point $z = 3/4$.

# 7.27 Determine the impulse response corresponding to the following transfer functions if `(i) the system is stable` or `(ii) the system is causal`:

#### (a) $H(z) = \frac{2-\frac{3}{2} z^{-1}}{(1 - 2 z^{-1}) \left(1 + \frac{1}{2} z^{-1} \right)}$

#### (b) $H(z) = \frac{5 z^2}{z^2 - z - 6}$

#### (c) $H(z) = \frac{4z}{z^2 - \frac{1}{4}z + \frac{1}{16}}$

# 7.32 Determine `(i) transfer function` and `(ii) difference equation` representations of the systems with the following impulse responses:

#### (b) $h[n] = (\frac{1}{3})^n \cdot u[n] + (\frac{1}{2})^{n-2} \cdot u[n - 1]$

# 7.34 Determine whether each of the following systems is `(i) causal and stable` and `(ii) minimum phase`.

#### (a) $H(z) = \frac{2z + 3}{z^2 + z - \frac{5}{16}}$

#### (b) $y[n] - y[n-1] - \frac{1}{4}y[n-2] = 3x[n] - 2x[n-1]$

#### (c) $y[n] - 2y[n-2] = x[n] - \frac{1}{2}x[n-1]$

# 7.38 Draw block diagram implementations of the following systems as a cascade of second-order sections with real-values coefficients:

#### (a)

$$
H(z) =
\frac{\left( 1 - \frac{1}{4} e^{j\frac{\pi}{4}} z^{-1} \right) \left( 1 - \frac{1}{4} e^{-j\frac{\pi}{4}} z^{-1} \right)}{\left( 1 - \frac{1}{2} e^{j\frac{\pi}{3}} z^{-1} \right) \left( 1 - \frac{1}{2} e^{-j\frac{\pi}{3}} z^{-1} \right)}
\\
\cdot
\\
\frac{\left( 1 - \frac{1}{4} e^{j\frac{\pi}{8}} z^{-1} \right) \left( 1 - \frac{1}{4} e^{-j\frac{\pi}{8}} z^{-1} \right)}{\left( 1 - \frac{3}{4} e^{j\frac{7\pi}{8}} z^{-1} \right) \left( 1 - \frac{3}{4} e^{-j\frac{7\pi}{8}} z^{-1} \right)}
$$

#### (b)

$$
H(z) =
\frac{( 1 + 2z^{-1})^2 \left( 1 - \frac{1}{2} e^{j\frac{\pi}{2}} z^{-1} \right)}{\left( 1 - \frac{3}{8} z^{-1} \right) \left( 1 - \frac{3}{8} e^{j\frac{\pi}{3}} z^{-1} \right)}
\\
\cdot
\\
\frac{\left( 1 - \frac{1}{2} e^{-j\frac{\pi}{2}} z^{-1} \right)}{\left( 1 - \frac{3}{8} e^{-j\frac{\pi}{3}} z^{-1} \right) \left( 1 - \frac{3}{4} z^{-1} \right)}
$$

# 7.42 Use the unilateral $z\text{-transform}$ to determine the forced response, the natural response, and the complete response of the systems described by the following difference equations with the given inputs and initial conditions:

#### (a) $y[n] - \frac{1}{3} y[n-1] = 2x[n]$, $y[-1] = 1$, $x[n] = \left(\frac{-1}{2} \right)^n u[n]$
