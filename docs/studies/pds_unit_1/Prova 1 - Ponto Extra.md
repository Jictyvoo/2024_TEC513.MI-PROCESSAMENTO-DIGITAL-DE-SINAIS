TEC430 - Processamento Digital de Sinais
**Nome:** João Victor Oliveira Couto

---

**Valor total:** 1,5 pontos

---

## 1. Responda sucintamente aos seguintes enunciados:

#### a) **(0,2 pontos)** No processo de conversão contínua/discreta, comente as diferenças dos espectros para sinais a tempo contínuo realizados pela amostragem periódica ideal, natural e de topo plano

##### `1. Amostragem Periódica Ideal`

Consiste em capturar amostras do sinal contínuo, como se o sinal fosse multiplicado por um trem de impulsos (delta de Dirac) uniformemente espaçados. Então basicamente para cada ponto do trem de impulsos, o valor exato no mesmo ponto do tempo do sinal é amostrado.

- **Espectro**: A amostragem ideal replica o espectro original do sinal contínuo a cada múltiplo da frequência de amostragem $(f_s$). O espectro resultante é o espectro original do sinal contínuo, repetido de forma periódica a cada $f_s$.

##### `2. Amostragem Natural`

O sinal é multiplicado por um trem de pulsos retângulares, cuja as amostras têm uma largura finita, mas o valor das amostras varia de acordo com o valor do sinal contínuo naquele intervalo.

- **Espectro**: Ao contrário da amostragem ideal, onde o espectro do sinal é copiado de forma exata e repetida, a amostragem natural introduz uma leve distorção no espectro. No domínio da frequência, haverá uma convolução do espectro do sinal a ser amostrado com o da portadora (trem de pulsos retangulares). O espectro da portadora é caracterizado como uma _sinc_.

  Vale ressaltar que o espectro do sinal amostrado continuará a ser periodicamente repetido, mas é suavizado pela função de _sinc_ correspondente à forma retangular das amostras.

##### `3. Amostragem Flat-Top (Topo Plano)`

Essa amostragem é similar à amostragem natural, possuindo como diferença o fato de geralmente ser utilizado um segurador de ordem 0, fazendo com que o valor da amostra seja mantido constante durante todo o intervalo de amostragem.

- **Espectro**: A amostragem flat-top introduz uma distorção mais pronunciada no espectro, comparada à amostragem natural. Assim como a amostragem natural, o espectro resultante também será ponderado por uma _sinc_, derivado do trem de pulsos da portadora. Porém, diferentemente da amostragem natural, haverá uma maior atenuação, especialmente nas frequências altas. Isso acontece pois o valor amostrado é mantido constante por um período de tempo maior se comparado à outra amostragem.

#### **Resumo das Diferenças**:

- **Amostragem Ideal**: Mantém o espectro exato do sinal, com cópias periódicas, mas é suscetível a aliasing.
- **Amostragem Natural**: Introduz uma leve atenuação das altas frequências, agindo como um filtro passa-baixas suave.
- **Amostragem de Topo Plano**: Introduz uma atenuação mais forte nas altas frequências, causando uma maior distorção do espectro.

#### b) **(0,2 pontos)** Se o objetivo é reconstruir um sinal a tempo contínuo a partir de suas amostras, como é o processo de reconstrução exata?

A reconstrução exata de um sinal contínuo a partir de suas amostras é possível sob certas condições e envolve o uso de um filtro apropriado. O processo de reconstrução baseia-se no **Teorema da Amostragem de Nyquist-Shannon**, que estabelece as condições sob as quais um sinal contínuo pode ser recuperado de suas amostras de forma perfeita.

No processo de amostragem, devemos levar em consideração o teorema da amostragem, que nos diz que a frequencia de amostragem $(f_s)$ deve ser pelo menos maior ou igual ao dobro da frequência máxima do sinal a ser amostrado.

$$
\begin{align}
f_s \geq 2f_{\text{max}}\\
\\
&\text{onde } f_{\text{max}} \text{ é a maior frequência do espectro do sinal.}
\end{align}
$$

Caso essa regra não seja respeitada ocorre o **aliasing**, onde as cópias espectrais se sobrepõem e distorcem a versão discreta do sinal, impedindo o sinal contínuo de ser recuperado com precisão.

No domínio da frequência, a reconstrução exata pode ser vista como passar o sinal amostrado por um filtro passa-baixas que remove as cópias espectrais acima da frequência de Nyquist, preservando apenas a parte do espectro que pertence ao sinal original.

---

## 2. Considere a representação do processo de amostragem seguido pela reconstrução mostrada na figura abaixo:

![[prova1_extra_sinal_sistema.png]]

Assuma o sinal de entrada $x_c(t) = 2\cos(1000\pi t) + \cos(2000\pi t), -\infty < t < \infty$.  
A resposta em frequência do filtro de reconstrução é:

$$
H_r(j\omega) = \begin{cases}
T, & |\omega| \leq \pi/T \\
0, & |\omega| > \pi/T
\end{cases}
$$

#### a) **(0,2 pontos)** Determine e esboce o espectro de $x_c(j\omega)$, quando for amostrado pelo trem de impulsos $s(t)$, com período de amostragem de $T = 1/3000$ s.

É necessário encontrar o espectro do sinal, sendo representado pela transformada de Fourier:

$$
X(j\omega) = \int_{-\infty}^{\infty} x_c(\tau) \cdot e^{-j\omega\tau} d\tau
$$

Resolvendo a transformada aplicando o sinal $x_c$:

$$
\begin{align}
X(j\omega) = \int_{-\infty}^{\infty} 2\cos(1000\pi \tau) + \cos(2000\pi \tau) \cdot e^{-j\omega\tau} d\tau \\
X(j\omega) = 2\int_{-\infty}^{\infty} \cos(1000\pi \tau) \cdot e^{-j\omega\tau} d\tau + \int_{-\infty}^{\infty} \cos(2000\pi \tau) \cdot e^{-j\omega\tau} d\tau \\
\therefore
X(j\omega) = 2 \mathcal{F}\{\cos 1000\pi\tau\} + \mathcal{F}\{\cos 2000\pi\tau\}
\end{align}
$$

De modo a facilitar a resolução, será utilizada a seguinte propriedade da transformada de Fourier:

$$
\mathcal{F}\{\cos(\omega_{0} t)\} = \pi \left[\delta(\omega - \omega_{0}) + \delta(\omega + \omega_{0})\right]
$$

- Para $\cos(1000\pi \tau)$, temos:
  - $\mathcal{F}\{\cos(1000\pi \tau)\} = \pi \left[\delta(\omega - 1000\pi) + \delta(\omega + 1000\pi)\right]$
- Para $\cos(2000\pi t)$, temos:
  - $\mathcal{F}\{\cos(2000\pi t)\} = \pi \left[\delta(\omega - 2000\pi) + \delta(\omega + 2000\pi)\right]$

Portanto, a transformada de Fourier de $x_c(t)$ é:

$$
X(j\omega) = 2\pi \left[\delta(\omega - 1000\pi) + \delta(\omega + 1000\pi)\right] + \pi \left[\delta(\omega - 2000\pi) + \delta(\omega + 2000\pi)\right]
$$

Segundo a fórmula para a transformada de um sinal contínuo no tempo amostrado por um trem de impulsos:

$$
x_s(t) = \sum_{n=-\infty}^{\infty} x(n\tau) \delta(t-n\tau)
\xleftrightarrow{\text{FT}}
X_s(j\omega) = \frac{1}{\tau} \sum_{k=-\infty}^{\infty} X(j(\omega - k\frac{2\pi}{\tau}))
$$

Como o período de amostragem é $T = \frac{1}{3000}$ segundos, jogando na fórmula $f=\frac{1}{T}$ temos que a frequência de amostragem $f_s = 3000 \, \text{Hz}$, ou, em termos de frequência angular $\omega_s = 2\pi f_s = 6000\pi \, \text{rad/s}$.

###### Espectro do Sinal Amostrado $X_s(j\omega)$

O espectro do sinal amostrado $X_s(j\omega)$ é obtido replicando o espectro original $X_c(j\omega)$ a cada múltiplo de $\omega_s = 6000\pi$. Com base no valor de $\omega_s$ calculado, ao substituir o mesmo, temos que a fórmula para o espectro do sinal amostrado será:

$$
X_s(j\omega) = \frac{1}{3000} \sum_{k=-\infty}^{\infty} X_c\left(j(\omega - 6000k\pi)\right)
$$

Isso significa que o espectro do sinal amostrado será a soma de cópias do espectro original deslocadas por múltiplos de $\omega_s$. Cada cópia será deslocada por $k\omega_s = 6000k\pi$, onde $k$ é um inteiro positivo ou negativo.

Para tentar visualizar melhor, podemos substituir o espectro do sinal na fórmula:

$$
\begin{align}
X_s(j\omega) = \frac{1}{3000} \sum_{k=-\infty}^{\infty} \\
2\pi \left[ \delta(\omega - 6000k\pi - 1000\pi) + \delta(\omega - 6000k\pi + 1000\pi) \right] \\
+ \pi \left[ \delta(\omega - 6000k\pi - 2000\pi) + \delta(\omega - 6000k\pi + 2000\pi) \right] \\
\\
\\
\therefore
X_s(j\omega) = \frac{1}{3000} \sum_{k=-\infty}^{\infty} \\
2\pi \left[ \delta(\omega - 1000\pi(6k - 1)) + \delta(\omega - 1000\pi(6k + 1)) \right] \\
+ \pi \left[ \delta(\omega -2000\pi(3k-1)) + \delta(\omega - 2000\pi(3k+1)) \right]
\end{align}
$$

##### `Cálculo da Frequência Linear:`

Para realizar o cálculo da frequência do sinal, usamos a equação geral de uma função cossenoidal, que é conhecida como **equação da forma fasorial** ou **equação de uma onda cossenoidal**:

$$
x(t) = A \cos(\omega t + \phi_{0})
$$

onde:

- $x(t)$ é o nosso sinal no domínio do tempo
- $A$ é a amplitude do sinal, ou seja, o valor máximo que o sinal pode atingir
- $\omega$ é a **frequência angular** do sinal, medida em radianos por segundo (rad/s)
- $t$ é o tempo
- $\phi_0$ é a fase inicial do sinal, que define onde a onda começa no tempo

A frequência angular $\omega$ está relacionada à **frequência linear** $f$ (em Hz) pela equação $\omega = 2\pi f$

Assim, para determinar a frequência linear $f$, dividimos a frequência angular $\omega$ por $2\pi$.

- Para o termo $2\cos(1000\pi t)$, a frequência angular é $\omega_1 = 1000\pi \, \text{rad/s}$. A frequência linear correspondente é:

  $$
  f_1 = \frac{1000\pi}{2\pi} = 500 \, \text{Hz}
  $$

- Para o termo $\cos(2000\pi t)$, a frequência angular é $\omega_2 = 2000\pi \, \text{rad/s}$. A frequência linear correspondente é:

  $$
  f_2 = \frac{2000\pi}{2\pi} = 1000 \, \text{Hz}
  $$

- O sinal original tem componentes de frequência $f_1=500 \,\text{Hz}$ e $f_2 = 1000 \, \text{Hz}$.

##### `Esboço do Espectro do Sinal:`

Ao esboçar o espectro amostrado, devemos incluir as réplicas do espectro original em múltiplos de $6000\pi$. O esboço deve mostrar:

- Um pico em $1000\pi$ e $2000\pi$ rad/s.
  - Ou $500\text{Hz}$ e $1000\text{Hz}$
- O espectro será replicado com espaçamento de $6000k\pi \, \text{rad/s}$ (ou $3000k\, \text{Hz}$) entre as réplicas, para valores inteiros de $k$.
  - Réplicas em:
    - $\pm 1000\pi \pm  6000k\pi$, $\pm 2000\pi \pm  6000k\pi$.
    - $\pm 500\text{Hz} \pm 3000k\text{Hz}$, $\pm 1000\text{Hz} \pm 3000k\text{Hz}$

![[prova1_quest02_a_sampling_signal.png]]

#### b) **(0,3 pontos)** Supondo o filtro de reconstrução $H_r(j\omega)$, expresse o sinal reconstruído $x_r(t)$.

De antemão, ao se analisar faixas de frequencia do sinal, observa-se que as componentes $500 \, \text{Hz}$ e $1000 \, \text{Hz}$ estão bem abaixo de $f_s / 2$, logo, segundo o teorema da amostragem, o sinal pode ser reconstruído sem aliasing.

##### Condição do Filtro

O filtro $H_r(j\omega)$ passa apenas as componentes do espectro que estão dentro do intervalo $\left[-\frac{\pi}{T}, \frac{\pi}{T}\right]$, ou seja:

$$
\begin{align}
-\frac{\pi}{T} \leq \omega \leq \frac{\pi}{T} \quad \\
\\
\therefore
\quad -3000\pi \leq \omega \leq 3000\pi \\
\end{align}
$$

##### Composição do Sinal Reconstruído

O sinal reconstruído $x_r(t)$ é dado por:

$$
x_r(t) = \mathcal{F}^{-1} \{ H_r(j\omega) X_s(j\omega) \}
$$

Assim, apenas as componentes de $X_c(j\omega)$ que estão dentro da faixa de passagem do filtro serão recuperadas. As componentes $\delta$ de $X_c(j\omega)$ localizadas em $1000\pi$ e $2000\pi$ são (para $k=0$):

- $\delta(\omega - 1000\pi)$
- $\delta(\omega + 1000\pi)$
- $\delta(\omega - 2000\pi)$
- $\delta(\omega + 2000\pi)$

Portanto, o sinal reconstruído $x_r(t)$ será:

$$
x_r(t) = 2\cos(1000\pi t) + \cos(2000\pi t)
$$

O que comprova o que foi dito anteriormente sobre o sinal poder ser reconstruído sem _aliasing_ por satisfazer o teorema da amostragem de _Nyquist-Shannon_.

#### c) **(0,3 pontos)** Se o período de amostragem for $T = 1/1750$ s, expresse o sinal reconstruído $x_r(t)$ e comente o resultado obtido.

$$
 f_s = \frac{1}{T} = 1750 \, \text{Hz}
$$

Aplicando no filtro de reconstrução $H_r(j\omega)$, temos que:

$$
\begin{align}
-\frac{\pi}{T} \leq \omega \leq \frac{\pi}{T} \quad \\
\\
\therefore
\quad -1750\pi \leq \omega \leq 1750\pi \\
\end{align}
$$

Sabendo as frequências correspondentes do sinal a ser amostrado como:

- $1000\pi \, \text{rad/s}$ (ou $500 \, \text{Hz}$)
- $2000\pi \, \text{rad/s}$ (ou $1000 \, \text{Hz}$)

E através do que já foi discutido a respeito do teorema da amostragem, pode-se afirmar de antemão que esse sinal possuirá o chamado *aliasing*, devido à sobreposição do sinal no domínio da frequência.

Isso ocorre porque a frequência máxima do sinal ($f_{max} = 2000\text{Hz}$) acaba sendo menor que a frequencia de amostragem ($f_s = 1750\text{Hz}$) não satisfazendo *Nyquist-Shannon*.
##### Analisando a amostragem do sinal

O espectro do sinal amostrado, nesse caso será:

$$
X_s(j\omega) = \frac{1}{1750} \sum_{k=-\infty}^{\infty} X_c\left(j(\omega - 3500k\pi)\right)
$$

Isso significa que cada cópia do espectro do sinal será deslocada por $k\omega_s = 3500k\pi$, onde $k$ é um inteiro positivo ou negativo.

Para tentar visualizar melhor, podemos substituir o espectro do sinal na fórmula:

$$
\begin{align}
X_s(j\omega) = \frac{1}{1750} \sum_{k=-\infty}^{\infty} \\
2\pi \left[ \delta(\omega - 3500k\pi - 1000\pi) + \delta(\omega - 3500k\pi + 1000\pi) \right] \\
+ \pi \left[ \delta(\omega - 3500k\pi - 2000\pi) + \delta(\omega - 3500k\pi + 2000\pi) \right] \\
\end{align}
$$

##### Substituindo o valor de $k$ em pontos específicos

###### Para $k=0$ temos:
$$
\begin{align}
X_s(j\omega) = \frac{1}{1750} \cdot
2\pi \left[ \delta(\omega - 1000\pi) + \delta(\omega + 1000\pi) \right]
+ \pi \left[ \delta(\omega - 2000\pi) + \delta(\omega + 2000\pi) \right] \\
\end{align}
$$

###### Para $k=1$ temos:
$$
\begin{align}
X_s(j\omega) = \frac{1}{1750} \cdot
2\pi \left[ \delta(\omega - 4500\pi) + \delta(\omega - 2500\pi) \right]
+ \pi \left[ \delta(\omega - 5500\pi) + \delta(\omega - 1500\pi) \right] \\
\end{align}
$$
A segunda componente $2000\pi \, \text{rad/s}$, que está fora da faixa de *Nyquist*, sofrerá **aliasing** e será refletida para dentro da banda de *Nyquist*.

Essa componente, que originalmente estava em $2000\pi \, \text{rad/s}$, será replicada para a frequência:
$$
\omega_{\text{alias}} = -1500\pi \, \text{rad/s}
$$

Portanto, o espectro amostrado terá as seguintes frequências dentro da faixa de Nyquist:

- A componente em $1000\pi \, \text{rad/s}$ ($500 \, \text{Hz}$) será preservada.
- A componente em $2000\pi \, \text{rad/s}$ será refletida para $-1500\pi \, \text{rad/s}$ ($-750 \, \text{Hz}$) após aliasing.

Logo, o sinal reconstruído será:

$$
x_r(t) = 2\cos(1000\pi t) + \cos(1500\pi t)
$$

#### d) **(0,3 pontos)** É possível obter um sinal reconstruído na forma $x_r(t) = A + 2\cos(1000\pi t)$? Onde $A$ é o componente DC do sinal. Se for, para qual valor de $T$ é possível?

Para que o sinal seja reconstruído na forma $x_r(t) = A + 2\cos(1000\pi t)$, a componente de $\cos(2000\pi t)$ precisa ser  eliminada.

Uma das formas de fazer isso é através do *aliasing*, e o mesmo irá ocorrer se a componente $\cos(2000\pi t)$ for mapeada para uma frequência inferior a $f_s/2$ devido à periodicidade do espectro.

O espectro amostrado $X_s(j\omega)$ é uma repetição periódica do espectro $X(j\omega)$ deslocada por múltiplos inteiros de $\frac{2\pi}{T}$. Logo, para obter $A$ como a componente DC, precisamos que $2000\pi$ seja mapeado para a frequência 0.

A frequência de amostragem $f_s$ deve ser igual a $2000 \, \text{Hz}$, ou seja, $T = \frac{1}{2000} \, \text{s}$. Nesse caso, o período de amostragem é:

$$
T = \frac{1}{2000} \, \text{s} = 5 \times 10^{-4} \, \text{s} \quad (\text{ou } 500 \, \mu\text{s})
$$

Com esse valor de $T$, a frequência de $1000 \, \text{Hz}$ (ou $1000\pi \, \text{rad/s}$) ainda estará abaixo da frequência de Nyquist $\frac{f_s}{2} = 1000 \, \text{Hz}$, e a frequência de $2000 \, \text{Hz}$ (ou $2000\pi \, \text{rad/s}$) será sobreposta à componente DC, resultando na forma:

$$
x_r(t) = A + 2\cos(1000\pi t)
$$

Logo, é sim possível obter um sinal reconstruído na forma $x_r(t) = A + 2\cos(1000\pi t)$.

---
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.


> **Boa sorte!**

_“A natureza é maravilhosa e compreender seus fenômenos através do processamento de sinais é fundamental para podermos interagir com ela.”_
