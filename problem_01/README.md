# Problema 1: Análise Matemática Comparativa da Amostragem de Sinais Analógicos

## 1.1 Tema: Aliasing, teorema da amostragem, Nyquist-Shannon, subamostragem, reconstrução do sinal.

## 1.2 Cronograma:

| Data  | Grupo Tutorial                                       |
| ----- | ---------------------------------------------------- |
| 21/08 | Apresentação do Problema 01 – PBL                    |
| 23/08 | Problema 01 – PBL                                    |
| 28/08 | Problema 01 – PBL                                    |
| 30/08 | Problema 01 – PBL                                    |
| 04/09 | Problema 01 – PBL                                    |
| 06/09 | Problema 01 – PBL                                    |
| 11/09 | Problema 01 – PBL                                    |
| 13/09 | Problema 01 – PBL                                    |
| 18/09 | Problema 01 – PBL                                    |
| 20/09 | **ENTREGA DO RELATÓRIO DO PROBLEMA 01 PARA O TUTOR** |
| 20/09 | Apresentação do produto do Problema 01 ao tutor      |

## 1.3 Contextualização tecnológica e descrição do problema:

A empresa **SigmaDSP Inc.** atua no mercado de produção de dispositivos eletrônicos para o processamento de sinais há vários anos, sendo uma das empresas pioneiras nesse ramo. Atualmente, a empresa está expandindo suas áreas de atuação, visando a uma maior diversificação de mercado. Com isso, ela tem prestado diversos serviços na área de consultoria de assuntos especializados.

Um dos mais recentes desafios postos à frente da **SigmaDSP Inc.** é o entendimento minucioso e completo do processo da amostragem de sinais analógicos. Para isso, sabe-se que três são as formas ou métodos da amostragem de sinais analógicos, sobre critérios estritos para a reconstrução, sem perda de informação, a saber: ideal, natural e instantânea do tipo plano (flat-top). Então, esta consultoria requer que os profissionais desenvolvam os processos analíticos e comparativos tanto nos domínios do tempo como da frequência para os três métodos estudados. A amostragem é a primeira das etapas da conversão analógico-digital (A/D) e é a etapa que define se haverá ou não _aliasing_ no sinal analógico amostrado.

## 1.4 Produto:

Vislumbrando a importância da inserção da empresa em mais esse nicho de mercado, o presidente da **SigmaDSP Inc.**, através da **diretoria de P&D**, vem solicitar à sua equipe de engenheiros, as simulações dos métodos de amostragem para sinais analógicos de valor real, uma superposição de senóides, não necessariamente limitadas em banda, a obtenção do respectivo espectro de frequências para análise, e a filtragem de reconstrução para retornar ao sinal analógico original. A frequência da amostragem deve ser ajustável para que o comportamento do espectro e a reconstrução do sinal original sejam observados à luz da relação entre as frequências de amostragem e das componentes do sinal analógico. Mostre os resultados de suas escolhas para representar os sinais amostrados com e sem _aliasing_. Matlab ou Octave são as ferramentas de desenvolvimento, computação numérica dos métodos, simulação e apresentação dos resultados para o relatório.

Assim, um relatório também deverá ser entregue no formato artigo IEEE, contendo a apresentação do problema, **a descrição analítica dos métodos de amostragem, comparação analítica entre elas, bem como as reconstruções dos sinais analógicos**, as representações gráficas dos espectros resultantes, a descrição de como você tratou o problema e a discussão dos resultados e conclusões. Lembrando que todas as fontes de pesquisas utilizadas devem estar citadas no relatório, sendo **completamente desnecessária** sua reprodução. O relatório deve ser feito em trio, utilizando no **máximo seis (6) páginas**. Seu relatório deve ser entregue, **impreterivelmente** até o dia **20/09**, anexando todo material pertinente ao desenvolvimento. A apresentação para o tutor deve ser realizada no dia **20 de setembro**, na seção Tutorial (cada participante será arguido sobre o seu projeto).

## 1.5 Recursos para Aprendizagem

- **COUCH II, L. W.** “Digital and Analog Communication Systems”, Second Edition. University of Florida (Electrical and Computer Engineering), New Jersey. Published by Prentice Hall. 2007.
- **OPPENHEIM, A. V. e WILLSKY, A. S.** Massachusetts Institute of Technology, com a colaboração de NAWAB, S. H. University of Boston “Sinais e Sistemas”, 2ª Edição, Pearson São Paulo, 2010. Tradutores: Daniel Viera e Rogério Bettoni. Revisores técnicos: Profa. Dra. Maria D. Miranda (USP) e Prof. Dr. Marcio Eisencraft (UFABC).
- **OPPENHEIM, A. V. and WILLSKY, A. S. with NAWAB, S. H.** “Signals and Systems”, Second Edition. Massachusetts Institute of Technology, New Jersey. Published by Prentice Hall, 1997.
- **LATHI, B.P.** “Sinais e Sistemas Lineares” 1ª Edição. Editora Bookman, 2006.
- **OPPENHEIM, A. V. and SHAFFER, R. W.** “Discrete-time Signal Processing”, 3rd Edition, Prentice Hall Publisher, 2010.
- **INGLE, V.K. and PROAKIS, J.G.** "Essentials of Digital Signal Processing using MATLAB". Third edition, CENGAGE Learning.
