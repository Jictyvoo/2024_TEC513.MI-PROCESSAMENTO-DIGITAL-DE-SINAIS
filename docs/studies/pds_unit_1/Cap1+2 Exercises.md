## 2.9. Considere a equação de diferenças

A equação de diferenças dada é:

$$
y[n] - \frac{5}{6} y[n - 1] + \frac{1}{6} y[n - 2] = \frac{1}{3} x[n - 1].
$$

### (a) Quais são as respostas ao impulso, em frequência e ao degrau para um sistema LIT causal que satisfaça essa equação de diferenças?

### (b) Qual é a forma geral da solução homogênea dessa equação de diferenças?

### (c) Considere um sistema diferente que satisfaça a equação de diferenças, que não seja causal nem LIT, mas que tenha $y[0] = y[1] = 1$. Encontre a resposta desse sistema para $x[n] = \delta[n]$.

---

## 2.11 Considere um sistema LIT com a resposta em frequência dada por:

$$
H(e^{j \omega}) = \frac{1 - e^{-j 2 \omega}}{1 + \frac{1}{2} e^{-j 4 \omega}}, \quad -\pi < \omega \leq \pi.
$$

Determine a saída $y[n]$ para todo $n$ se a entrada $x[n]$ para todo $n$ for

$$
x[n] = \sin\left(\frac{\pi n}{4}\right)
$$

---

## 2.17.

### (a) Determine a transformada de Fourier da sequência

$$
r[n] =
\begin{cases}
1, & 0 \leq n \leq M \\
0, & \text{caso contrário}
\end{cases}
$$

### (b) Considere a sequência

$$
w[n] =
\begin{cases}
\frac{1}{2} \left[ 1 - \cos \left( \frac{2 \pi n}{M} \right) \right], & 0 \leq n \leq M \\
0, & \text{caso contrário}
\end{cases}
$$

Esboce $w[n]$ e expresse $W(e^{j \omega})$, a transformada de Fourier de $w[n]$, em termos de $R(e^{j \omega})$, a transformada de Fourier de $r[n]$.

**Dica:** Primeiro, expresse $w[n]$ em termos de $r[n]$ e das exponenciais complexas $e^{j \frac{2 \pi n}{M}}$ e $e^{-j \frac{2 \pi n}{M}}$.

### (c) Esboce a magnitude de $R(e^{j \omega})$ e $W(e^{j \omega})$ para o caso em que $M = 4$.

---

## 2.47. Considere o “sinal cosseno janelado”

$$
x[n] = w[n] \cos(\omega_0 n).
$$

### (a) Determine uma expressão para $X(e^{j \omega})$ em termos de $W(e^{j \omega})$.

### (b) Suponha que a sequência $w[n]$ seja a sequência de comprimento finito

$$
w[n] =
\begin{cases}
1, & -L \leq n \leq L \\
0, & \text{caso contrário}
\end{cases}
$$

Determine a Transformada de Fourier de Tempo Discreto (TFTD) $W(e^{j \omega})$.

**Dica:** Use as tabelas 2.2 e 2.3 para obter uma solução em "forma fechada". Você deverá verificar que $W(e^{j \omega})$ é uma função real de $\omega$.

### (c) Esboce a TFTD $X(e^{j \omega})$ para a janela em (b). Para um dado $\omega_0$, como $L$ deverá ser escolhido de modo que seu esboço mostre dois picos distintos?

---

## 2.53. Um sistema LIT tem a resposta em frequência

$$
H(e^{j \omega}) =
\begin{cases}
e^{-j \omega 3}, & | \omega | < \frac{2 \pi}{16}\left(\frac{3}{2}\right), \\
0, & \frac{2 \pi}{16} \left(\frac{3}{2}\right)\leq | \omega | \leq \pi
\end{cases}
$$

A entrada do sistema é um trem periódico de impulsos unitários com período $N = 16$; insto é,

$$
x[n] = \sum_{k=-\infty}^{\infty} \delta[n + 16k].
$$

Determine a saída do sistema.

---

## 4.4. O sinal de tempo contínuo

$$
x_c(t) = \sin(20 \pi t) + \cos(40 \pi t)
$$

é amostrado com um período de amostragem $T$ para a obtenção do sinal de tempo discreto

$$
x[n] = \sin\left(\frac{\pi n}{5}\right) + \cos\left(\frac{2 \pi n}{5}\right).
$$

### (a) Determine uma escolha para $T$ que seja consistente com essa informação.

### (b) Sua escolha para $T$ no item (a) é única? Se for, explique por quê. Se não, especifique outra escolha de $T$ que seja consistente com a informação dada.

---

## 4.6. Seja $h_c(t)$ a resposta ao impulso de um filtro de tempo contínuo LIT, e $h_d[n]$ a resposta ao impulso de um filtro de tempo discreto LIT.

### (a) Se

$$
h_c(t) =
\begin{cases}
e^{-at}, & t \geq 0 \\
0, & t < 0
\end{cases}
$$

sendo $a$ é uma constante real positiva, determine a resposta em frequência do filtro de tempo contínuo e esboce sua magnitude.

### (b) Se $h_d[n] = T h_c(nT)$ com $h_c(t)$ como no item (a), determine a resposta em frequência do filtro de tempo discreto e esboce a sua magnitude.

### (c) Para um valor dado de $a$, determine, em função de $T$, a magnitude mínima da resposta em frequência do filtro de tempo discreto.

---

## 4.10. Cada um dos seguintes sinais de tempo contínuo é usado como entrada $x_c(t)$ para um conversor C/D ideal, como mostrado na Figura 4.1 com o período de amostragem $T$ especificado. Em cada caso, encontre o sinal de tempo discreto $x[n]$ resultante.

![[assets/exercise_figs/fig_4.1.svg]]

### (a) $x_c(t) = \cos(2\pi(1000)t), \quad T = \frac{1}{3000} \, \text{s}$

### (b) $x_c(t) = \sin(2\pi(1000)t), \quad T = \frac{1}{1500} \, \text{s}$

### (c) $x_c(t) = \frac{\sin(2\pi(1000)t)}{\pi t}, \quad T = \frac{1}{5000} \, \text{s}$

---

## 4.15. Considere o sistema mostrado na Figura P4.15. Para cada um dos seguintes sinais de entrada $x[n]$, indique se a saída é $x_r[n] = x[n]$.

### (a) $x[n] = \cos\left(\frac{\pi n}{4}\right)$

### (b) $x[n] = \cos\left(\frac{\pi n}{2}\right)$

### (c) $x[n] = \left[\frac{\sin\left(\frac{\pi n}{8}\right)}{\pi n} \right]^2$

**Dica:** Use a propriedade de modulação da transformada de Fourier para encontrar $X(e^{j\omega})$.

![[assets/exercise_figs/fig_4.15.svg]]

---

## 4.28 Considere a representação do processo de amostragem seguido pela reconstrução mostrada na Figura P4.28.

![[assets/exercise_figs/fig_4.28.svg]]

Assuma que o sinal de entrada seja

$$
x_c(t) = 2 \cos(100 \pi t - \pi/4) + \cos(300 \pi t + \pi/3), \quad -\infty < t < \infty
$$

A resposta em frequência do filtro de reconstrução é:

$$
H_r(j\Omega) =
\begin{cases}
T, & |\Omega| \leq \frac{\pi}{T} \\
0, & |\Omega| > \frac{\pi}{T}
\end{cases}
$$

### (a) Determine a transformada de Fourier de tempo contínuo $X_c(j\Omega)$ e a esboce como uma função de $\Omega$.

### (b) Suponha que $f_s = \frac{1}{T} = 500$ amostras/s e esboce a transformada de Fourier $X_s(j\Omega)$ em função de $\Omega$ para $-\frac{2\pi}{T} \leq \Omega \leq \frac{2\pi}{T}$. Qual é a saída $x_r(t)$ nesse caso? (Você deverá ser capaz de dar uma expressão exata para $x_r(t)$).

### (c) Agora, suponha que $f_s = \frac{1}{T} = 250$ amostras/s. Repita o item (b) para essa condição.

### (d) É possível escolher a taxa de amostragem de modo que

$$
x_r(t) = A + 2 \cos(100 \pi t - \pi/4),
$$

sendo $A$ uma constante? Nesse caso, qual é a taxa de amostragem $f_s = \frac{1}{T}$, e qual é o valor numérico de $A$?
