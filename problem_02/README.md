# Problema 2 Implementação da Conversão Analógico-Digital (AD) de n bits

## 2.1 Tema: O conversor A/D do Microcontrolador ATMega2560.

## 2.2 Cronograma: 

| Data  | Grupo Tutorial                                   |
| ----- | ------------------------------------------------ |
| 25/09 | Apresentação do produto do Problema 01 ao tutor  |
| 27/09 | Apresentação do Problema 02 – PBL                |
| 02/10 | Problema 02 – PBL                                |
| 04/10 | Problema 02 – PBL                                |
| 09/10 | Problema 02 – PBL - Laboratório                  |
| 11/10 | Problema 02 – PBL                                |
| 16/10 | Problema 02 – PBL                                |
| 18/10 | Problema 02 – PBL                                |
| 23/10 | Problema 02 – PBL                                |
| 25/10 | ENTREGA DO RELATÓRIO DO PROBLEMA 02 PARA O TUTOR |
| 25/10 | Apresentação do produto do Problema 02 ao tutor  |

## 2.3 Descrição do problema: 

Um estudo solicitado pela diretoria de P&D, realizado junto às empresas parceiras da SigmaDSP Inc., indicou que a consultoria de assuntos especializados realizada pela sua equipe de engenheiros proporcionou excelentes resultados no que tange à capacitação de profissionais dessas empresas. Novamente, o presidente da SigmaDSP Inc., através da diretoria de P&D, vem a público cumprimentar a sua equipe de engenheiros pelo sucesso alcançado. A atuação da empresa SigmaDSP Inc. no mercado de dispositivos eletrônicos é bem conhecida. Nesse sentido, a expansão de suas linhas de serviço para atender ao avanço de sistemas eletrônicos e microprocessados segue a pleno vapor.

Dando continuidade à primeira etapa da conversão A/D (amostragem), de forma a consolidar a inserção da empresa nesse nicho de mercado, o presidente da SigmaDSP Inc., através da diretoria de P&D, vem solicitar à sua equipe de engenheiros, o estudo, a avaliação e implementação da conversão analógico-digital (ADC) no microcontrolador ATMega2560. Para isso, você realizará: a conversão A/D (amostragem, quantização e codificação) de sinais analógicos fornecidos pelo gerador de funções, na faixa de 5Vpp (0-5V) e frequência regulável; e a análise espectral dos sinais levando em conta a variação do intervalo de janelamento do sinal a ser amostrado e a frequência de amostragem utilizada.

## 2.4 Produto: 

A equipe de engenheiros da SigmaDSP Inc. deverá realizar a configuração para uso do ADC na plataforma do Arduino: microcontrolador ATMega2560, disponível no Laboratório de Processamento de Sinais. Também deverão ser realizadas uma análise aprofundada sobre o tipo de ADC utilizado, de forma a consolidar os conceitos de amostragem, quantização e codificação. Os sinais utilizados na entrada devem ser sinais nas formas triangular e senoidal, fornecidos pelo gerador

de funções arbitrárias. O script para uso do ADC do ATMega2560 deve ser configurado de tal modo que possa ser alterada a frequência de amostragem (50kHz, 20kHz, 10kHz, 5kHz e 2kHz, por exemplo) e também o intervalo de janelamento do sinal (o tempo total em que o sinal periódico é analisado), de forma que possa ser realizado o registro dos dados e seu envio pela porta serial (USB) ao computador. Para isso, no computador, será usada a linguagem GNU Octave para recepção e análise espectral dos dados convertidos pelo ADC, ou seja, para se desenvolver os scripts necessários às etapas de recepção, de análise espectral e da demonstração do processo numa interface própria.

A sua equipe deverá também entregar um relatório, no formato IEEE, contendo a apresentação do problema, a descrição teórica e técnica da sua solução para o problema (uma descrição textual, esquemática, matemática e gráfica de como você tratou o problema), a discussão dos resultados obtidos e conclusões. Lembrando que todas as fontes de pesquisas utilizadas devem estar citadas no relatório, sendo completamente desnecessária sua reprodução. O relatório deve ser feito em trio, utilizando no máximo seis (6) páginas. Seu relatório deve ser entregue, impreterivelmente, até o dia 25/10, anexando todo material pertinente ao desenvolvimento. A apresentação para o tutor deverá ser realizada no dia 25 de outubro, das 13:30 às 15:30h (cada participante será arguido sobre o seu projeto).

## 2.5 Recursos para Aprendizagem 

- BALL, Stuart R., Analog Interfacing to Embedded Microprocessors. Ed. Newones. OPPENHEIM, A. V. and SCHAFER R. W., Discrete-Time Signal Processing. Ed. Prentice Hall.
- OPPENHEIM, A. V. and SCHAFER R. W., Digital Signal Processing. Ed. Prentice Hall.
- OPPENHEIM, A. V., Signal and Systems. Ed. Prentice Hall.
- HAYKIN, S. and VEEN, B. V. Sinais e Sistemas. Ed. Bookman.
- OPPENHEIM, A. V. e WILLSKY, A. S. Massachusetts Institute of Technology, com a colaboração de NAWAB, S. H. University of Boston “Sinais e Sistemas”, 2ª Edição, Pearson São Paulo, 2010. Tradutores: Daniel Viera e Rogério Bettoni. Revisores técnicos: Profa. Dra. Maria D. Miranda (USP) e Prof. Dr. Marcio Eisencraft (UFABC).
- OPPENHEIM, A. V. and WILLSKY, A. S. with NAWAB, S. H. “Signals and Systems”, Second Edition. Massachusetts Institute of Technology, New Jersey. Published by Prentice Hall.
- LATHI, B.P. “Sinais e Sistemas Lineares” 1ª Edição. Editora Bookman. INGLE, V.K. and PROAKIS, J.G. "Essentials of Digital Signal Processing using MATLAB". Third edition, CENGAGE Learning.
- NAGAR, Sandeep. “Introduction do Octave: For Engineers and Scientists”. 1sr Edition, Apress.
- LACHMIET, Jason. “Introduction to GNU Octave: A brief tutorial for linear algebra and calculus students”. Third Ed. Download for free at: https://www.wcc.vccs.edu/sites/default/files/Introduction-to-GNU-Octave.pdf. Microchip Technology. URL: https://www.microchip.com/en-us/product/atmega2560
