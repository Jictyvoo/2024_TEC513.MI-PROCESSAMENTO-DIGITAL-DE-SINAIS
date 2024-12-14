## Transformadas $z$ Básicas

| Sinal                       | Transformada                                                               | RDC                  |
| --------------------------- | -------------------------------------------------------------------------- | -------------------- |
| $\delta[n]$                 | $1$                                                                        | Todos $z$            |
| $u[n]$                      | $\frac{1}{1 - z^{-1}}$                                                     | $\|z\| > 1$          |
| $\alpha^n u[n]$             | $\frac{1}{1 - \alpha z^{-1}}$                                              | $\|z\| > \|\alpha\|$ |
| $n \alpha^n u[n]$           | $\frac{\alpha z^{-1}}{(1 - \alpha z^{-1})^2}$                              | $\|z\| > \|\alpha\|$ |
| $[\cos{(\Omega_1 n)}] u[n]$ | $\frac{1 - z^{-1} \cos \Omega_1}{1 - z^{-1} 2\cos \Omega_1 + z^{-2}}$      | $\|z\| > 1$          |
| $[\sin(\Omega_1 n)] u[n]$   | $\frac{z^{-1} \sin \Omega_1}{1 - z^{-1} 2\cos \Omega_1 + z^{-2}}$          | $\|z\| > 1$          |
| $r^n \cos(\Omega_1 n) u[n]$ | $\frac{1 - z^{-1} r\cos{\Omega_1}}{1 - z^{-1} 2r\cos{\Omega_1}+r^2z^{-2}}$ | $\|z\| > r$          |
| $r^n \sin(\Omega_1 n) u[n]$ | $\frac{1 - z^{-1} r\sin{\Omega_1}}{1 - z^{-1} 2r\cos{\Omega_1}+r^2z^{-2}}$ | $\|z\| > r$          |

## Transformadas Bilaterais de Sinais Não-Nulos para $n < 0$

| **Sinal**             | **Transformada Bilateral**                    | **RDC**              |
| --------------------- | --------------------------------------------- | -------------------- |
| $u[-n-1]$             | $\frac{1}{1 - z^{-1}}$                        | $\|z\| < 1$          |
| $-\alpha^{n}u[-n-1]$  | $\frac{1}{1 - \alpha z^{-1}}$                 | $\|z\| < \|\alpha\|$ |
| $-n\alpha^{n}u[-n-1]$ | $\frac{\alpha z^{-1}}{(1 - \alpha z^{-1})^2}$ | $\|z\| < \|\alpha\|$ |

## Propriedades da Transformada $z$

| Propriedade                | Sinal                                   | Transformada Unilateral          | Transformada Bilateral                | Região de Convergência (RDC)                                        |
| -------------------------- | --------------------------------------- | -------------------------------- | ------------------------------------- | ------------------------------------------------------------------- |
| Transformada de $x[n]$     | $x[n]$                                  | $X(z)$                           | $X(z)$                                | $R_x$                                                               |
| Transformada de $y[n]$     | $y[n]$                                  | $Y(z)$                           | $Y(z)$                                | $R_y$                                                               |
| Linearidade                | $ax[n] + by[n]$                         | $aX(z) + bY(z)$                  | $aX(z) + bY(z)$                       | No mínimo $R_x \cap R_y$                                            |
| Deslocamento no Tempo      | $x[n-k]$                                | Veja abaixo                      | $z^{-k} X(z)$                         | $R_x$, com exceção, possivelmente, de $\|z\| = 0, \infty$           |
| Inversão no Tempo          | $x[-n]$                                 | -                                | $X\left(\frac{1}{z}\right)$           | $\frac{1}{R_x}$                                                     |
| Escalonamento no Domínio-Z | $\alpha^n x[n]$                         | $X\left(\frac{z}{\alpha}\right)$ | $X\left(\frac{z}{\alpha}\right)$      | $\|\alpha\| R_x$                                                    |
| Escalonamento no Tempo     | $x[n/k]$                                | -                                | $X(z^k)$                              | $\text{ROC}^{1/k}$                                                  |
| Conjugação                 | $\overline{x[n]}$                       | -                                | $\overline{X}(\overline{z})$          | $R_x$                                                               |
| Convolução                 | $x[n] * y[n]$                           | $X(z) Y(z)$                      | $X(z) Y(z)$                           | No mínimo $R_x \cap R_y$                                            |
| Diferenciação no Domínio-Z | $nx[n]$                                 | $-z \frac{d}{dz} X(z)$           | $-z \frac{d}{dz} X(z)$                | $R_x$, com exceção, possivelmente, da adição ou exclusão de $z = 0$ |
| Teorema de Parseval        | $\sum_{n=-\infty}^{\infty} x[n] x^*[n]$ | -                                | $\int_{-\pi}^{\pi} F(z) F^*(z) \, dz$ | $R_x$                                                               |

#### Propriedade: Deslocamento no Tempo da Transformada $z$ Unilateral

Para o sinal $x[n-k]$ e $x[n+k]$, a Transformada Z Unilateral é dada por:

$$
\begin{align*}
x[n-k] \xleftrightarrow{Z_u} x[-k] + x[-k + 1]z^{-1} + \dots + x[-1]z^{-k+1}+z^{-k}X(z)\, \text{para} \, k > 0 \\
x[n+k] \xleftrightarrow{Z_u} -x[0]z^k - x[1]z^{k-1} - \dots - x[k-1]z + z^k X(z)\, \text{para}\, k>0
\end{align*}
$$
