<!-- # Introdução à Eletrônica com Arduino

## Controle de LEDs e Sensores de Luminosidade

### Descrição
Este roteiro de experimento é projetado para os primeiros passos uma turma de iniciantes em eletrônica e IoT (Internet das Coisas), utilizando o Arduino como base. O experimento é dividido em blocos de atividades que introduzem conceitos básicos de controle de LEDs e coleta de dados de luminosidade, culminando em uma análise de dados coletados e discussão sobre a sensibilidade do sensor de luminosidade (LDR) às diferentes cores de LEDs.

### Objetivos
- Introduzir o Arduino e o seu ambiente de desenvolvimento (Arduino IDE).
- Introduzir o conceito de pinos digitais e analógicos no Arduino para controle de LEDs.
- Apresentar um sensor de luminosidade (LDR) e demonstrar como coletar dados.
- Integrar a coleta de dados do LDR com a variação de intensidade dos LEDs para análise posterior.
- Comparar a sensibilidade do LDR às diferentes cores de LEDs.

### Materiais Necessários
- 1x Placa Arduino (Uno, Mega, ou similar)
- 1x Cabo USB para conexão com o computador
- 1x LED vermelho
- 1x LED amarelo
- 1x LED verde
- 1x LED RGB
- 3x Resistor de 300 ohms
- 1x Sensor LDR (Light Dependent Resistor)
- 1x Resistor de 10k ohms
- 1x Copo plástico ou similar (para cobrir o LDR durante a coleta de dados)
- Breadboard e jumpers

### Palavras-chave
Arduino, Arduino IDE, LED, Light Emitting Diode, Resistor, digitalWrite, analogWrite, LDR, Light Dependent Resistor, Serial Monitor, Serial Begin, Serial Print, Serial Plotter.

---

## Metodologia

### Bloco 1: Blink, o "Hello World" do Arduino

Assim como outras linguagens, existe um "ritual de iniciação" para quem está começando a programar com Arduino: o Blink. Neste experimento, o objetivo é acender e apagar um LED a cada segundo, utilizando o LED embutido na placa Arduino Uno.

#### Passo 1: Introdução ao Circuito

1. O ```LED_BUILTIN``` é um LED embutido na placa Arduino Uno, que pode ser acessado através do pino 13. Para este experimento, usaremos esse LED, não sendo necessário nenhum circuito adicional.

<p align="center">
  <img src="https://roboticsbackend.com/wp-content/uploads/2021/09/arduino_builtin_led.png" height="300px" />
</p>

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    void setup() {
      pinMode(LED_BUILTIN, OUTPUT); // Configura o pino do LED como saída
    }

    void loop() {
      digitalWrite(LED_BUILTIN, HIGH); // LED ligado
      delay(1000); // Aguarda 1 segundo (1000 ms)
      
      digitalWrite(LED_BUILTIN, LOW); // LED desligado
      delay(1000); // Aguarda 1 segundo (1000 ms)
    }
    ```

> ⚠: Assim como outras linguagens de programação, a Arduino IDE é sensível a maiúsculas e minúsculas. Certifique-se de que o código está escrito corretamente. Não se esqueça do "**;**" ao final de cada comando.

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o LED embutido na placa acendendo e apagando a cada segundo.

#### Passo 4: Exploração

1. O que acontece se alterarmos o tempo de espera de cada comando ```delay()```? Altere seus valores, faça o upload do código novamente e observe o comportamento do LED.


### Bloco 2: Controle de LED com digitalWrite

Agora que já passaram pelo "ritual de iniciação", é hora de controlar LEDs externos. Neste bloco, os alunos aprenderão a montar o primeiro circuito com um LED externo e controlá-lo através de sinais digitais. Além disso, começaremos a imprimir mensagens de texto na porta serial para visualizar o estado do LED.

<p align="center">
  <img src="https://cdn.shopify.com/s/files/1/0695/1347/8453/files/LED_symbol_480x480.png?v=1676322752" height="200px" />
</p>

#### Passo 1: Introdução ao Circuito

1. Conecte o LED verde ao pino 8 do Arduino através de um resistor de 300 ohms. Para mais orientações, use o exemplo [Blink | Arduino Documentation](https://docs.arduino.cc/built-in-examples/basics/Blink/) como referência para a construção do circuito

> ⚠: Preste atenção à polaridade do LED. Ela pode ser observada segundo o comprimento das "pernas" do LED.

<p align="center">
  <img src="https://ledlightinginfo.com/wp-content/uploads/2020/11/led-polarity.jpg" height="200px" />
</p>

#### Passo 2: Programação
1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    int greenLedPin = 8; // Define o pino conectado ao LED verde

    void setup() {
      pinMode(greenLedPin, OUTPUT);
    }

    void loop() {
      digitalWrite(greenLedPin, HIGH); // LED ligado
      delay(1000);
      
      digitalWrite(greenLedPin, LOW); // LED desligado
      delay(1000);
    }
    ```
2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Observe o LED verde acendendo e apagando a cada segundo.

### Passo 4: Exploração

1. O que acontece se o LED for conectado em outro pino? Qualquer pino pode ser utilizado para controlar o LED com ```digitalWrite()```?
2. A fim de visualizar o estado do LED na tela do computador, experimente imprimir mensagens de texto usando ```Serial.println()``` toda vez que o LED tiver o estado alterado.

> ⚠: Lembre-se sempre de inicializar a comunicação serial utilizando ```Serial.begin()```
 antes de transmitir mesagens.

```cpp	
void setup() {
  ...
  Serial.begin(9600); // Configura a comunicação serial a 9600 bps (bits por segundo)
  ...
}

void loop() {
  ...
  Serial.println("LED ligado"); // Imprime a mensagem "LED ligado" na porta serial
  ...
}
```

---

### Bloco 3: Controle de LED com analogWrite

Agora que já sabemos como ligar e desligar LEDs, é hora de aprender a controlar a intensidade deles. Neste bloco, os alunos aprenderão a controlar a intensidade de um LED utilizando o sinal PWM (*Pulse Width Modulation*) do Arduino.

Por padrão, o controlador do Arduino Uno permite o ajuste em 256 níveis de intensidade, variando de 0 (0 volts) a 255 (5 volts). Nesse experimento, utilizaremos o LED vermelho para demonstrar o controle de intensidade através da variação do seu brilho.

#### Passo 1: Introdução ao Circuito
1. Monte o circuito similar ao anterior, mas conectando o LED vermelho ao pino 9.

#### Passo 2: Programação
1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    int redLedPin = 9;

    void setup() {
      pinMode(redLedPin, OUTPUT);
    }

    void loop() {
      analogWrite(redLedPin, 0);   // Desligado (0)
      delay(1000);
      analogWrite(redLedPin, 128); // Meio brilho (128)
      delay(1000);
      analogWrite(redLedPin, 255); // Máximo brilho (255)
      delay(1000);
    }
    ```
2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Observe a mudança de brilho do LED vermelho a cada segundo.
2. A fim de visualizar o estado do LED na tela do computador, experimente imprimir mensagens de texto usando ```Serial.println()``` toda vez que o LED tiver o estado alterado. Use o Serial Plotter para visualizar os dados.

### Passo 4: Exploração

1. O que acontece se o LED for conectado em outro pino? Qualquer pino pode ser utilizado para controlar o LED com ```analogWrite()```?
2. O que acontece se tentarmos controlar a intensidade dessa forma com ```digitalWrite()```? Por que isso ocorre? O Arduino é atualizado com o código novo?
3. Como podemos controlar a intensidade do LED de forma mais suave? Experimente alterar o tempo de espera entre as mudanças de brilho, criar mais níveis de intensidade ou utilizar loops para controlar a intensidade do LED. (Dica: utilize a função ```for```)

```cpp
for (int i = 0; i <= 255; i++) { // Seleciona um valor para "i" de 0 a 255
  analogWrite(redLedPin, i); // Define a intensidade do LED como "i"
  delay(10); // Aguarda 10 ms antes da próxima iteração ("repetição")
}
```
4. Como visualizar os valores de intensidade do LED na porta serial de forma mais intuitiva? Experimente imprimir mensagens com o valor da intensidade do LED e utilize o Serial Plotter para visualizar os dados.

---

### Bloco 4: Semáforo

Agora que já sabemos controlar LEDs e a intensidade deles, é hora de aplicar esse conhecimento em um projeto prático: um semáforo. Neste bloco, aprenderão a controlar LEDs RGB para simular um semáforo de trânsito.

#### Passo 1: Introdução ao Circuito

1. Monte o circuito com os LEDs vermelho, amarelo e verde, conectando-os aos pinos 9, 10 e 11, respectivamente. Utilize 1 resistor de 300 ohms para cada LED.

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    int redLedPin = 9;
    int yellowLedPin = 10;
    int greenLedPin = 11;

    void setup() {
      pinMode(redLedPin, OUTPUT);
      pinMode(yellowLedPin, OUTPUT);
      pinMode(greenLedPin, OUTPUT);
    }

    void loop() {
      // Vermelho
      digitalWrite(redLedPin, HIGH);
      digitalWrite(yellowLedPin, LOW);
      digitalWrite(greenLedPin, LOW);
      delay(5000); // Aguarda 5 segundos

      // Amarelo
      digitalWrite(redLedPin, LOW);
      digitalWrite(yellowLedPin, HIGH);
      digitalWrite(greenLedPin, LOW);
      delay(2000); // Aguarda 2 segundos

      // Verde
      digitalWrite(redLedPin, LOW);
      digitalWrite(yellowLedPin, LOW);
      digitalWrite(greenLedPin, HIGH);
      delay(5000); // Aguarda 5 segundos
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o funcionamento do semáforo, alternando entre as cores vermelho, amarelo e verde.

### Passo 4: Exploração

1. O que acontece se alterarmos o tempo de espera entre as mudanças de cor do semáforo? Experimente alterar os valores de ```delay()``` e observe o comportamento do semáforo.

2. Experimente imprimir mensagens na porta serial, indicando a cor do semáforo a cada mudança e o que um motorista deve fazer em cada situação: "Pare", "Aguarde" e "Siga".

---


### Bloco 5: Controle de LED RGB

A fim de continuar os nossos experimentos, vamos substituir os 3 LEDs individuais do semáforo por um LED RGB. Este LED possui 4 "pernas" e é capaz de emitir luz nas cores vermelho, verde e azul, além de suas combinações. A função de cada pino pode ser observada na imagem abaixo, segundo o comprimento das "pernas" do LED.

<p align="center">
  <img src="https://cdn.sparkfun.com/assets/learn_tutorials/3/6/0/RGBPinOUt.png" height="200px" />

#### Passo 1: Introdução ao Circuito

1. Monte o circuito com o LED RGB, conectando cada pino a um pino digital do Arduino (9, 10 e 11). Utilize 1 resistor de 300 ohms para cada pino. Você pode manter os resistores usados no circuito anterior, basta conectar cada pino do LED RGB a um resistor, e o seu pino comum ("GROUND") ao GND do Arduino.

#### Passo 2: Programação

Esse bloco é similar ao anterior, sendo a única diferença a troca dos LEDs individuais por um LED RGB que contém as 3 cores (vermelho, verde e azul) em um único componente. Contudo, como o amarelo não está entre as cores do LED RGB, será necessário combinar as cores vermelho e verde para obter o amarelo. Para isso, utilize a função ```analogWrite()``` para controlar a intensidade de cada cor e controlar a mistura que resultará na cor desejada.

1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    int redPin = 9;
    int greenPin = 10;
    int bluePin = 11;

    void setup() {
      pinMode(redPin, OUTPUT);
      pinMode(greenPin, OUTPUT);
      pinMode(bluePin, OUTPUT);
    }

    void loop() {
      // Vermelho
      analogWrite(redPin, 255);
      analogWrite(greenPin, 0);
      analogWrite(bluePin, 0);
      delay(5000); // Aguarda 5 segundos

      // Amarelo
      analogWrite(redPin, 128);
      analogWrite(greenPin, 128);
      analogWrite(bluePin, 0);
      delay(2000); // Aguarda 2 segundos

      // Verde
      analogWrite(redPin, 0);
      analogWrite(greenPin, 255);
      analogWrite(bluePin, 0);
      delay(5000); // Aguarda 5 segundos
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o funcionamento do semáforo, alternando entre as cores vermelho, amarelo e verde.

### Passo 4: Exploração

1. O que acontece se alterarmos a composição de vermelho e verde para gerar o amarelo? Experimente alterar os valores de ```analogWrite()``` e observe o comportamento do semáforo.

> Você sabia? Existem alguns motivos que dificultam o uso de LEDs RGB em semáforos ao redor do mundo como, por exemplo, o fato de que pessoas com daltonismo podem ter dificuldades para distinguir as cores, o que não acontece com os semáforos tradicionais que utilizam luzes individuais. Além disso, estudos mostram que a alteração da posição da fonte de luz quando o semáfoto muda de estado chama a atenção dos motoristas. Por fim, o alto custo de manutenção também impacta na escolha pelos semáforos tradicionais.


---

### Bloco 6: Sensor de Luminsidade (LDR)

<p align="center">
  <img src="https://techzeero.com/wp-content/uploads/2023/09/ldr-sensor.webp" height="200px" />
</p>

Neste bloco, os alunos aprenderão a utilizar um sensor de luminosidade (LDR) para coletar dados de luminosidade. O LDR é um resistor cuja resistência varia de acordo com a intensidade da luz que incide sobre ele. Quanto mais luz, menor a resistência.

#### Passo 1: Introdução ao Circuito

1. Conecte o LDR (*Light Dependent Resistor*) entre o pino A0 e o terminal GND.
2. Conecte um resistor de 10k ohms entre o pino A0 e o terminal VCC (5V). Esse resistor é chamado de "resistor de pull-up" e é utilizado para garantir que o pino A0 não fique flutuando caso o LDR não esteja recebendo luz.

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    int ldrPin = A0;

    void setup() {
      Serial.begin(9600);

      pinMode(ldrPin, INPUT);
    }

    void loop() {
      int ldrValue = analogRead(ldrPin); // Lê o valor do LDR
      Serial.println(ldrValue);
      delay(1000);
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.
2. Observe os valores de luminosidade capturados pelo LDR. Experimente abrir o Serial Plotter para visualizar os dados de forma gráfica.

### Passo 4: Exploração

1. O que acontece se apontar o LDR para as lâmpadas no teto ou para a lanterna do celular? E se tampar ele com a mão?
2. Qual o valor mínimo e máximo que é possível obter? O que esses valores representam?
3. Como podemos utilizar esses valores para controlar a intensidade de um LED? Experimente substituir o ```analogWrite()``` do LED RGB por um valor lido do LDR. Assim, o LED mudará de intensidade de acordo com a luminosidade capturada pelo sensor.

```cpp
...
int ldrValue = analogRead(ldrPin); // Lê o valor do LDR
ldrValue = map(ldrValue, 0, 1023, 0, 255); // Mapeia o valor do LDR para o intervalo de 0 a 255
analogWrite(redPin, ldrValue); // Controla a intensidade do LED vermelho de acordo com o valor do LDR
...
```

---

### Bloco 7: Coleta de Dados de Luminosidade

Neste bloco, os alunos aprenderão a coletar dados de luminosidade com o LDR e a comparar a sensibilidade do sensor às diferentes cores de LEDs.

#### Passo 1: Introdução ao Circuito

O LDR é um resistor cuja resistência varia de acordo com a intensidade da luz que incide sobre ele. Quanto mais luz, menor a resistência.

Mantenha o circuito do bloco anterior. Usaremos o LED RGB como fonte de luz para o LDR. Portanto, basta seguir os passos dos blocos 5 e 6 para montar o circuito. Depois disso:

1. Garanta que o LDR esteja exposto à luz emitida pelo LED RGB. Entorte o LDR para que ele aponte para o LED RGB.
2. Cubra o conjunto LDR e LED RGB com um copo plástico ou similar para bloquear a luz do ambiente. Isso reduzirá a interferência dela no experimento, permitindo uma coleta de dados mais precisa.

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    int ldrPin = A0;

    int ledRedPin = 9;
    int ledGreenPin = 10;
    int ledBluePin = 11;

    void setup() {
      Serial.begin(9600);

      pinMode(ldrPin, INPUT);

      pinMode(ledRedPin, OUTPUT);
      pinMode(ledGreenPin, OUTPUT);
      pinMode(ledBluePin, OUTPUT);

      // Apaga todos os LEDs
      digitalWrite(ledRedPin, LOW);
      digitalWrite(ledGreenPin, LOW);
      digitalWrite(ledBluePin, LOW);

      // Acende e controla a intensidade do LED vermelho
      Serial.println("Red LED");
      for (int i = 0; i <= 255; i++) {
        analogWrite(ledRedPin, i);
        int ldrValue = analogRead(ldrPin);
        Serial.println(i + "," + ldrValue);
        delay(100);
      }
      // Apaga o LED vermelho
      digitalWrite(ledRedPin, LOW);

      // Acende e controla a intensidade do LED verde
      Serial.println("Green LED");
      for (int i = 0; i <= 255; i++) {
        analogWrite(ledGreenPin, i);
        int ldrValue = analogRead(ldrPin);
        Serial.println(i + "," + ldrValue);
        delay(100);
      }
      // Apaga o LED verde
      digitalWrite(ledGreenPin, LOW);

      // Acende e controla a intensidade do LED azul
      Serial.println("Blue LED");
      for (int i = 0; i <= 255; i++) {
        analogWrite(ledBluePin, i);
        int ldrValue = analogRead(ldrPin);
        Serial.println(i + "," + ldrValue);
        delay(100);
      }
      // Apaga o LED azul
      digitalWrite(ledBluePin, LOW);
    }
    ```

> ⚠: Nem sempre é necessário manter ambos os blocos ```void setup()``` e ```void loop()``` separados. Nesse exemplo, como queremos que o Arduino execute a rotina de coleta de dados apenas uma vez após a inicialização, optamos por manter a coleta no ```void setup()```. Assim, ele não será executado repetidamente como no ```void loop()```, onde o código é repetido indefinidamente.

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.
2. Observe os valores de luminosidade capturados pelo LDR.
3. Copie os valores impressos para uma planilha do Excel e anote a cor do LED que gerou esses valores. No final, é desejado que seja construída uma tabela nesse formato:

| Intensidade do LED | LED Vermelho | LED Verde | LED Azul |
|---------------------|--------------|-----------|----------|
| 0                   | 0            | 0         | 0        |
| 1                   | 1            | 3         | 2        |
| 2                  | 2            | 5         | 4        |
| ...                 | ...          | ...       | ...      |
| 255                 | 298         | 1023      | 512      |

4. Construa gráficos de linhas para cada cor de LED, exibindo a curva de sensibilidade do LDR para cada cor.

### Passo 4: Exploração

1. As curvas são lineares? 
2. As curvas são similares? 
3. Existe alguma cor que o LDR é mais sensível? Busque um embasamento teórico pra sua resposta na [datasheet do sensor LDR](https://www.robocore.net/upload/attachments/sensor_ldr_gl5528_145.pdf).

---

### Conclusão
Este experimento introduziu conceitos básicos de controle de LEDs já embutidos na placa Arduino, externos e até mesmo RGB, além de coleta de dados com Arduino, proporcionando uma base sólida para futuros projetos em eletrônica e IoT. A comparação das respostas do LDR às diferentes cores de LEDs permite uma compreensão mais profunda da sensibilidade do sensor à luz e como essa informação pode ser utilizada em projetos futuros.

---

### Referências para Consulta
- [Arduino Official Documentation](https://www.arduino.cc/en/Guide/HomePage)
- [Arduino Reference](https://www.arduino.cc/reference/en/)

### Sugestões de Leitura
- "Arduino Cookbook" de Michael Margolis
- "Programming Arduino: Getting Started with Sketches" de Simon Monk
- "How to Read a Datasheet" de Phil's Lab ([link](https://youtu.be/1EXXqWweTkI?si=hngcrZDaMttrbT5z))
- "How to Read a Datasheet" de SparkFun Electronics ([link](https://www.sparkfun.com/tutorials/223))

---


# Introdução à Eletrônica com Arduino

## Potenciômetros e Servo Motores 

### Descrição

Esse roteiro de atividades tem como objetivo introduzir o uso de potenciômetros como controladores e o uso de servo motores como atuadores em sistemas eletrônicos. Além disso, serão utilizados diferentes tipos de potenciômetros e discutidas as diferenças entre eles, bem como a linearização do comportamento de um potenciômetro não linear.

### Objetivos

- Apresentar o funcionamento de um potenciômetro e observar seu output no Serial Plotter.
- Apresentar o controle de um servo motor com uma rotina de movimento pré-programada.
- Controlar o servo motor a partir de um potenciômetro linear, ajustando a amplitude dos valores usando a função map().
- Comparar o comportamento de um potenciômetro linear com um logarítmico e discutir as diferenças na resposta do sistema.
- Coletar dados de um transferidor graduado fixo ao servo a fim de linearizar o potenciômetro logarítmico.

### Materiais Necessários

- 1x Placa Arduino (Uno, Mega, ou similar)
- 1x Cabo USB para conexão com o computador
- 1x Servo motor
- 1x Potenciômetro linear (10k ohms)
- 1x Potenciômetro logarítmico (10k ohms)
- 1x Transferidor graduado
- Breadboard e jumpers

### Palavras-chave

Arduino, Arduino IDE, Servo, Potenciômetro, Potenciômetro Linear, Potenciômetro Logarítimico, Serial Plotter, Linearização, Transferidor, Função Inversa.

---

## Metodologia

### Bloco 1: Potenciômetros

Potenciômetros são componentes eletrônicos presentes em diversos dispositivos eletrônicos, como controles de volume, brilho, entre outros. Inventados por Thomas Edison em 1872, eles são utilizados para controlar a resistência elétrica de um circuito, variando a tensão ou corrente que passa por ele. Neste bloco, vamos explorar o funcionamento de um potenciômetro e observar como ele pode ser utilizado para controlar um sistema eletrônico.

#### Passo 1: Introdução ao Circuito

1. Conecte o pino central do potenciômetro ao pino analógico A0 do Arduino.
2. Conecte um dos outros pinos do potenciômetro ao terminal de 5V do Arduino.
3. Conecte o outro pino do potenciômetro ao terminal GND do Arduino.

#### Passo 2: Programação

1. Abra o Arduino IDE e escreva o seguinte código:

```cpp
void setup() {
  Serial.begin(9600); // Inicializa a comunicação serial a 9600 bps
}

void loop() {
  int potValue = analogRead(A0); // Lê o valor do potenciômetro e armazena na variável potValue
  Serial.println(potValue);
  delay(10);
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Plotter no Arduino IDE.
2. Gire o potenciômetro e observe como o valor muda no Serial Plotter.

#### Passo 4: Exploração

1. Qual o valor máximo e mínimo lido pelo potenciômetro?
2. Qual a amplitude, em graus, do potenciômetro?
3. Qual a relação entre a posição do potenciômetro e o valor lido? parece ser linear? Experimente girar o potenciômetro lentamente e observe a saída na tela.
4. O que acontece se inverter as conexões do potenciômetro? Inverta os fios de alimentação (5V) e terra (GND) e observe o comportamento. O que acontece ao girar o potenciômetro assim como antes?

---

### Bloco 2: Servo Motores

Servo motores são dispositivos capazes de girar em um ângulo específico, controlados por um sinal PWM (Pulse Width Modulation). Eles são amplamente utilizados em projetos de robótica, automação e modelismo. Neste bloco, vamos explorar o controle de um servo motor e observar seu movimento entre posições específicas, pré-definidas no código.

Seu funcionamento é baseado em um motor DC com uma caixa de redução e um potenciômetro acoplado ao eixo, formando um sistema de feedback que permite controlar a posição do eixo. O sinal PWM enviado ao servo motor determina a posição do eixo, variando o ângulo de rotação.

#### Passo 1: Introdução ao Circuito

1. Conecte o fio de controle do servo ao pino digital 9 do Arduino.
2. Conecte o fio de alimentação (vermelho) do servo ao terminal de 5V do Arduino.
3. Conecte o fio terra (marrom ou preto) do servo ao terminal GND do Arduino.

> ⚠: O servo motor pode consumir uma corrente maior que a fornecida pelo Arduino. Se o servo motor não estiver se movendo corretamente, considere alimentá-lo com uma fonte externa.

#### Passo 2: Programação

1. Instale a biblioteca "Servo" no Arduino IDE. Para isso, abra o Library Manager e busque por "servo".

TODO: Add image

2. Abra o Arduino IDE e escreva o seguinte código:

```cpp
#include <Servo.h> // Inclui a biblioteca Servo

Servo myServo; // Cria um objeto Servo chamado myServo

void setup() {
  myServo.attach(9); // Associa o servo ao pino digital 9
}

void loop() {
  myServo.write(0);   // Posição mínima
  delay(1000);
  myServo.write(90);  // Posição média
  delay(1000);
  myServo.write(180); // Posição máxima
  delay(1000);
}
```

3. Selecione a placa e a porta de conexão onde o Arduino está conectado.
4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o movimento do servo motor entre as posições mínima, média e máxima.
2. Ele é capaz de repetir os movimentos com precisão?

#### Passo 4: Exploração

1. O que acontece se alterar os valores de 0, 90 e 180 graus no código? Experimente alterar esses valores e observe o comportamento do servo.
2. Como você poderia controlar o servo motor de forma mais precisa, com ângulos intermediários? Experimente adicionar mais posições intermediárias no código.
3. O que acontece se inserir um valor maior que 180 ou menor que 0? Experimente e observe o comportamento.

---

### Bloco 3: Controle do Servo com Potenciômetro Linear

Agora que já exploramos o funcionamento do potenciômetro e do servo motor, vamos combinar os dois para controlar o servo motor a partir da posição do potenciômetro. 

Neste bloco, vamos utilizar um potenciômetro linear para controlar o ângulo do servo motor, ajustando a amplitude dos valores lidos pelo potenciômetro para o intervalo de 0 a 180 graus. Para isso, utilizaremos a função `map()` do Arduino, que mapeia um valor de um intervalo para outro.

#### Passo 1: Introdução ao Circuito

Nesse bloco, combinaremos os circuitos dos blocos 1 e 2, conectando o potenciômetro e o servo motor ao Arduino.

#### Passo 2: Programação

1. Abra o Arduino IDE e escreva o seguinte código:

```cpp
#include <Servo.h>

Servo myServo;

void setup() {
  myServo.attach(9);
  Serial.begin(9600);
}

void loop() {
  int potValue = analogRead(A0);

  int angle = map(potValue, 0, 1023, 0, 180); // Mapeia o valor do potenciômetro (0 a 1023) para a amplitude do servo (0 a 180 graus)

  myServo.write(angle); // Define a posição do servo motor

  Serial.print("Potentiometer Value: ");
  Serial.print(potValue);
  Serial.print(" - Servo Angle: ");
  Serial.println(angle);
  delay(15);
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Gire o potenciômetro e observe como o servo motor se move de acordo com a posição do potenciômetro.
2. Observe os valores no Serial Monitor para entender a relação entre a leitura do potenciômetro e o ângulo do servo.

#### Passo 4: Exploração

1. A relação entre a posição do potenciômetro e o ângulo do servo é linear? Experimente girar o potenciômetro lentamente e observe a saída na tela e na escala do servo. Calcule a razão entre a variação do potenciômetro e a variação do ângulo do servo para pelo menos 3 valores para verificar a linearidade.
2. O que acontece se inverter as conexões do potenciômetro? Inverta os fios de alimentação (5V) e terra (GND) e observe o comportamento. O que acontece ao girar o potenciômetro assim como antes?
3. O que acontece se alterar os valores de 0 e 180 graus no código? Experimente alterar esses valores e observe o comportamento do servo.

---

### Bloco 4: Troca do Potenciômetro Linear pelo Logarítmico

Neste bloco, vamos substituir o potenciômetro linear pelo potenciômetro logarítmico e observar as diferenças no comportamento do servo motor. O potenciômetro logarítmico possui uma curva de resposta não linear, o que pode afetar o controle do servo motor.

#### Passo 1: Introdução ao Circuito

Substitua o potenciômetro linear pelo potenciômetro logarítmico, mantendo as mesmas conexões do bloco anterior.

#### Passo 2: Programação

Nesse bloco, usaremos o mesmo código do bloco anterior, pois a mudança no potenciômetro não afeta a programação do Arduino, apenas os valores que serão lidos e mapeados para o servo motor. 

Antes de começar as análises, confira se o código referente ao bloco anterior está carregado na placa.

#### Passo 3: Observação

1. Gire o potenciômetro logarítmico e observe a resposta do servo motor.
2. Observe os valores no Serial Monitor para entender as diferenças na leitura do potenciômetro logarítmico comparado ao linear.

#### Passo 4: Exploração

1. A relação entre a posição do potenciômetro e o ângulo do servo é linear? Experimente girar o potenciômetro lentamente e observe a saída na tela e na escala do servo. Calcule a razão entre a variação do potenciômetro e a variação do ângulo do servo para pelo menos 3 valores para verificar a linearidade.
2. O que acontece se inverter as conexões do potenciômetro? Inverta os fios de alimentação (5V) e terra (GND) e observe o comportamento. O que acontece ao girar o potenciômetro assim como antes?
3. Porque isso acontece? O que você pode concluir sobre o uso de potenciômetros logarítmicos em sistemas de controle? Em que cenários eles podem ser mais úteis que os lineares?

--- 

### Bloco 5: Linearização do Potenciômetro Logarítmico

Neste bloco, vamos coletar dados de um transferidor graduado fixo ao servo motor para gerar uma função inversa no Excel e linearizar o potenciômetro logarítmico. A linearização do potenciômetro logarítmico é importante para garantir um controle preciso do servo motor, ajustando a resposta do potenciômetro para uma relação linear com o ângulo do servo. Embora estejamos realizando esse procedimento manualmente, em sistemas mais complexos, essa linearização pode ser feita por meio de algoritmos de controle, sendo úteis para calibrar até mesmo sensores lineares que possuem algum desvio ou não-linearidade.

### Passo 1: Introdução ao Circuito

Nesse bloco, usaremos o mesmo circuito do bloco anterior, com o potenciômetro logarítmico e o servo motor conectados ao Arduino. Contudo, para facilitar a coleta de dados e produzir um volume constante de dados, vamos utilizar um botão para controlar o instante em que os dados serão coletados.

1. Adicione um botão à proto-board
2. Conecte um dos pinos ao terminal de 5V e o outro pino a um resistor de 10k ohms, que será conectado ao GND. 
3. Conecte um pino do outro lado do botão ao Arduino. Quando pressionado, o botão fechará o circuito entre os dois lados do botão, enviando um sinal ao Arduino.

Para mais referências sobre o circuito, consulte o [exemplo do Arduino sobre botões](https://www.arduino.cc/en/Tutorial/BuiltInExamples/Button).

### Passo 2: Programação

1. Abra o Arduino IDE e escreva o seguinte código:

```cpp
#include <Servo.h>

Servo myServo;

int buttonPin = 2; // Define o pino do botão

void setup() {
    myServo.attach(9);
    Serial.begin(9600);
    pinMode(buttonPin, INPUT_PULLUP); // Define o pino do botão como entrada com pull-up (se não pressionado, o pino lê HIGH)
}

void loop() {


    int potValue = analogRead(A0);
    int angle = map(potValue, 0, 1023, 0, 180);
    myServo.write(angle);

    if (digitalRead(buttonPin) == LOW) { // Verifica se o botão foi pressionado
    
        Serial.print("Potentiometer Value: ");
        Serial.print(potValue);
        Serial.print(" - Servo Angle: ");
        Serial.println(angle);
        
        delay(15);
    }
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

### Passo 3: Observação

1. Abra o Serial Monitor. Os valores do potenciômetro e do ângulo do servo motor serão exibidos apenas quando o botão for pressionado.
2. Para cada demarcação no transferidor graduado do potenciômetro, pressione o botão para coletar o valor do potenciômetro e o ângulo do servo motor.
3. Repita esse procedimento para todas as posições do potenciômetro.
4. Abra uma planilha do Excel e transfira os dados coletados, construindo uma tabela no formato mostrado abaixo. Ela será a nossa base para a linearização do potenciômetro logarítmico.

| Potentiometer Angle | Servo Angle |
|---------------------|-------------|
| 0                   | 0           |
| 10                  | 40          |
| 20                  | 60          |
| ...                 | ...         |
| 300                 | 180         |

### Passo 4: Análise dos Dados no Excel

1. Gere um gráfico de dispersão com os dados coletados, conectando os pontos com linhas retas ou suaves. O eixo x será o ângulo do potenciômetro e o eixo y será o ângulo do servo motor. Como é o formato da curva gerada? Isso condiz com o comportamento logarítimico do potenciômetro?
2. Crie uma coluna ```Target```, apontando o comportamento "ideal" caso o potenciômetro fosse linear. Para isso, calcule a seguinte razão:

$$ = (Potentiometer Angle / Potentiometer Maximum Angle) * Servo Maximum Angle $$

3. Crie uma coluna ```Error```, calculando a diferença entre o valor do servo e o valor "ideal" para cada ponto.

$$ = Servo Angle - Target $$

4. Gere um gráfico de dispersão entre ```Potentiometer Angle``` e ```Error```. O que você pode concluir sobre a linearidade do potenciômetro logarítmico? O erro é constante ou varia com o ângulo do potenciômetro?

5. Crie uma linha de tendência polinomial sobre os dados. Qual o grau do polinômio que melhor se ajusta aos dados? O que isso indica sobre a relação entre o potenciômetro e o servo motor?

6. Selecione a opção de exibir a equação da linha de tendência no gráfico. Ela deverá ser do tipo:

$$ y = a * x^n + b * x^{n-1} + ... + c $$

7. Crie uma nova coluna ```Expected Potentiometer Error```, calculando o valor da equação para cada medida, sendo $x$ o valor do potenciômetro e $y$ o valor do erro esperado.

8. Por fim, crie uma nova coluna ```Linearized Potentiometer Angle```, calculando o valor do potenciômetro linearizado para cada medida, somando o valor do potenciômetro com o valor do erro esperado.

### Passo 5: Programação para Linearização

Agora que já definimos um erro esperado para cada posição do potenciômetro, podemos ajustar o código do Arduino para calcular esse erro e ajustar os dados, de modo a obter um comportamento linear do servo motor. 

1. Preencha a função abaixo com os coeficientes obtidos no excel. Ajuste o número de coeficientes conforme o grau da equação obtida.

```cpp
float linearizePotentiometer(int potValue) {
  // Substitua os valores de a, b, c, ... pelos coeficientes obtidos no Excel
  float a = 0.0001;
  float b = 0.001;
  float c = 0.1;
  
  // Calcula o valor esperado do erro
  float expectedErrorValue = a * pow(potValue, 2)
                           + b * potValue 
                           + c;

  // Calcula o valor linearizado do potenciômetro
  float linearValue = potValue + expectedErrorValue;

  // Trunca os valor obtido entre 0 e 180
  if (linearValue < 0) linearValue = 0;
  if (linearValue > 180) linearValue = 180;
  
  // Retorna o valor linearizado
  return linearValue;
}
```

2. Cole a função acima no topo do código do Arduino, antes da função ```void setup()```.

3. Substitua o ```void loop()``` por:

```cpp
void loop() {

    int potValue = analogRead(A0);
    int angle = map(linearizePotentiometer(potValue), 0, 1023, 0, 180); // Usa o valor linearizado do potenciômetro ao invés do valor original
    myServo.write(angle);

    if (digitalRead(buttonPin) == LOW) {
        Serial.print("Potentiometer Value: ");
        Serial.print(potValue);
        Serial.print(" - Linearized Value: ");
        Serial.print(linearizePotentiometer(potValue));
        Serial.print(" - Servo Angle: ");
        Serial.println(angle);

        delay(15);
    }
}
```

4. Selecione a placa e a porta de conexão onde o Arduino está conectado.
5. Faça o upload do código para a placa Arduino.
6. Observe se o servo motor responde de forma mais linear ao movimento do potenciômetro.

### Conclusão

Este experimento apresentou os potenciômetros e servo motores, começando com o uso de um potenciômetro linear, seguido pela substituição por um potenciômetro logarítmico. A coleta de dados e a linearização da resposta do potenciômetro logarítmico proporcionaram uma compreensão prática de como ajustar o controle de dispositivos eletrônicos para obter um comportamento desejado.

### Referências para Consulta

- [Documentação Oficial do Arduino](https://www.arduino.cc/en/Guide/HomePage)
- [Biblioteca Servo](https://www.arduino.cc/en/Reference/Servo)
- [Função `map()`](https://www.arduino.cc/reference/en/language/functions/math/map/)
- [Exemplo do Arduino sobre botões](https://www.arduino.cc/en/Tutorial/BuiltInExamples/Button)

### Sugestões de Leitura

- [Potentiometer - Wikipedia](https://en.wikipedia.org/wiki/Potentiometer)
- [Eletronics Basics, How a Potentiometer Works - Random Nerd Tutorials](https://randomnerdtutorials.com/electronics-basics-how-a-potentiometer-works/)
- [Servo Motor - Wikipedia](https://en.wikipedia.org/wiki/Servo_motor)
- [Servos Explained - SparkFun](https://www.sparkfun.com/servos)
- [Linearization - Wikipedia](https://en.wikipedia.org/wiki/Linearization)

---# Introdução à Eletrônica com Arduino

## Sensor de Distância e Sonar

### Descrição

Esse roteiro apresenta o uso de sensores de distância ultrassônicos, como o HC-SR04, para medir a distância entre o sensor e um objeto. Sensores de distância são amplamente utilizados em projetos de robótica, automação e IoT para detectar a presença de objetos e medir distâncias. Na marinha, por exemplo, são utilizados sonares para medir a profundidade do oceano e detectar a presença de peixes e outras embarcações.

Existem diversos tipos de sensores de distância, como os sensores ultrassônicos, infravermelhos e a laser. Em projetos simples de eletrônica, os sensores ultrassônicos são uma opção acessível e eficaz para medir distâncias de alguns centímetros a vários metros, dependendo do modelo. Para projetos mais avançados, sensores a laser podem ser utilizados para medir distâncias com maior precisão e em maiores distâncias, podendo ser encontrados em sistemas de navegação de veículos autônomos e drones.

Neste roteiro, vamos explorar o funcionamento do sensor de distância e como ele pode ser utilizado para medir a distância entre o sensor e um objeto, construindo o nosso primeiro "sonar" com Arduino.

### Objetivos

- Apresentar o funcionamento do sensor de distância ultrassônico HC-SR04.
- Utilizar exemplos de bibliotecas para sensores na Arduino IDE.
- Realizar experimentos para medir a distância entre o sensor e um objeto.
- Construir um "sonar" com Arduino e exibir os dados em um dashboard gráfico.
- Discutir a importância de ferramentas de visualização adequadas para análise de dados.

### Materiais Necessários

- 1x Placa Arduino (Uno, Mega, ou similar)
- 1x Cabo USB para conexão com o computador
- 1x Sensor de distância ultrassônico HC-SR04
- 1x Motor de passo (28BYJ-48) e driver (ULN200x)
- 1x Régua graduada
- 1x Protoboard
- Breadboard e jumpers
- Peças de apoio impressas em 3D
- Computador com Arduino IDE e Processing instalados

### Palavras-chave

Arduino, Sensor de Distância, HC-SR04, Sonar, Motor de Passo, Driver de Motor, Processing, Dashboard, Visualização de Dados.

---

## Metodologia

### Bloco 1: Sensor de Distância HC-SR04

Sensores de distância ultrassônicos, como o HC-SR04, utilizam ondas sonoras para medir a distância entre o sensor e um objeto. O sensor emite um pulso ultrassônico e mede o tempo que o pulso leva para retornar ao sensor após refletir em um objeto. A distância é calculada com base no tempo de ida e volta do pulso e na velocidade do som no ar (geralmente tratada como constante igual a 343 m/s a 20°C).

#### Passo 1: Instalação ao Circuito

1. Conecte o sensor HC-SR04 ao Arduino conforme o esquemático abaixo:
   - Pino VCC do sensor ao 5V do Arduino
   - Pino GND do sensor ao GND do Arduino
   - Pino Trig do sensor ao pino digital 2 do Arduino
   - Pino Echo do sensor ao pino digital 3 do Arduino

#### Passo 2: Programação

1. Instale a biblioteca ```HCSR04 ultrasonic sensor``` na Arduino IDE. Para isso, abra o Library Manager e busque por ```HCSR04 ultrasonic sensor```, de ```gamegine```.

2. Abra o Arduino IDE e abra o exemplo "HCSR04 ultrasonic sensor" em ```File > Examples > HCSR04 ultrasonic sensor > HCSR04```

3. Confira os pinos descritos na inicialização do sensor e faça as alterações necessárias no código, se necessário.

4. Selecione a placa e a porta de conexão onde o Arduino está conectado.

5. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.
2. Observe a distância medida pelo sensor de acordo com a presença de objetos próximos ao sensor. A distância é exibida em centímetros.

#### Passo 4: Exploração

1. Abra o Serial Plotter na Arduino IDE para visualizar os dados de distância em tempo real, de forma gráfica.

2. O que acontece se não houver objetos próximos ao sensor? E se houver objetos a diferentes distâncias? Experimente apontar o sensor para diferentes objetos e colocar sua mão em frente ao sensor.

3. O sensor é estável e preciso? Existem flutuações nos valores de distância? O que pode causar essas flutuações?

---

### Bloco 2: Experimento com Régua Graduada

Neste bloco, vamos realizar um experimento para medir a distância entre o sensor HC-SR04 e um objeto, movendo o sensor sobre uma régua graduada e anotando os valores de distância. Em seguida, vamos plotar uma curva de resposta no Excel para analisar o comportamento do sensor.

#### Passo 1: Introdução ao Circuito

1. Conecte o sensor HC-SR04 ao Arduino conforme o esquemático do bloco anterior.

2. Coloque o sensor sobre uma régua graduada, de forma que seja possível movê-lo para medir diferentes distâncias.

#### Passo 2: Programação

1. Nesse bloco, vamos utilizar o mesmo código do bloco anterior, pois o objetivo é coletar dados de distância para análise posterior.

#### Passo 3: Observação

1. Mova o sensor sobre a régua graduada e anote os valores de distância exibidos no Serial Monitor.

2. Anote os valores de distância para diferentes posições do sensor numa planilha do Excel. O resultado deve ser do seguinte formato:

| Distance (cm) | Sensor Value |
|---------------|--------------|
| 0             | 0            |
| 1             | 3            |
| 2             | 5            |
| ...           | ...          |
| 30           | 100          |

3. Construa um gráfico de dispersão com os dados coletados, exibindo a relação entre a distância real e os valores lidos pelo sensor.

#### Passo 4: Exploração

1. A curva de resposta do sensor é linear? Existe alguma tendência ou padrão nos dados coletados?

2. O sensor é mais preciso em distâncias curtas ou longas? Existe alguma faixa de distância onde o sensor é mais preciso?

3. O "zero" do sensor corresponde a uma distância real de 0 cm? O que pode causar essa diferença?

---

### Bloco 3: Motor de Passo e Driver

Motores de Passo são dispositivos utilizados para converter pulsos elétricos em movimentos mecânicos precisos. Eles são amplamente utilizados em projetos de robótica, CNC, impressoras 3D e sistemas de posicionamento. Neste bloco, vamos explorar o uso de um motor de passo (28BYJ-48) e um driver (ULN200x) com Arduino.

#### Passo 1: Introdução ao Circuito

1. Conecte o motor de passo ao driver conforme o esquemático abaixo:
    - Pino IN1 do driver ao pino digital 8 do Arduino
    - Pino IN2 do driver ao pino digital 9 do Arduino
    - Pino IN3 do driver ao pino digital 10 do Arduino
    - Pino IN4 do driver ao pino digital 11 do Arduino
    - Pino GND do driver ao GND do Arduino
    - Pino VCC do driver ao 5V do Arduino

2. Conecte o motor de passo ao driver usando o conector de 5 pinos.

#### Passo 2: Programação

1. Instale a biblioteca ```Stepper``` na Arduino IDE. Para isso, abra o Library Manager e busque por ```Stepper```.

2. Abra o Arduino IDE e abra o exemplo "Stepper" em ```File > Examples > Stepper > stepper_oneStepAtATime```

3. Confira os pinos descritos na inicialização do motor de passo e faça as alterações necessárias no código, se necessário. Nesse caso, é necessário atualizar o ```stepsPerRevolution``` para 64.

4. Selecione a placa e a porta de conexão onde o Arduino está conectado.

5. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o movimento do motor de passo conforme o código é executado. O motor deve girar lentamente, 1 "passo" a cada iteração do ```void loop()```.

2. Se necessário, cole uma fita adesiva ao eixo do motor para facilitar a visualização do movimento.

#### Passo 4: Exploração

1. O motor de passo gira de forma precisa? Ele consegue girar exatamente 1 passo a cada iteração do loop?

2. O que acontece se alterar o valor de ```stepsPerRevolution``` no código? Experimente aumentar ou diminuir esse valor e observe o comportamento do motor.

3. Como podemos controlar a velocidade dessa rotação? E a direção? Podemos pedir para ele girar mais de um passo por iteração?

4. O que esse motor difere do servo motor utilizado anteriormente? Em que cenários cada um é mais adequado?

---

### Bloco 4: Construção do Sonar

Neste bloco, vamos construir um "sonar" com Arduino, juntando as peças já impressas em 3D e utilizando o sensor HC-SR04 para medir a distância entre o sensor e um objeto. Vamos exibir os dados de distância no monitor serial e no plotter serial, mas levantaremos a discussão sobre a importância de ferramentas de visualização adequadas para análise de dados espaciais.

#### Passo 1: Introdução ao Circuito

1. Monte as peças impressas em 3D para construir o suporte do sensor HC-SR04.

2. Conecte o sensor HC-SR04 ao Arduino conforme o esquemático do bloco 1.

3. Posicione o sensor no suporte e aponte-o para a área que deseja medir a distância.

#### Passo 2: Programação

1. Abra o Arduino IDE e escreva o seguinte código:

```cpp
#include <Stepper.h>
#include <HCSR04.h>

// Definições de pinos
#define STEPPER_PIN_1 8
#define STEPPER_PIN_2 9
#define STEPPER_PIN_3 10
#define STEPPER_PIN_4 11
#define TRIG_PIN 2
#define ECHO_PIN 3

// Parâmetros do motor de passo
#define STEPS_PER_REV 64 // Número de passos por revolução
#define DEGREES_PER_STEP (360.0 / STEPS_PER_REV)

// Define o objeto do motor de passo
Stepper stepper(STEPS_PER_REV, STEPPER_PIN_1, STEPPER_PIN_3, STEPPER_PIN_2, STEPPER_PIN_4);

// Define o objeto do sensor de distância HC-SR04
HCSR04 hcsr04(TRIG_PIN, ECHO_PIN);

void setup() {
    Serial.begin(9600);
    stepper.setSpeed(10); // Define a velocidade do motor de passo

    // Inicializa o sensor HC-SR04
    hcsr04.begin();
}

void loop() {

    // Faz a varredura do sensor de 0 a 180 graus
    for (int angle = 0; angle <= 180; angle++) {
        stepper.step(DEGREES_PER_STEP);
        float distance = hcsr04.dist();
        Serial.print(angle);
        Serial.print(",");
        Serial.println(distance);
        delay(100);
    }

    // Faz a varredura do sensor de 180 a 0 graus
    for (int angle = 180; angle >= 0; angle--) {
        stepper.step(-DEGREES_PER_STEP);
        float distance = hcsr04.dist();
        Serial.print(angle);
        Serial.print(",");
        Serial.println(distance);
        delay(100);
    }
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o movimento do motor de passo e a medição da distância pelo sensor HC-SR04.

2. Os valores de distância são exibidos no monitor serial. Observe como a distância varia conforme o sensor se move.

#### Passo 4: Exploração

1. O que acontece se alterar a velocidade do motor de passo? Experimente aumentar ou diminuir a velocidade e observe o comportamento.

2. Como podemos controlar o ângulo mínimo e máximo dos movimentos do motor? Experimente alterar os valores de 0 e 180 no código.

3. O que você pode concluir sobre a visualização dos dados de distância no monitor serial? É uma forma eficaz de analisar esses dados espaciais? O que poderia ser feito para melhorar essa visualização?

4. Experimente visualizar os dados através do Serial Plotter. Como essa visualização se compara à exibição no monitor serial? É melhor? É pior? É suficiente para analisar esses dados espaciais?

---

### Bloco 5: Dashboard de Sonar com Processing

Neste bloco, vamos utilizar o Processing para criar um dashboard gráfico para exibir os dados do "sonar" de forma mais visual e interativa. O Processing é uma linguagem de programação e ambiente de desenvolvimento integrado (IDE) de código aberto baseado em Java, amplamente utilizado para criar visualizações interativas, arte generativa e aplicações multimídia.

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito do bloco anterior montado e conectado ao Arduino.

2. Mantenha o Arduino conectado ao computador via cabo USB.

#### Passo 2: Programação

1. Abra o Processing e escreva o seguinte código para criar um dashboard gráfico do sonar:

```java
import processing.serial.*;

Serial myPort;  // The serial port
float angle = 0;
float distance = 0;

void setup() {
  size(600, 600);
  // Ajuste a porta serial conforme necessário
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // Aguarda até receber uma nova linha
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  fill(255);
  noStroke();
  
  // Desenha o arco de acordo com o ângulo e a distância
  float arcRadius = map(distance, 0, 400, 0, width / 2);
  float arcAngle = radians(angle);
  fill(255, 0, 0);
  ellipse(arcRadius * cos(arcAngle), arcRadius * sin(arcAngle), 10, 10);
  
  // Desenha a escala do radar
  noFill();
  stroke(100);
  for (int i = 50; i <= width / 2; i += 50) {
    ellipse(0, 0, i * 2, i * 2);
  }
  
  // Desenha as linhas de ângulo
  for (int i = 0; i <= 180; i += 30) {
    float rad = radians(i);
    line(0, 0, (width / 2) * cos(rad), (width / 2) * sin(rad));
    fill(255);
    textAlign(CENTER, CENTER);
    text(i + "°", (width / 2 - 20) * cos(rad), (width / 2 - 20) * sin(rad));
  }
  
  // Desenha os valores atuais de ângulo e distância
  fill(255);
  textAlign(CENTER);
  text("Angle: " + angle + "°", 0, -height / 2 + 20);
  text("Distance: " + distance + " cm", 0, -height / 2 + 40);
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    String[] values = split(inString, ',');
    if (values.length == 2) {
      angle = float(values[0]);
      distance = float(values[1]);
    }
  }
}
```

2. Substitua a porta ```COM3``` pela porta onde o Arduino está conectado.

3. Execute o código no Processing para abrir o dashboard gráfico. 

#### Passo 3: Observação

1. Observe o dashboard gráfico gerado pelo Processing. Ele deve exibir uma visualização similar a um sonar, com pontos representando as distâncias medidas pelo sensor em diferentes ângulos.

#### Passo 4: Exploração

1. O que você pode concluir sobre a visualização dos dados de distância no dashboard gráfico? É uma forma mais eficaz de analisar esses dados espaciais em comparação com o monitor serial e o plotter serial?

2. Como essa visualização poderia ser útil em aplicações reais na marinha, como sistemas de navegação, mapeamento de ambientes ou detecção de obstáculos?

---

### Conclusão

Este roteiro apresentou o uso de sensores de distância ultrassônicos, como o HC-SR04, para medir a distância entre o sensor e um objeto. A construção de um "sonar" com Arduino permitiu explorar o funcionamento do sensor e a visualização dos dados de distância em diferentes formatos, como monitor serial, plotter serial e dashboard gráfico. A utilização de ferramentas de visualização adequadas é essencial para analisar dados espaciais de forma eficaz e tomar decisões informadas em projetos de eletrônica e automação.

### Referências para Consulta

- [Documentação Oficial do Arduino](https://www.arduino.cc/en/Guide/HomePage)
- [Biblioteca HCSR04 Ultrasonic Sensor](https://www.arduino.cc/reference/en/libraries/hcsr04-ultrasonic-sensor/)
- [Biblioteca Stepper](https://www.arduino.cc/en/Reference/Stepper)
- [Processing](https://processing.org/)
- [Tutorial de Introdução ao Processing](https://processing.org/tutorials/gettingstarted/)
- [Processing Serial Library](https://processing.org/reference/libraries/serial/index.html)

### Sugestões de Leitura

- [Ultrasonic Sensor - Wikipedia](https://en.wikipedia.org/wiki/Ultrasonic_sensor)
- [Stepper Motor - Wikipedia](https://en.wikipedia.org/wiki/Stepper_motor)
- [Sonar - Wikipedia](https://en.wikipedia.org/wiki/Sonar)
- [Data Visualization - Wikipedia](https://en.wikipedia.org/wiki/Data_visualization)

---# Introdução à Eletrônica com Arduino

## Weather Station (Qualidade do Ar)

### Descrição

Neste roteiro, vamos utilizar o sensor MQ-2 para medir a concentração de gases inflamáveis, fumaça e álcool no ambiente. Além disso, vamos adicionar o DHT11, capaz de medir a temperatura e umidade relativa do ar. Combinando esses sensores, vamos construir uma "estação meteorológica" com Arduino para monitorar a qualidade do ar e as condições ambientais em tempo real. Além disso, iremos explorar novos métodos de exibição dos dados, com uma primeira experiência sobre IoT (Internet das Coisas).

### Objetivos

- Utilizar o sensor DHT11 para medir a temperatura e umidade relativa do ar.
- Apresentar o funcionamento do sensor MQ-2 para medir a concentração de gases inflamáveis, fumaça e álcool no ambiente.
- Construir uma estação meteorológica com Arduino para monitorar a qualidade do ar e as condições ambientais em tempo real.
- Exibir os dados da estação meteorológica em um display LCD e em uma página web local.

### Materiais Necessários

- 1x Placa Arduino (Uno, Mega, ou similar)
- 1x Cabo USB para conexão com o computador
- 1x Sensor de temperatura e umidade DHT11
- 1x Sensor de gás inflamável MQ-2
- 1x Display LCD 16x2 com I2C
- 1x ESP8266 (ESP-01)
- Breadboard e jumpers
- Isqueiro

### Palavras-chave

Arduino, Sensor de Temperatura e Umidade, DHT11, Sensor de Gás Inflamável, MQ-2, Display LCD, ESP8266, IoT, Internet das Coisas.

---

## Metodologia

### Bloco 1: DHT11: Sensor de Temperatura

O sensor DHT11 é um sensor de temperatura e umidade relativa do ar, capaz de medir a temperatura entre 0 e 50°C. Ele é amplamente utilizado em projetos de automação residencial, controle de climatização e monitoramento ambiental. Neste bloco, vamos explorar o funcionamento do sensor DHT11 e como ele pode ser utilizado para medir a temperatura do ar.

#### Passo 1: Introdução ao Circuito

1. Conecte o sensor DHT11 ao Arduino conforme o esquemático abaixo:
   - Pino VCC do sensor ao 5V do Arduino
   - Pino GND do sensor ao GND do Arduino
   - Pino DATA do sensor ao pino digital 2 do Arduino

<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS30K55UqeITRNTNB1I5sXJSxa9DanTKt-GXw&s" width="300">
</p>

2. Adicione um resistor de 10k ohms entre o pino DATA e o pino VCC do sensor (para manter o pino DATA em nível lógico alto quando não houver transmissão de dados).

#### Passo 2: Programação

1. Instale a biblioteca ```DHT11``` na Arduino IDE. Para isso, abra o Library Manager e busque por ```DHT11```, de Dyruba Saha.

2. Abra o Arduino IDE e abra o exemplo "DHT11" em ```File > Examples > DHT11 > ReadTemperature```

3. Selecione a placa e a porta de conexão onde o Arduino está conectado.

4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.
2. Observe a temperatura medida pelo sensor DHT11. A temperatura é exibida em graus Celsius.

#### Passo 4: Exploração

1. O sensor DHT11 é preciso e estável? Existem flutuações nos valores de temperatura?

2. O sensor responde rapidamente a mudanças de temperatura? Experimente assoprar vento frio ou quente na superfície do sensor e observe a resposta.

3. Como o sensor DHT11 poderia ser utilizado em projetos de automação residencial ou controle de climatização? Quais condições de temperatura podem indicar situações críticas?

---

### Bloco 2: DHT11: Sensor de Humidade

Além de medir a temperatura do ar, o sensor DHT11 também é capaz de medir a umidade relativa do ar, entre 20% e 80%. A umidade relativa é um parâmetro importante para avaliar o conforto térmico e a qualidade do ar em ambientes internos. Neste bloco, vamos explorar a medição da umidade relativa do ar com o sensor DHT11.

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito do bloco anterior montado e conectado ao Arduino.

#### Passo 2: Programação

Nesse bloco, vamos utilizar o mesmo código do bloco anterior, pois o objetivo é coletar dados de umidade para análise posterior.

1. Abra o exemplo "DHT11" em ```File > Examples > DHT11 > ReadHumidity```

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.
2. Observe a umidade relativa do ar medida pelo sensor DHT11. A umidade é exibida em porcentagem.

#### Passo 4: Exploração

1. O sensor DHT11 é preciso e estável na medição da umidade relativa do ar? Existem flutuações nos valores de umidade?

2. Como a umidade relativa do ar pode afetar o conforto térmico e a saúde das pessoas em ambientes internos? Quais faixas de umidade são consideradas ideais para o conforto e a saúde?

3. Como o sensor DHT11 poderia ser utilizado em projetos de automação residencial ou controle de climatização? Quais condições de umidade podem indicar situações críticas?

---

### Bloco 3: MQ-2: Sensor de Gás Inflamável

O sensor MQ-2 é um sensor de gás inflamável, fumaça e álcool, capaz de detectar a concentração de gases inflamáveis no ambiente. Ele é amplamente utilizado em projetos de segurança, monitoramento de incêndios e controle de qualidade do ar. Neste bloco, vamos explorar o funcionamento do sensor MQ-2 e como ele pode ser utilizado para medir a concentração de gases inflamáveis no ambiente.

#### Passo 1: Introdução ao Circuito

1. Conecte o sensor MQ-2 ao Arduino conforme o esquemático abaixo:
   - Pino VCC do sensor ao 5V do Arduino
   - Pino GND do sensor ao GND do Arduino
   - Pino AOUT (A0) do sensor ao pino analógico A0 do Arduino
   - Pino DOUT (D0) do sensor ao pino digital 3 do Arduino

<p align="center">
    <img src="https://www.researchgate.net/publication/335160061/figure/fig5/AS:791710334464000@1565769861025/Pinout-of-MQ2-gas-sensor-module.jpg" width="300">
</p>

2. Adicione um resistor de 10k ohms entre o pino DOUT e o pino VCC do sensor (para manter o pino DOUT em nível lógico alto quando não houver transmissão de dados).

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código para medir a concentração de gases inflamáveis com o sensor MQ-2:

```cpp
#define MQ2_DOUT_PIN 3
#define MQ2_AOUT_PIN A0

void setup() {
    Serial.begin(9600);
    pinMode(MQ2_DOUT_PIN, INPUT);
}

void loop() {
    int digitalValue = digitalRead(MQ2_DOUT_PIN);
    int analogValue = analogRead(MQ2_AOUT_PIN);

    Serial.print("Digital Value: ");
    Serial.print(digitalValue);
    Serial.print(" - Analog Value: ");
    Serial.println(analogValue);

    delay(1000);
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.

2. Observe os valores de leitura digital e analógica do sensor MQ-2. O valor digital indica qualitativamente a presença de gases inflamáveis, enquanto o valor analógico indica quantitativamente a concentração desses gases.

3. Aproxime o sensor de uma fonte de fumaça ou álcool e observe as mudanças nos valores de leitura. Use o gás do isqueiro para estimular o sensor.

#### Passo 4: Exploração

1. O sensor MQ-2 é sensível e preciso na medição da concentração de gases inflamáveis? Existem flutuações nos valores de leitura?

2. O trimpot (potenciômetro) na face traaseira do módulo é usado para configurar um threshold de detecção. Experimente ajustar o trimpot para o mínimo e o máximo e observe como isso interfere na saída digital quando se aproxima o isqueiro.

3. Configure o sensor MQ-2 para acionar a saída digital com um isqueiro ao mesmo nível, mas a 10 cm de distância. Para isso, posicione o isqueiro e ajuste o trimpot até que a saída digital seja acionada. Experimente mover o isqueiro para diferentes distâncias e observe o comportamento do sensor.

3. Como o sensor MQ-2 poderia ser utilizado em projetos de segurança, monitoramento de incêndios ou controle de qualidade do ar? Quais gases inflamáveis ele é capaz de detectar? Como ele funciona? Consule a datasheet do módulo para mais informações.

---

### Bloco 4: Display LCD e Monitor de Qualidade do Ar

Neste bloco, vamos combinar os sensores DHT11 e MQ-2 com um display LCD para criar uma "estação meteorológica" com Arduino. Vamos exibir a temperatura, umidade relativa e a concentração de gases inflamáveis no ambiente em tempo real. Além disso, vamos explorar novos métodos de exibição dos dados, com um display LCD.

#### Passo 1: Introdução ao Circuito

1. Mantenha as conexões dos sensores DHT11 e MQ-2 ao Arduino conforme os blocos anteriores.

2. Conecte o display LCD ao Arduino conforme o esquemático abaixo:

TODO: Add schematic

#### Passo 2: Programação

1. Instale a biblioteca ```LiquidCrystal``` na Arduino IDE. Para isso, abra o Library Manager e busque por ```LiquidCrystal```.

2. Abra o Arduino IDE e escreva o seguinte código para exibir a temperatura, umidade e concentração de gases inflamáveis no display LCD:

```cpp

#include <DHT11.h> // Inclui a biblioteca do sensor DHT11
#include <LiquidCrystal.h> // Inclui a biblioteca do display LCD

// Define os pinos do DHT11
#define DHT11_PIN 2

// Define os pinos do MQ-2
#define MQ2_DOUT_PIN 3 // Pino DOUT do sensor MQ-2
#define MQ2_AOUT_PIN A0 // Pino AOUT do sensor MQ-2

// Define os pinos do display LCD
#define LCD_RS 10
#define LCD_EN 11
#define LCD_D4 4
#define LCD_D5 5
#define LCD_D6 6
#define LCD_D7 7

// Inicializa o display LCD
LiquidCrystal lcd(LCD_RS, LCD_EN, LCD_D4, LCD_D5, LCD_D6, LCD_D7);

// Inicializa o sensor DHT11
DHT11 dht11(DHT11_PIN);

void setup() {
    Serial.begin(9600);
    lcd.begin(16, 2); // Inicializa o display LCD com 16 colunas e 2 linhas
}

void loop() {
    // Lê a temperatura e umidade do sensor DHT11
    int temperature = dht11.readTemperature();
    int humidity = dht11.readHumidity();

    // Lê a leitura analógica e digital do sensor MQ-2
    int gasAnalogValue = analogRead(MQ2_AOUT_PIN);
    int gasDigitalValue = digitalRead(MQ2_DOUT_PIN);

    // Exibe os valores no monitor serial
    Serial.print("Temperature: ");
    Serial.print(temperature);
    Serial.print("°C - Humidity: ");
    Serial.print(humidity);
    Serial.print("% - Gas Analog: ");
    Serial.print(gasAnalogValue);
    Serial.print(" - Gas Digital: ");
    Serial.println(gasDigitalValue);

    // Limpa o Display LCD
    lcd.clear();

    // Formata o texto para exibição no display LCD
    lcd.setCursor(0, 0);
    lcd.print("Temp: ");
    lcd.print(temperature);
    lcd.print(" C Hum: ");
    lcd.print(humidity);
    lcd.print("%");

    lcd.setCursor(0, 1);
    lcd.print("Gas Level: ");
    lcd.print(gasAnalogValue);
    lcd.print("(");
    lcd.print(gasDigitalValue);
    lcd.print(")");

    delay(3000);
}
```

3. Selecione a placa e a porta de conexão onde o Arduino está conectado.

4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o display LCD conectado ao Arduino.

2. Os valores de temperatura, umidade e concentração de gases inflamáveis são exibidos no display LCD. A temperatura é exibida em graus Celsius, a umidade em porcentagem e a concentração de gases em valores analógicos e digitais.

#### Passo 4: Exploração

1. O display LCD é uma forma eficaz de exibir os dados da estação meteorológica? É fácil de ler e interpretar? O que poderia ser feito para melhorar a visualização desses dados? Quais outros sinalizadores poderiam ser usados para indicar situações críticas? Tente lembrar de sistemas comerciais e dos estímulos que são usados.

2. Como a estação meteorológica poderia ser expandida para monitorar outros parâmetros ambientais? Quais sensores adicionais poderiam ser utilizados e como eles poderiam ser integrados ao sistema? Experimente buscar sensores no mercado e avaliar suas especificações, compondo um projeto mais complexo sobre a qualidade do ar.

---

### Bloco 5: IoT: Monitor de Qualidade do Ar na Internet

Neste bloco, vamos explorar a Internet das Coisas (IoT) e como podemos exibir os dados da estação meteorológica em uma página web local. Para isso, vamos utilizar o módulo ESP8266 (ESP-01) para conectar o Arduino à rede Wi-Fi e enviar os dados para um servidor local. Vamos criar uma página web simples para exibir os dados da estação meteorológica em tempo real, que poderá ser acessada de qualquer dispositivo conectado à mesma rede.

TODO: Flash and program the ESP-01, and then connect it to the Arduino.
 -->


Roteiro "Health Monitor", coletando e exibindo dados do MAX30102. Dividido em blocos:

1. Introdução ao Sensor de Pulso MAX30102; Coleta de Heart Rate
2. Coleta de SpO2
3. Exibição dos Dados no display LCD
5. Coleta de frequencia cardíaca manualmente no pulso, comparando com a coleta de dados brutos dos LEDs do sensor, analisados e tratados com FFT no python.

# Introdução à Eletrônica com Arduino

## Health Monitor (Monitor de Saúde)

### Descrição

Neste roteiro, vamos utilizar o sensor MAX30102 para medir a frequência cardíaca e a saturação de oxigênio no sangue (SpO2). O sensor MAX30102 é um sensor capaz de medir a frequência cardíaca e a saturação de oxigênio no sangue de forma não invasiva. Neste roteiro, vamos explorar o funcionamento do sensor MAX30102 e como ele pode ser utilizado para monitorar a saúde em tempo real, construindo um monitor de saúde com Arduino. Além disso, iremos explorar outras formas de visualização dos dados, além de métodos matemáticos que podem ser utilizados para análise dos dados coletados.

<p align="center">
  <img src="https://ae01.alicdn.com/kf/S5450c2e454ec46ed902c16184232d10f7.jpg_640x640Q90.jpg_.webp" height="300">
</p>

### Objetivos

- Utilizar o sensor MAX30102 para medir a frequência cardíaca e a saturação de oxigênio no sangue (SpO2).
- Construir um monitor de saúde com Arduino para monitorar a frequência cardíaca e a SpO2 em tempo real.
- Exibir os dados do monitor de saúde no monitor serial e em um display LCD.
- Comparar a frequência cardíaca medida manualmente no pulso com a frequência cardíaca medida pelo sensor MAX30102, analisando os dados brutos com FFT no Python.

### Materiais Necessários

| Componente                           | Imagem                                                                                                      |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------|
| 1x Placa Arduino (Uno, Mega, ou similar) | <img src="https://images.tcdn.com.br/img/img_prod/900872/arduino_uno_r3_cabo_usb_2871_1_07f18cc89ab02c14be2c9fb5d9ae528c.jpg" height="100">                                                      |
| 1x Cabo USB para conexão com o computador  | <img src="https://cdn.awsli.com.br/78/78150/produto/14336474/0711a64daf.jpg" height="100">                                                     |
| 1x Sensor de Frequência Cardíaca e Oxigenação MAX30102 | <img src="https://ae01.alicdn.com/kf/S5450c2e454ec46ed902c16184232d10f7.jpg_640x640Q90.jpg_.webp"  height="100"> |
| 1x Display LCD 16x2                  | <img src="https://www.usinainfo.com.br/1020284-thickbox_default/display-lcd-16x2-com-fundo-verde.jpg" height="100">           |
| 1x Potenciômetro de 10k ohms         | <img src="https://www.soundtronics.co.uk/images/detailed/24/Ext-7300-400_n4xy-q3.jpg" height="100"> |
| Breadboard e jumpers                   | <img src="https://www.usinainfo.com.br/1027100-thickbox_default/kit-prototipagem-basico-com-protoboard-400-pontos-jumpers-41-pecas.jpg" height="100">                                           |

### Palavras-chave

Arduino, Sensor de Frequência Cardíaca, MAX30102, SpO2, Monitor de Saúde, Display LCD, Buzzer, FFT, Python.

---

## Metodologia

### Bloco 1: MAX30102: Frequência Cardíaca

Neste bloco, vamos explorar o funcionamento do sensor MAX30102 e como ele pode ser utilizado para medir a frequência cardíaca. Segundo a datasheet do sensor em questão, o MAX30102 é um sensor de frequência cardíaca e oxigenação no sangue (SpO2) que utiliza LEDs vermelho e infravermelho para medir a absorção de luz pelo sangue. Neste bloco, vamos focar na medição da frequência cardíaca. O princípio de funcionamento desse tipo de equipamento é baseado na fotopletismografia, que mede a variação do volume sanguíneo em um determinado local do corpo, é representado abaixo:

<p align="center">
  <img src="https://lastminuteengineers.com/wp-content/uploads/arduino/MAX30102-Pulse-Detection-Photoplethysmogram.png" height="300">
</p>

<p align="center">
  <img src="https://lastminuteengineers.com/wp-content/uploads/arduino/Pulse-Detection-Heart-Rate-Sensor-Working-Photoplethysmogram.png" height="300">
</p>

#### Passo 1: Introdução ao Circuito

1. Conecte o sensor MAX30102 ao Arduino conforme o esquemático abaixo:
   - Pino VIN do sensor ao 5V do Arduino
   - Pino GND do sensor ao GND do Arduino
   - Pino SDA do sensor ao pino A4 do Arduino
   - Pino SCL do sensor ao pino A5 do Arduino

<p align="center">
  <img src="..\..\src\images\Aula 5\max30102_circuit.png" height="300">

#### Passo 2: Programação

1. Instale a biblioteca ```SparkFun MAX3010x Pulse and Proximity Sensor Library``` na Arduino IDE. Para isso, abra o Library Manager e busque por ```MAX3010x```.

<p align="center">
  <img src="..\..\src\images\Aula 5\MAX30102 library.png" height="200">
</p>

2. Abra o exemplo "Example5_HeartRate" em ```File > Examples > SparkFun MAX3010x Pulse and Proximity Sensor Library > Example5_HeartRate```

3. Selecione a placa e a porta de conexão onde o Arduino está conectado.

4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.

2. Confira a baudrate (velocidade de transmissão) do monitor serial, que deve coincidir com a velocidade definida no código.

3. Posicione o dedo sobre os LEDs do sensor MAX30102 e observe a leitura da frequência cardíaca no monitor serial. A frequência cardíaca é exibida em batimentos por minuto (BPM).

#### Passo 4: Exploração

1. O sensor MAX30102 é sensível e preciso na medição da frequência cardíaca? Existem flutuações nos valores de leitura?

2. Como a frequência cardíaca medida pelo sensor MAX30102 se compara com a frequência cardíaca medida manualmente no pulso? Experimente medir a frequência cardíaca manualmente e compare com a leitura do sensor.

---

### Bloco 2: MAX30102: SpO2

Além de medir a frequência cardíaca, o sensor MAX30102 também é capaz de medir a saturação de oxigênio no sangue (SpO2). A saturação de oxigênio é um parâmetro importante para avaliar a oxigenação do sangue e a função pulmonar. Neste bloco, vamos explorar a medição da SpO2 com o sensor MAX30102.

> Durante a pandemia de COVID-19, a concentração de oxigênio no sangue tornou-se um indicador importante para monitorar a gravidade da doença e a necessidade de intervenção médica, principalmente quando abaixo de 90%.

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito do bloco anterior montado e conectado ao Arduino.

#### Passo 2: Programação

1. Abra o exemplo "Example6_SpO2" em ```File > Examples > SparkFun MAX3010x Pulse and Proximity Sensor Library > Example8_SPO2```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.

2. Confira a baudrate (velocidade de transmissão) do monitor serial, que deve coincidir com a velocidade definida no código.

3. Posicione o dedo sobre os LEDs do sensor MAX30102 e observe a leitura da frequência cardíaca no monitor serial. A frequência cardíaca é exibida em batimentos por minuto (BPM).

4. Observe a leitura da saturação de oxigênio no sangue (SpO2) no monitor serial. A SpO2 é exibida em porcentagem.

#### Passo 4: Exploração

1. O sensor MAX30102 é sensível e preciso na medição da saturação de oxigênio no sangue (SpO2)? Existem flutuações nos valores de leitura?

2. Caso existam flutuações, é possível que a oxigenação do sangue varie tão rápido quanto mostrado pelo sensor? O que poderia causar essas flutuações?

3. Como a saturação de oxigênio no sangue (SpO2) pode ser utilizada para monitorar a saúde e a oxigenação do sangue? Quais faixas de SpO2 são consideradas normais e quais indicam situações críticas?

---

### Bloco 3: Display LCD e Monitor de Saúde

Neste bloco, vamos combinar os sensores MAX30102 com um display LCD para criar um "monitor de saúde" com Arduino. Vamos exibir a frequência cardíaca e a saturação de oxigênio no sangue (SpO2) em tempo real no display LCD.

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito do bloco anterior montado e conectado ao Arduino.

2. Conecte o display LCD ao Arduino conforme o esquemático abaixo:

<p align="center">
    <img src="..\..\src\images\Aula 4\lcd_circuit.png" height="300">
</p>

#### Passo 2: Programação

1. Abra a Arduino IDE e abra o exemplo Abra o exemplo "Example8_SpO2" em ```File > Examples > SparkFun MAX3010x Pulse and Proximity Sensor Library > Example8_SpO2```

2. Observe a estrutura do código e adicione as linhas necessárias para exibir os dados de batimentos cardíacos e oxigenação no display LCD. Para isso, segue um exemplo de código:

```cpp
#include <LiquidCrystal.h>

// Define os pinos do display LCD
#define LCD_RS 13
#define LCD_EN 12
#define LCD_D4 11
#define LCD_D5 10
#define LCD_D6 9
#define LCD_D7 8

// Inicializa o display LCD
LiquidCrystal lcd(LCD_RS, LCD_EN, LCD_D4, LCD_D5, LCD_D6, LCD_D7);

void setup() {
    ...
    lcd.begin(16, 2); // Inicializa o display LCD com 16 colunas e 2 linhas
}

void loop() {
  ...
  // Limpa o Display LCD
  lcd.clear();

  // Formata o texto para exibição no display LCD
  lcd.setCursor(0, 0);
  lcd.print("T: ");
  lcd.print(temperature);
  lcd.print("oC H: ");
  lcd.print(humidity);
  lcd.print("%");

  lcd.setCursor(0, 1);
  lcd.print("Gas Lev.: ");
  lcd.print(gasAnalogValue);
  lcd.print("(");
  lcd.print(gasDigitalValue);
  lcd.print(")");
}
```

3. Selecione a placa e a porta de conexão onde o Arduino está conectado.

4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o display LCD conectado ao Arduino.

2. Os valores de frequência cardíaca e saturação de oxigênio no sangue (SpO2) são exibidos no display LCD.

#### Passo 4: Exploração

1. O display LCD é uma forma eficaz de exibir os dados do monitor de saúde? É fácil de ler e interpretar? O que poderia ser feito para melhorar a visualização desses dados? Quais outros sinalizadores poderiam ser usados para indicar situações críticas? Experimente pensar nos equipamentos comerciais, presentes em hospitais e farmácias, e como eles exibem esses dados.

2. Como o monitor de saúde poderia ser expandido para monitorar outros parâmetros de saúde? Quais sensores adicionais poderiam ser utilizados e como eles poderiam ser integrados ao sistema? Experimente buscar sensores no mercado e avaliar suas especificações, compondo um projeto mais complexo sobre monitoramento de saúde.

---

### Bloco 4: Análise de Dados com FFT

Neste bloco, vamos explorar a análise dos dados brutos coletados pelo sensor MAX30102 utilizando a Transformada Rápida de Fourier (FFT). A FFT é um algoritmo matemático que transforma um sinal de domínio do tempo em seu equivalente no domínio da frequência. Neste caso, vamos analisar os dados brutos da frequência cardíaca coletados pelo sensor MAX30102 e comparar com a frequência cardíaca medida manualmente no pulso.

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito do bloco anterior montado e conectado ao Arduino.

#### Passo 2: Programação

1. Abra o exemplo "Example6_SpO2" em ```File > Examples > SparkFun MAX3010x Pulse and Proximity Sensor Library > Example4_HeartBeat_Plotter```

2. O exemplo original imprime os dados brutos da frequência cardíaca no monitor serial, 1 em cada linha. Edite o código para que ele imprima todos os dados numa mesma linha, separados por ponto e vírgula (*;*). Para isso, substitua o ```void loop()``` pelo bloco abaixo:

```cpp
void loop() {
  if (Serial.available() > 0) { // Verifica se há dados disponíveis para leitura
    char receivedChar = Serial.read(); // Lê o caractere enviado pelo monitor serial
    Serial.println(); // Imprime uma nova linha
  }

  Serial.print(particleSensor.getIR()); // Envia os dados brutos para o plotter
  Serial.print(";");
}
```

3. Selecione a placa e a porta de conexão onde o Arduino está conectado.

4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Posicione o dedo sobre o sensor, cobrindo completamente a unidade central.

2. Abra o Serial Monitor na Arduino IDE. Repare que, após a inicialização, os dados serão impressos todos numa mesma linha, exceto se o usuário enviar um caractere pelo monitor serial. Experimente clicar na caixa de inserção de texto e apertar ```Enter```.

3. Para observar os dados no Serial Plotter, mantenha a tecla ```Enter``` pressionada. Isso fara com que os dados sejam impressos 1 por linha, num formato que o Serial Plotter é capaz de interpretar.

#### Passo 4: Coleta de Dados

1. Abra o Serial Monitor, pois ele que exibirá os dados que iremos coletar. Certifique-se de que a função "Show Timestamp/Toggle Timestamp" esteja Ativada, para que possamos identificar o momento em que os dados foram coletados.

2. Abra o Serial Plotter e, mantendo pressionada a tecla ```Enter``` no Serial Monitor, observe os dados brutos da frequência cardíaca coletados pelo sensor MAX30102. Garanta que o dedo esteja bem posicionado e estável sobre o sensor para uma leitura precisa, onde curvas definem visualmente os batimentos cardíacos do seu corpo.

3. Quando observar uma curva com picos e vales bem delineados, solte a tecla ```Enter``` para que os próximos dados coletados sejam impressos empilhados numa mesma linha. Colete dados por aproximadamente 10 segundos. Simultaneamente, caso possível, peça para um colega avaliar sua frequência cardíaca manualmente no pulso, contando o número de batimentos em 10 segundos, anotando esse número sem que você o veja.

4. Após a coleta de dados, aperte a tecla ```Enter``` novamente para que a linha de dados coletados seja concluída. Selecione a linha clicando sobre ela 3 vezes, e copie os dados que coletou, pois ela será a nossa base de dados para análise.

5. Além disso, calcule e anote a duração da coleta de dados em segundos, subtraindo o tempo final (timestamp da primeira linha após a coleta) do tempo inicial (timestamp da linha da coleta).

#### Passo 5: Análise de Dados

1. Baixe o script Python ```heart_beat_analyzer.py``` num editor de texto ou IDE Python

2. No topo do arquivo, cole os dados copiados do Serial Monitor, substituindo o valor da variável ```DATA_STRING``` pela sua base de dados. Certifique-se de remover o marcador de timestamp que o Serial Monitor adiciona automaticamente.

3. Cole a duração da coleta de dados na variável ```DURATION_IN_SECONDS```. Ela será nossa base para converter os picos para uma frequência cardíaca em BPM.

4. Execute o script Python e observe a análise dos dados brutos da frequência cardíaca. O script irá calcular a frequência cardíaca em BPM e exibir o gráfico dos picos e vales dos batimentos cardíacos.

> Caso não tenha as bibliotecas necessárias, instale-as executando o comando ```pip install matplotlib numpy scipy``` no terminal.

#### Passo 6: Exploração

1. Os dados brutos da frequência cardíaca coletados pelo sensor MAX30102 são precisos e estáveis? Existem flutuações nos valores de leitura? Porque isso ocorre?

2. Como a frequência cardíaca medida manualmente no pulso se compara com a frequência cardíaca medida pelo sensor MAX30102? A análise dos dados brutos com FFT (Fast Fourrier Transform) é capaz de identificar os picos e vales dos batimentos cardíacos? Como isso pode ser útil para monitorar a saúde?

3. Esse equipamento pode ser utilizado para automatizar a medição da frequência cardíaca em situações de emergência? Quais são as vantagens e desvantagens em construir artesanalmente um monitor de saúde com Arduino e sensores de frequência cardíaca?

---

### Conclusão

Neste roteiro, exploramos o sensor MAX30102 e como ele pode ser utilizado para medir a frequência cardíaca e a saturação de oxigênio no sangue (SpO2). Construímos um monitor de saúde com Arduino e exibimos os dados da frequência cardíaca e SpO2 em tempo real no display LCD. Além disso, analisamos os dados brutos da frequência cardíaca com FFT no Python, comparando com a frequência cardíaca medida manualmente no pulso. Essa análise nos permitiu identificar os picos e vales dos batimentos cardíacos e calcular a frequência cardíaca em BPM. O monitor de saúde pode ser utilizado para monitorar a saúde em tempo real e identificar situações críticas, como a falta de oxigenação do sangue ou frequências cardíacas longe do normal.

### Referências para Consulta

- [MAX30102 Datasheet](https://www.analog.com/media/en/technical-documentation/data-sheets/max30102.pdf)

- [Fotopletismografia](https://pt.wikipedia.org/wiki/Fotopletismografia)

- [Arduino Official Documentation](https://www.arduino.cc/en/Guide/HomePage)

- [Arduino Reference](https://www.arduino.cc/reference/en/)

- [Getting Started with Arduino IDE 2](https://docs.arduino.cc/software/ide-v2/tutorials/getting-started-ide-v2/)

- [Pulse Width Modulation - SparkFun Learn](https://learn.sparkfun.com/tutorials/pulse-width-modulation/all)

### Sugestões de Leitura
- [Arduino Cookbook: Recipes to Begin, Expand, and Enhance Your Projects](https://www.amazon.com/Arduino-Cookbook-Michael-Margolis/dp/1449313876)

- [Programming Arduino: Getting Started with Sketches](https://www.amazon.com/Programming-Arduino-Getting-Started-Sketches/dp/0071784225)

- [How to Read a Datasheet (Phil's Lab)](https://youtu.be/1EXXqWweTkI?si=hngcrZDaMttrbT5z)

- [How to Read a Datasheet (SparkFun Electronics)](https://www.sparkfun.com/tutorials/223)

- [Encyclopedia of Electronic Components Volume 1: Resistors, Capacitors, Inductors, Switches, Encoders, Relays, Transistors](https://www.amazon.com/Encyclopedia-Electronic-Components-Resistors-Transistors/dp/1449333893)

- [Encyclopedia of Electronic Components Volume 2: LEDs, LCDs, Audio, Thyristors, Digital Logic, and Amplification](https://www.amazon.com/Encyclopedia-Electronic-Components-Thyristors-Amplification/dp/1449334180)

- [Encyclopedia of Electronic Components Volume 3: Sensors, LEDs, Audio, Thyristors, Digital Logic, and Amplification](https://www.amazon.com/Encyclopedia-Electronic-Components-Sensors-Amplification/dp/1449334318)

---
