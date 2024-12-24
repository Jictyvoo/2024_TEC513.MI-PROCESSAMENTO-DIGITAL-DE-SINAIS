### Transformada de Fourier

$$
X(j\omega) = \int_{-\infty}^{\infty} x(t) e^{-j \omega t} dt
$$

#### Em Tempo Discreto

$$
X(j\omega) = \sum_{n=-\infty}^{\infty} x[n] e^{-j\omega n}
$$

### Série de Fourier

A fórmula geral para a **Série de Fourier** de um sinal periódico $x(t)$ com período $T$ é dada por:

#### Forma Trigonométrica

$$
x(t) = a_0 + \sum_{n=1}^{\infty} \left( a_n \cos\left(\frac{2\pi n}{T}t\right) + b_n \sin\left(\frac{2\pi n}{T}t\right) \right)
$$

Onde:

- $a_0 = \frac{1}{T} \int_{0}^{T} x(t) \, dt$ é o coeficiente da componente DC.
- $a_n = \frac{2}{T} \int_{0}^{T} x(t) \cos\left(\frac{2\pi n}{T}t\right) \, dt$ são os coeficientes das componentes cossenoidais.
- $b_n = \frac{2}{T} \int_{0}^{T} x(t) \sin\left(\frac{2\pi n}{T}t\right) \, dt$ são os coeficientes das componentes senoidais.

---

#### Forma Complexa

Alternativamente, a Série de Fourier pode ser representada na forma complexa:

$$
x(t) = \sum_{k=-\infty}^{\infty} a_k e^{j \frac{2\pi k}{T} t}
$$

Onde:

- $a_k = \frac{1}{T} \int_{0}^{T} x(t) e^{-j \frac{2\pi k}{T} t} \, dt$ são os coeficientes complexos da série.

### Convolução no Domínio do Tempo

$$
y(t) = \int_{-\infty}^{\infty} x(\tau) h(t - \tau) d\tau
$$

### Soma Finita de Progressão Geométrica

$$
\sum_{k=0}^{n} r^k = \frac{1 - r^{n+1}}{1 - r}, \text{ para } \|r\| < 1
$$

# Somatórios

- $\sum_{n=0}^{M-1} \beta^n = \frac{1 - \beta^M}{1 - \beta}, \, \beta \neq 1$
- $\sum_{n=0}^{M-1} \beta^n = M, \, \beta = 1$
- $\sum_{n=k}^{l} \beta^n = \frac{\beta^k - \beta^{l+1}}{1 - \beta}, \, \beta \neq 1$
- $\sum_{n=k}^{l} \beta^n = l-k+1, \, \beta = 1$
- $\sum_{n=0}^\infty \beta^n = \frac{1}{1 - \beta}, \, |\beta| < 1$
- $\sum_{n=k}^\infty \beta^n = \frac{\beta^k}{1 - \beta}, \, |\beta| < 1$
- $\sum_{n=0}^\infty n\beta^n = \frac{\beta}{(1 - \beta)^2}, \, |\beta| < 1$
- $\sum_{k=1}^m k = \frac{m(m+1)}{2}$
- $\sum_{i=1}^m i^2 = \frac{m(m+1)(2m+1)}{6}$
- $\sum_{i=m}^n x_i = \sum_{i=m+p}^{n+p} x_{i}-p$

---

## Teoremas da Transformada de Fourier

| Sequência                         | Transformada de Fourier                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------- |
| $x[n]$                            | $X(e^{j\omega})$                                                                          |
| $y[n]$                            | $Y(e^{j\omega})$                                                                          |
| $ax[n] + by[n]$                   | $aX(e^{j\omega}) + bY(e^{j\omega})$                                                       |
| $x[n − n_d]$ ($n_d$ é um inteiro) | $e^{−j\omega n_d} X(e^{j\omega})$                                                         |
| $e^{j\omega₀n} x[n]$              | $X(e^{j(\omega − \omega₀)})$                                                              |
| $x[−n]$                           | $\begin{align} &X(e^{−j\omega}) \\&X∗(e^{j\omega}) \text{se }x[n]\text{ real}\end{align}$ |
| $nx[n]$                           | $j \frac{dX(e^{j\omega})}{d\omega}$                                                       |
| $x[n] ∗ y[n]$                     | $X(e^{j\omega})Y(e^{j\omega})$                                                            |
| $x[n]y[n]$                        | $\frac{1}{2\pi} \int_{−\pi}^{\pi} X(e^{j\theta})Y(e^{j(\omega − \theta)}) d\theta$        |

##### Teorema de Parseval

| Propriedade | Equação                                                                                                      |
| ----------- | ------------------------------------------------------------------------------------------------------------ |
|             | $\sum_{n=−\infty}^{\infty} \|x[n]\|^2   = \frac{1}{2\pi} \int_{−\pi}^{\pi} \| X(e^{j\omega}) \|^2 d\omega$   |
|             | $\sum_{n=−\infty}^{\infty} x[n]*y[n]   = \frac{1}{2\pi} \int_{−\pi}^{\pi} X(e^{j\omega})Y(e^j\omega)d\omega$ |

---

## Tabela de Pares Básicos de Série de Fourier

| Sinal no Tempo       | Série de Fourier                           |
| -------------------- | ------------------------------------------ |
| $1$                  | $a_0 = 1, a_n = 0, b_n = 0$                |
| $\cos(\omega_0 t)$   | $a_0 = 0, a_n = 1$ para $n=\pm 1, b_n = 0$ |
| $\sin(\omega_0 t)$   | $a_0 = 0, a_n = 0, b_n = 1$ para $n=\pm 1$ |
| $e^{j \omega_0 t}$   | $C_n = \delta[n-1]$                        |
| $u(t)$               | Série não convergente                      |
| $e^{j \omega_0 k t}$ | $C_n = \delta[n-k]$                        |

## Pares de Transformada de Fourier de Tempo Contínuo

| **Sinal no domínio do tempo**                | **Transformada de Fourier (domínio da frequência)**                                | **Condições/Notas**                           |
| -------------------------------------------- | ---------------------------------------------------------------------------------- | --------------------------------------------- |
| $\delta[n]$                                  | $1$                                                                                | Impulso unitário (tempo discreto)             |
| $1$                                          | $2\pi\delta(\omega)$                                                               | Sequência constante                           |
| $e^{j\omega_0 n}$                            | $2\pi\delta(\omega - \omega_0)$                                                    | Sequência exponencial complexa                |
| $\cos(\omega_0 n)$                           | $\pi[\delta(\omega - \omega_0) + \delta(\omega + \omega_0)]$                       | Sequência cosseno                             |
| $\sin(\omega_0 n)$                           | $j\pi[\delta(\omega + \omega_0) - \delta(\omega - \omega_0)]$                      | Sequência seno                                |
| $u[n]$ (degrau unitário em tempo discreto)   | $\frac{1}{1 - e^{-j\omega}} + \pi\delta(\omega)$                                   | Degrau discreto                               |
| $(a^n u[n]), \, \|a\| < 1$                   | $\frac{1}{1 - ae^{-j\omega}}$                                                      | $\|a\| < 1$                                   |
| $\text{rect}_N[n]$                           | $\frac{\sin(\omega N / 2)}{\sin(\omega / 2)} e^{-j\omega(N-1)/2}$                  | Janela retangular de largura $N$              |
| $\text{sinc}[n] = \frac{\sin(\pi n)}{\pi n}$ | $\text{rect} \left( \frac{\omega}{2\pi} \right)$                                   | Função sinc discreta                          |
| $\delta[n - n_0]$                            | $e^{-j\omega n_0}$                                                                 | Impulso deslocado                             |
| $e^{\lambda n}$                              | $\frac{1}{1 - e^{\lambda - j\omega}}$                                              |                                               |
| $\cos^2(\omega_0 n)$                         | $\pi[\delta(\omega - 2\omega_0) + \delta(\omega + 2\omega_0)] + \pi\delta(\omega)$ | Identidade trigonométrica usada para expandir |
| $(-1)^n$                                     | $2\pi\delta(\omega - \pi)$                                                         | Oscilação máxima discreta                     |

---

## Pares de Transformada de Fourier de Tempo Discreto

| Sequência                                                                                    | Transformada de Fourier                                                                                                                         |
| -------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| **1.** $\delta[n]$                                                                           | $1$                                                                                                                                             |
| **2.** $\delta[n - n_0]$                                                                     | $e^{-j \omega n_0}$                                                                                                                             |
| **3.** $1 \, (-\infty < n < \infty)$                                                         | $\sum_{k=-\infty}^{\infty} 2\pi\delta(\omega + 2\pi k)$                                                                                         |
| **4.** $a^n u[n] \, (\|a\| < 1)$                                                             | $\frac{1}{1 - ae^{-j \omega}}$                                                                                                                  |
| **5.** $u[n]$                                                                                | $\frac{1}{1 - e^{-j \omega}} + \sum_{k=-\infty}^{\infty} \pi\delta(\omega + 2\pi k)$                                                            |
| **6.** $(n + 1)a^n u[n] \, (\|a\| < 1)$                                                      | $\frac{1}{(1 - ae^{-j \omega})^2}$                                                                                                              |
| **7.** $r^n \frac{\sin \omega_p(n + 1)}{\sin \omega_p} u[n] \, (\|r\| < 1)$                  | $\frac{1}{1 - 2r \cos \omega_p e^{-j \omega} + r^2 e^{-j 2\omega}}$                                                                             |
| **8.** $\frac{\sin \omega_c n}{\pi n}$                                                       | $X(e^{j \omega}) = \begin{cases} 1, & \|\omega\| < \omega_c \\ 0, & \omega_c < \|\omega\| \leq \pi \end{cases}$                                 |
| **9.** $x[n] = \begin{cases} 1, & 0 \leq n \leq M \\ 0, & \text{caso contrário} \end{cases}$ | $\frac{\sin[\omega(M + 1) / 2]}{\sin(\omega / 2)} e^{-j \omega M / 2}$                                                                          |
| **10.** $e^{j \omega_0 n}$                                                                   | $\sum_{k=-\infty}^{\infty} 2\pi\delta(\omega - \omega_0 + 2\pi k)$                                                                              |
| **11.** $\cos(\omega_0 n + \phi)$                                                            | $\sum_{k=-\infty}^{\infty} \left[\pi e^{j \phi} \delta(\omega - \omega_0 + 2\pi k) + \pi e^{-j \phi} \delta(\omega + \omega_0 + 2\pi k)\right]$ |

| **Operação no tempo discreto**          | **Transformada de Fourier (DTFT)**                                                     | **Observações**                                                  |
| --------------------------------------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| $y[n]$                                  | $Y(e^{j\omega})$                                                                       | Definição básica.                                                |
| $y[n - n_0]$                            | $e^{-j\omega n_0} Y(e^{j\omega})$                                                      | Deslocamento no tempo causa mudança de fase.                     |
| $e^{j\omega_0 n} y[n]$                  | $Y(e^{j(\omega - \omega_0)})$                                                          | Mudança de frequência central.                                   |
| $y[-n]$                                 | $Y(e^{-j\omega})$                                                                      | Inversão no tempo resulta em conjugado espelhado.                |
| $y[n] \cdot w[n]$                       | $\frac{1}{2\pi} \int_{-\pi}^{\pi} Y(e^{j\theta}) W(e^{j(\omega - \theta)}) d\theta$    | Convolução no domínio da frequência.                             |
| $y[n] * w[n]$                           | $Y(e^{j\omega}) W(e^{j\omega})$                                                        | Convolução no tempo vira multiplicação no domínio da frequência. |
| $\delta[n - n_0]$                       | $e^{-j\omega n_0}$                                                                     | Transformada de um impulso deslocado.                            |
| $\cos(\omega_0 n) \cdot y[n]$           | $\frac{1}{2} \left[ Y(e^{j(\omega - \omega_0)}) + Y(e^{j(\omega + \omega_0)}) \right]$ | Modulação em cosseno.                                            |
| $(a^n) y[n] \, (\text{com } \|a\| < 1)$ | $Y(e^{j\omega + a})$                                                                   | Multiplicação por exponencial decrescente.                       |
| $n \cdot y[n]$                          | $j \frac{d}{d\omega} Y(e^{j\omega})$                                                   | Multiplicação por $n$ no tempo é derivada na frequência.         |
| $y[n] e^{-an} u[n]$                     | $Y(e^{j\omega + a})$                                                                   | Multiplicação por exponencial decrescente.                       |

## Pares de Transformada de Fourier em Tempo Contínuo

| **Sinal no Tempo $x(t)$**             | **Transformada de Fourier $X(j\omega)$**                               | **Observações**                                     |
| ------------------------------------- | ---------------------------------------------------------------------- | --------------------------------------------------- |
| $\delta[n]$                           | $1$                                                                    | Impulso unitário (tempo discreto)                   |
| $1$                                   | $2\pi\delta(\omega)$                                                   | Função constante                                    |
| $e^{j\omega_0 n}$                     | $2\pi\delta(\omega - \omega_0)$                                        | Exponencial complexa                                |
| $\cos(\omega_0 n)$                    | $\pi[\delta(\omega - \omega_0) + \delta(\omega + \omega_0)]$           | Cosseno                                             |
| $\sin(\omega_0 n)$                    | $\frac{\pi}{j}[\delta(\omega + \omega_0) - \delta(\omega - \omega_0)]$ | Seno                                                |
| $e^{-at}u(t)$, $a>0$                  | $\frac{1}{1 + j\omega}$                                                | Exponencial decrescente (função degrau)             |
| $e^{at}u(-t), \, a > 0$               | $\frac{1}{a - j\omega}$                                                | Exponencial crescente                               |
| $u(t)$                                | $\frac{1}{j\omega}+\pi\delta(\omega)$                                  | Função degrau unitário                              |
| $tu(t)$                               | $\frac{1}{(j\omega)^2}$                                                | Rampa (função linear)                               |
| $sinc{(t)}=\frac{\sin{\pi t}}{\pi t}$ | $rect(\omega)$                                                         | Função sinc, a transformada é um retângulo          |
| $rect(t)$                             | $sinc(\omega)$                                                         | Pulso retangular                                    |
| $e^{-at} \cos{(\omega_0 t)} u(t)$     | $\frac{a+j\omega}{(a+j\omega)^2 + \omega_0^2}$                         | Exponencial amortecida com cosseno                  |
| $e^{-at} \sin{(\omega_0 t)} u(t)$     | $\frac{\omega_0}{(a+j\omega)^2 + \omega_0^2}$                          | Exponencial amortecida com seno                     |
| $tri(t)$                              | $\text{sinc}^2(\omega)$                                                | Pulso triangular                                    |
| $\delta(t-t_0)$                       | $e^{-j\omega t_0}$                                                     | Impulso deslocado                                   |
| $x(t-t_0)$                            | $X(j\omega) e^{-j\omega t_0}$                                          | Deslocamento no tempo                               |
| $x(t)\cdot e^{j\omega_0 t}$           | $X(j(\omega - \omega_0))$                                              | Modulação por exponencial                           |
| $x(t) \cdot \cos{(\omega_0 t)}$       | $\frac{1}{2} [X(j(\omega - \omega_0)) + X(j(\omega + \omega_0))]$      | Modulação por cosseno                               |
| $x(t) \cdot \sin{(\omega_0 t)}$       | $\frac{1}{2j} [X(j(\omega - \omega_0)) - X(j(\omega + \omega_0))]$     | Modulação por seno                                  |
| $x(t) * h(t)$                         | $X(j\omega)H(j\omega)$                                                 | Convolução no tempo <-> Multiplicação na frequência |
