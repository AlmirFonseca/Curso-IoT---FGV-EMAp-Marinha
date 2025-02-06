# Introdução à Eletrônica com Arduino

## Automação Residencial

### Descrição
Este roteiro de monitoria tem como objetivo apresentar dispositivos fundamentais para a automação residencial, como o módulo relé, o sensor de presença PIR HC-SR501 e um microfone. O projeto propõe uma compreensão prática do funcionamento desses sensores e da aplicação do módulo relé, utilizando-o como um interruptor inteligente para o controle de dispositivos em uma residência automatizada.

### Objetivos
- Compreender o módulo relé como uma chave eletrônica
- Compreender o funcionamento do sensor de presença PIR HC-SR501
- Compreender o uso do microfone como dispositivo de entrada
- Unir os três componentes para construir um sistema integrado de controle automatizado

### Materiais Necessários

| Componente                           | Imagem                                                                                                      |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------|
| 1x Placa Arduino (Uno, Mega, ou similar) | <img src="https://d229kd5ey79jzj.cloudfront.net/1338/images/1338_2_X.png?20241107090313" height="100"> |
| 1x Cabo USB para conexão com o computador | <img src="https://m.media-amazon.com/images/I/5181PDv7RbL._AC_UF894,1000_QL80_.jpg" height="100"> |
| 1x LED vermelho | <img src="https://cdn.awsli.com.br/600x700/468/468162/produto/1941435412328b077d.jpg" height="100"> |
| 1x LED amarelo | <img src="https://techsuleletronicos.com.br/wp-content/uploads/2018/11/26d8d978af.png" height="100"> |
| 1x LED verde | <img src="https://cdn.awsli.com.br/600x700/468/468162/produto/19414355828b769476.jpg" height="100"> |
| 3x Resistor de 300 ohms | <img src="https://http2.mlstatic.com/D_NQ_NP_988873-MLB43270980270_082020-O.webp" height="100"> |
| 1x Módulo Relé | <img src="https://d229kd5ey79jzj.cloudfront.net/258/images/258_2_H.png?20250120214712" height="100"> |
| 1x Sensor PIR | <img src="https://www.eletruscomp.com.br/arquivos/1610020213_download.jpg" height="100"> |
| 1x Microfone | <img src="https://images.tcdn.com.br/img/img_prod/1165255/90_sensor_de_som_para_montagem_com_arduino_kit_com_2_unidades_6403_3_970a51cf59fa5acd7139e1ac4250caef.jpg" height="100"> |
| Breadboard | <img src="https://cdn.awsli.com.br/600x700/1665/1665980/produto/11154566064a7523ad8.jpg" height="100"> |
| Jumpers | <img src="https://res.cloudinary.com/rsc/image/upload/b_rgb:FFFFFF,c_pad,dpr_1.0,f_auto,q_auto,w_700/c_pad,w_700/R2048241-01" height="100"> |

### Palavras-chave
Arduino, sensor PIR, módulo relé, microfone, automação residencial,

--- 

## Metodologia

### Bloco 1: Ligando um LED com o Módulo Relé
Um relé é um interruptor eletromecânico amplamente utilizado para comutação de contatos elétricos, permitindo ligar ou desligar dispositivos de maneira automatizada. Seu funcionamento baseia-se na passagem de corrente elétrica pelas espiras da bobina interna, gerando um campo magnético que atrai mecanicamente a alavanca responsável por alterar o estado dos contatos elétricos, estabelecendo ou interrompendo a conexão.

<p align="center">
  <img src="..\..\src\images\Rele.jpeg" height="300">
</p>

Normalmente um relé possui cinco terminais. Dois deles são os terminais da bobina de acionamento. Os outros três terminais são como os de um interruptor. Um é o terminal comum (C), ou seja, ele é comum ao circuito. Nele sempre passará a corrente. Os outros dois terminais são os contatos, um é normalmente aberto (NA) e o outro é normalmente fechado (NF). Quando a bobina conduz corrente, o contato do relé se fecha, e o pino comum se liga ao pino normalmente aberto, fazendo-o ficar fechado e conduzir a corrente.
Neste bloco, usaremos o relé para ligar e desligar um LED. 

#### Passo 1: Introdução ao Circuito
1. Conecte o pino IN do relé ao pino 13 do Arduino
2. Conecte o pino 5V do relé ao terminal 5v do Arduino
3. Conecte o pino GND do relé ao terminal GND do Arduino
4. Conecte a entrada C do relé ao terminal 5v do Arduino
5. Conecte a entrada NA do relé ao pino positivo do LED
6. Conecte o pino negativo do LED ao GND do Arduino através de um resistor de 300 ohms

<p align="center">
  <img src="..\..\src\images\Monitoria 4\Diagrama1.png" height="300">
</p>

#### Passo 2: Programação
1. Aba o Arduino IDE e siga os seguintes passos:
    - Crie uma constante para armazenar o pino do Relé ```const int relay = 11;```
    - No ```void setup()```: Defina o pino do Relé como saída e inicie o monitor serial em 9600 bps
    - No ```void loop()```: Altere o nível lógico do relé de 3 em 3 segundos, exibindo no monitor serial o estado atual
2. Selecione a placa e a porta de conexão onde o Arduino está conectado
3. Faça o upload do código para a placa Arduino

#### Passo 3: Observação
1. Observe o LED vermelho acendendo e apagando a cada segundo
2. Observe também o pequeno LED presente no relé

#### Passo 4: Exploração
1. Experimente mudar a conexão da entrada NA do relé para a entrada NF. O que alterou no circuito? 
2. Experimente conectar outro LED à entrada restante do módulo relé (lembre-se de conectar o terminal negativo ao GND por meio de um resistor de 300 ohms). É necessário modificar o código para que os LEDs alternem entre si?
3. O que difere o relé de um transistor? Como você pensa em utilizar o relé numa automação residencial?

---

### Bloco 2: Sensor PIR
Um sensor infravermelho passivo (sensor PIR) é um sensor eletrônico que mede a luz infravermelha (IR) irradiada de objetos em seu campo de visão. Eles são mais frequentemente usados ​​em detectores de movimento baseados em PIR e são comumente usados ​​em alarmes de segurança e aplicações de iluminação automática.

<p align="center">
  <img src="https://s3-sa-east-1.amazonaws.com/robocore-tutoriais/407/funcoes_sensor_pir_H.png" height="300">
</p>

Resumidamente, o sensor de movimento possui dois sensores IR dentro de um encapsulamento. Quando um objeto aquecido passa a frente do sensor, uma diferença de leitura entre os dois sensores internos é gerada e consequentemente é detectada a movimentação. Neste bloco, iremos conectar o sensor PIR ao Arduino e acompanhar suas leituras pelo Monitor Serial.

#### Passo 1: Introdução ao Circuito
1. Conecte o primeiro pino do sensor ao terminal de GND do Arduino
2. Conecte o segundo pino do sensor ao pino 10 do Arduino
3. Conecte o terceiro pino do sensor ao terminal 5V do Arduino

<p align="center">
  <img src="..\..\src\images\Monitoria 4\Diagrama2.png" height="300">
</p>

#### Passo 2: Programação
1. Aba o Arduino IDE e siga os seguintes passos:
    - Crie uma constante para armazenar o pino do sensor ```const int pir_signal_pin = 10;``` e uma variável para armazenar o estado do sensor ```boolean pir_status;```
    - No ```void setup()```: Defina o pino do sensor como entrada e inicie o monitor serial em 9600 bps
    - No ```void loop()```: Leia o estado do sensor e armazene na variável ```pir_status = digitalRead(pir_signal_pin);```. Exiba o estado do sensor no monitor serial.

2. Selecione a placa e a porta de conexão onde o Arduino está conectado
3. Faça o upload do código para a placa Arduino

#### Passo 3: Observação
1. Abra o Serial Monitor na Arduino IDE.
2. Observe a leitura do sensor enquanto não há movimento algum

#### Passo 4: Exploração
1. Experimente ajustar a sensibilidade do sensor usando o potenciômetro do dispositivo. Como a sensibilidade impacta a precisão e a distância de detecção?
2. Experimente ajustar o temporizador usando o potenciômetro do dispositivo. Como ele impacta a saída no Monitor Serial?
3. Teste a resposta do sensor PIR a diferentes tipos de movimento. O sensor tem uma taxa de resposta diferente dependendo da velocidade do movimento?
4. Afaste gradualmente um objeto do sensor e observe até que ponto ele ainda é capaz de detectar sua presença. Qual é a distância máxima em que o sensor consegue detectar um movimento? 

---

### Bloco 3: Módulo Relé e Sensor PIR
Neste bloco, adicionaremos o sensor PIR ao circuito desenvolvido no Bloco 1, utilizando as leituras do sensor para ativar o relé. Isso permitirá controlar o estado lógico dos LEDs de forma automatizada, com base na detecção de movimento pelo sensor. 

#### Passo 1: Introdução ao Circuito
1. Combine os circuitos dos blocos 1 e 2. 

<p align="center">
  <img src="..\..\src\images\Monitoria 4\Diagrama3.png" height="300">
</p>

#### Passo 2: Programação
1. Aba o Arduino IDE e combine os códigos dos blocos 1 e 2 para salvar as leituras do sensor PIR e definir quais dispositivos são de entradas e quais são de saída
2. No ```void loop()```: Leia o estado do sensor e implemente condicionais para ativar o relé ao detectar presença e desativá-lo na ausência. Para evitar oscilações, adicione um ```delay()``` de um segundo na condição de ativação do relé.
3. Selecione a placa e a porta de conexão onde o Arduino está conectado
4. Faça o upload do código para a placa Arduino

#### Passo 3: Observação 
1. Observe os LEDs enquanto o sensor não detecta movimento algum
2. Observe os LEDs quando um movimento é detectado
3. O tempo de resposta está adequado? Por quanto tempo o LED vermelho permanece aceso, mesmo na ausência de movimento?+

#### Passo 4: Exploração
1. Ajuste o valor do temporizador utilizando o potenciômetro e observe como o tempo de resposta do sistema muda até atingir um resultado satisfatório.
2. Além de acionar LEDs, em quais outras aplicações você acredita que o sensor PIR e o relé poderiam ser úteis, como por exemplo, em sistemas de automação residencial ou controle de dispositivos?

---

### Bloco 4: Microfone (Sensor de Som)
O Sensor de Som é um módulo desenvolvido com a finalidade de medir a intensidade sonora do ambiente a partir de um microfone condensador elétrico. Por possuir um amplificador operacional, o sensor de som é capaz de captar os sons do ambiente e amplificá-los em 100 vezes. Este sensor gera em sua saída um sinal centrado em 2,5 V, que varia para cima ou para baixo de acordo com a sonoridade ambiente.

<p align="center">
  <img src="https://d229kd5ey79jzj.cloudfront.net/507/images/507_1_H.png?20241207124916" height="300">
</p>

Sensores analógicos, como o sensor de som, geram sinais contínuos que variam de acordo com a intensidade do estímulo, precisando ser convertidos em valores digitais para processamento. Já sensores digitais, como o PIR, emitem sinais binários ("0" ou "1") que indicam a presença ou ausência de movimento, sem a necessidade de conversão. Enquanto sensores digitais oferecem respostas simples, sensores analógicos fornecem dados mais detalhados e graduais. Neste bloco, iremos conectar o sensor de som ao Arduino e visualizar os dados coletados no Serial Plotter.

#### Passo 1: Introdução ao Circuito
1. Conecte o pino OUT do sensor ao pino A0 do Arduino
2. Conecte o pino VCC do sensor ao terminal 5V do Arduino
3. Conecte o pino GND do sensor ao terminal GND do Arduino

#### Passo 2: Programação
1. Abra o Arduino IDE e siga os seguintes passos:
    - Crie uma constante para armazenar o pino do microfone
    - No ```void setup()```: Defina o pino do microfone como entrada e inicie o monitor serial em 9600 bps
    - No ```void loop()```: Use ```Serial.println(analogRead(PINO_SENSOR));``` para ler e exibir os valores do microfone no monitor serial. Adicione um ```delay(50);``` para estabelecer um intervalo entre as leituras
2. Selecione a placa e a porta de conexão onde o Arduino está conectado
3. Faça o upload do código para a placa Arduino

#### Passo 3: Observação
1. Abra o Serial Monitor na Arduino IDE
2. Observe os dados coletados pelo sensor quando o ambiente está em silêncio

#### Passo 4: Exploração
1. Abra o Serial Plotter na Arduino IDE para visualizar os dados de distância em tempo real, de forma gráfica.
2. Bata palmas e observe os gráficos gerados. É possível identificar claramente o momento em que as palmas foram batidas com base nas variações nos dados?
3. Experimente gerar diferentes sons no ambiente (como vozes, músicas ou sons de objetos batendo) e observe como os gráficos mudam. É possível identificar padrões diferentes para cada tipo de som?
4. Conecte o microfone ao pino 10 e substitua ```analogRead(PINO_SENSOR)``` por ```digitalRead(PINO_SENSOR)```. O que acontece?

---

### Bloco 5: Relé + PIR + Microfone
Neste bloco, vamos integrar os circuitos desenvolvidos nos blocos anteriores para criar um sistema automatizado que combina o Módulo Relé, o sensor PIR e o microfone, com o objetivo de controlar três LEDs: vermelho, verde e amarelo. O sensor PIR, em conjunto com o Módulo Relé, será responsável por alternar entre os LEDs verde e vermelho, enquanto o microfone ativará o LED amarelo ao detectar duas palmas consecutivas. Essa integração proporciona uma oportunidade prática de explorar a interação e funcionalidade conjunta desses dispositivos, destacando a aplicação de sensores e atuadores em um sistema de controle inteligente.

#### Passo 1: Introdução ao Circuito
1. Faça as conexões conforme o esquemático abaixo

<p align="center">
  <img src="..\..\src\images\Monitoria 4\Diagrama5.png" height="300">
</p>

#### Passo 2: Programação
1. Abra o Arduino IDE e escreva o seguinte código:

    ```cpp
    const int pino_microfone = A0; // pino onde o microfone está conectado
    int leitura = 0; // variável para armazenar o valor lido 

    const int pino_rele = 13; // pino onde o rele está conectado

    const int led_amarelo = 11; // pino onde o led amarelo está conectado
    int estado_led = 0; // variável para armazenar o estado do led

    const int pir_signal_pin = 10; // pino onde o sensor pir está conectado
    boolean pir_status; // variável para armazenar o estado do sensor pir

    float amplitude = 0.0; // armazenará o valor de pico a pico da onda
    unsigned int valor_max = 0; // armazenará o valor máximo lido pelo sensor
    unsigned int valor_min = 1024; // armazenará o valor mínimo lido pelo sensor
    float valor_limite = 4.5; // valor mínimo para considerar uma palma (0.0 - 5.0)
    unsigned long inicio_amostragem; // armazena o instante que começou a amostragem
    const unsigned long tempo_amostragem = 250; // tempo de amostragem em ms

    int palmas = 0; // contador de palmas
    unsigned long tempo_palmas; // armazena o instante que começou a amostragem
    const unsigned long tempo_palmas_max = 500; // período de amostragem de palmas

    void setup() {
        // Inicia e configura a Serial
        Serial.begin(9600); // 9600bps

        pinMode(pino_microfone, INPUT); // configura o pino com potenciometro como entrada
        pinMode(pino_rele, OUTPUT); // configura o pino com o rele como saída
        pinMode(pir_signal_pin,INPUT); // configura o pino do sensor pir como entrada
        pinMode(led_amarelo, OUTPUT); // configura o pino do led amarelo como saída
        
        inicio_amostragem = millis(); // reseta o tempo inicial da amostragem
    }

    void loop() {
        pir_status = digitalRead(pir_signal_pin); // le os dados do sensor

        if(pir_status == HIGH){ // ativa o rele caso o sensor detecte movimento
            digitalWrite(pino_rele,HIGH);
            delay(1000);
        }
        else{
            digitalWrite(pino_rele,LOW);
        }

        // Coleta dados durante o tempo de amostragem
        if (millis() - inicio_amostragem < tempo_amostragem) {

            // le o valor de tensão no pino do sensor
            leitura = analogRead(pino_microfone);

            // se valor lido for maior que valor máximo
            if (leitura > valor_max) {
            valor_max = leitura; // atualiza valor máximo
            }
            // se valor lido for menor que valor mínimo
            else if (leitura < valor_min) {
            valor_min = leitura; // atualiza valor mínimo
            }

        }
        else { // processa os dados
            inicio_amostragem = millis(); // reseta o tempo inicial da amostragem

            // calcula, converte e imprime o valor de pico-a-pico em tensão elétrica
            amplitude = valor_max - valor_min; // max - min = pico-a-pico, amplitude
            amplitude = (amplitude * 5.0) / 1023.0; // converte para tensão(V)

            Serial.println(amplitude); // imprime a amplitude no Monitor Serial

            // Reseta os valores máximos e mínimos
            valor_max = 0;
            valor_min = 1024;

            // Se o valor de amplitude superar o valor limite, inverte o estado da carga
            if (amplitude > valor_limite) {
            if (palmas == 0){ // se for a primeira palma daquele período
                tempo_palmas = millis(); // reinicia a amostragem de palmas
            }
            palmas++; // incrementa o número de palmas
            }
        }

        // se o tempo de amostragem de palmas é atingido
        if (millis() - tempo_palmas > tempo_palmas_max) {

            tempo_palmas = millis(); // reseta tempo inicial da amostragem de palmas

            // Se o número de palmas captadas naquele periodo for igual a 2
            if (palmas == 2) {
            estado_led = ! estado_led; // inverte o estado do led e
            digitalWrite(led_amarelo, estado_led); // atualiza o estado do led
            }

            palmas = 0; // reinicia o contador de palmas
        }
    }
    ```
2. Selecione a placa e a porta de conexão onde o Arduino está conectado
3. Faça o upload do código para a placa Arduino

#### Passo 3: Observação
1. Verifique se o sistema opera de acordo com o esperado.
2. O relé aciona quando o PIR detecta algum movimento?
3. O LED amarelo acende quando o microfone detecta duas palmas?

#### Passo 4: Exploração
1. Você consegue imaginar alguma forma de combinar os dois sensores?
2. Qual deles tem uma resposta mais rápida? Há alguma interferência entre eles?
3. Podemos utilizar o microfone em conjunto com o Módulo Relé para acender uma lâmpada em uma aplicação prática. Quais outras aplicações você imagina com os componentes vistos hoje?

---

### Conclusão
Este roteiro de monitoria apresentou uma abordagem prática à automação residencial, explorando o funcionamento do módulo relé, do sensor PIR e do microfone. Por meio de atividades práticas envolvendo sensores analógicos e digitais, foi possível integrar diferentes dispositivos em sistemas automatizados, promovendo experimentações e ampliando o entendimento sobre suas aplicações. Estes conhecimentos podem ser aplicados para criar soluções inteligentes e personalizadas, mostrando o potencial da tecnologia na modernização e automação em ambientes residenciais.

---

### Referências para Consulta
- [Documentação Oficial do Arduino](https://www.arduino.cc/en/Guide/HomePage) 

- [Datasheet PIR](https://d229kd5ey79jzj.cloudfront.net/327/pir.pdf)  

- [Sensor de som](https://www.robocore.net/tutoriais/usando-sensor-de-som?srsltid=AfmBOorK-ziHZmP1hyGqz_hL3cgtXH7m2JzeGDky7pt438DlliE7Qc78) 

- [Datasheet Microfone](https://www.mouser.com/ds/2/683/MO093803-1-359263.pdf) 

### Sugestões de Leitura
- [Relé](https://pt.wikipedia.org/wiki/Relé)

- [Microfone](https://en.wikipedia.org/wiki/Microphone)

- [PIR](https://en.wikipedia.org/wiki/Passive_infrared_sensor) 

---
