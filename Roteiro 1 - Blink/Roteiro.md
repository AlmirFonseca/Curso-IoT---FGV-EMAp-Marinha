# Introdução à Eletrônica com Arduino

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

Assim como outras linguagens, existe um "ritual de iniciação" para quem está começando a programar com Arduino: o "Blink". Neste experimento, o objetivo é acender e apagar um LED a cada segundo, utilizando o LED embutido na placa Arduino Uno.

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

<p align="center">
  <img src="..\src\images\SelectBoardAndPort.png" height="300px" />
</p>

3. Faça o upload do código para a placa Arduino.

<p align="center">
  <img src="..\src\images\UploadCode.png" height="50px" />
</p>

#### Passo 3: Observação

1. Observe o LED embutido na placa acendendo e apagando a cada segundo.

#### Passo 4: Exploração

1. O que acontece se alterarmos o tempo de espera de cada comando ```delay()```? Altere seus valores, faça o upload do código novamente e observe o comportamento do LED.

> ⚠: Após ser carregado para a placa, o código (chamado de *"sketch"*) é executado indefinidamente. Caso a placa seja desligada, o código não é perdido, bastando religá-la para que todo o código seja executado novamente a partir do início. Caso deseje atualizar o código, é necessário fazer o upload de um novo código para a placa.


### Bloco 2: Controle de LED com digitalWrite

Agora que já passaram pelo "ritual de iniciação", é hora de controlar LEDs externos. Neste bloco, os alunos aprenderão a montar o primeiro circuito com um LED externo e controlá-lo através de sinais digitais. Além disso, começaremos a imprimir mensagens de texto na porta serial para visualizar o estado do LED.

<p align="center">
  <img src="https://cdn.shopify.com/s/files/1/0695/1347/8453/files/LED_symbol_480x480.png?v=1676322752" height="200px" />
</p>

#### Passo 1: Introdução ao Circuito

1. Conecte o pino positivo LED verde ao pino 8 do Arduino através de um resistor de 300 ohms. O pino negativo do LED deve ser conectado ao GND do Arduino.

> ⚠: Preste atenção à polaridade do LED. Ela pode ser observada segundo o comprimento das "pernas" do LED.

<p align="center">
  <img src="https://ledlightinginfo.com/wp-content/uploads/2020/11/led-polarity.jpg" height="200px" />
</p>

<p align="center">
  <img src="..\src\images\Roteiro 1\blink_circuit_green.png" height="300px" />
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

1. O que acontece se o LED for conectado em outro pino? Qualquer pino pode ser utilizado para controlar o LED com ```digitalWrite()```? Experimente conectar o LED em outros pinos e alterar o código para refletir essa mudança.

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

<p align="center">
  <img src="https://www.circuitgeeks.com/wp-content/uploads/2021/03/Arduino-PWM.jpg" height="400px" />
</p>

#### Passo 1: Introdução ao Circuito
1. Monte o circuito similar ao anterior, mas conectando o LED vermelho ao pino 9.

<p align="center">
  <img src="..\src\images\Roteiro 1\blink_circuit_red.png" height="300px" />
</p>

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

> ⚠: O Serial Plotter é uma ferramenta eficiente para visualizar dados de sensores e variáveis que mudam com o tempo. Para utilizá-lo, basta imprimir mensagens simples como números separados por vírgula. Para acessá-lo, basta clicar em ```Ferramentas -> Serial Plotter``` na Arduino IDE.

### Passo 4: Exploração

1. O que acontece se o LED for conectado em outro pino? Qualquer pino pode ser utilizado para controlar o LED com ```analogWrite()```?

2. O que acontece se tentarmos controlar a intensidade dessa forma com ```digitalWrite()```? Experimente substituir o comando ```analogWrite()``` por ```digitalWrite()``` e observe o comportamento do LED.

3. Como podemos controlar a intensidade do LED de forma mais suave? Experimente alterar o tempo de espera entre as mudanças de brilho, criar mais níveis de intensidade ou utilizar loops para controlar a intensidade do LED. (Dica: utilize a função ```for``` para criar loops, como mostrado abaixo)

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

<p align="center">
  <img src="..\src\images\Roteiro 1\traffic_light.png" height="300px" />
</p>

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

1. Monte o circuito com o LED RGB, conectando cada pino a um pino digital do Arduino (9, 10 e 11). Utilize 1 resistor de 300 ohms para cada pino de controle de cor, e o seu pino comum ("GROUND") ao GND do Arduino.

<p align="center">
  <img src="..\src\images\Roteiro 1\traffic_light_rgb.png" height="300px" />
</p>

#### Passo 2: Programação

Esse bloco é similar ao anterior, sendo a única diferença a troca dos LEDs individuais por um LED RGB que contém as 3 cores (vermelho, verde e azul) em um único componente. Contudo, como o amarelo não está entre as cores do LED RGB, será necessário combinar as cores vermelho e verde para obter o amarelo. Para isso, utilize a função ```analogWrite()``` para controlar a intensidade de cada cor e controlar a mistura que resultará na cor desejada.

1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    int redPin = 11;
    int greenPin = 10;
    int bluePin = 9;

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
      analogWrite(redPin, 255);
      analogWrite(greenPin, 255);
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

1. Como funciona a composição de cores que compõem o amarelo? Experimente colocar a mão ou outro objeto na frente do LED RGB para observar a mistura de cores.

2. O que acontece se alterarmos a composição de vermelho e verde para gerar um amarelo "mais realista"? Experimente compor outros tons de amarelo a partir de diferentes combinacões de intensidade de vermelho e verde. Busque por um amarelo mais parecido com o semáforo tradicional.

> Você sabia? Existem alguns motivos que dificultam o uso de LEDs RGB em semáforos ao redor do mundo como, por exemplo, o fato de que pessoas com daltonismo podem ter dificuldades para distinguir as cores, o que não acontece com os semáforos tradicionais que utilizam luzes individuais. Além disso, estudos mostram que a alteração da posição da fonte de luz quando o semáfoto muda de estado chama a atenção dos motoristas. Por fim, o alto custo de manutenção também impacta na escolha pelos semáforos tradicionais.


---

### Bloco 6: Sensor de Luminsidade (LDR)

<p align="center">
  <img src="https://techzeero.com/wp-content/uploads/2023/09/ldr-sensor.webp" height="200px" />
</p>

Neste bloco, os alunos aprenderão a utilizar um sensor de luminosidade (LDR) para coletar dados de luminosidade. O LDR é um resistor cuja resistência varia de acordo com a intensidade da luz que incide sobre ele. Quanto mais luz, menor a resistência.

#### Passo 1: Introdução ao Circuito

1. Conecte o LDR (*Light Dependent Resistor*) entre o pino A0 e o terminal GND.

2. Conecte um resistor de 10k ohms entre o pino A0 e o terminal VCC (5V). 

<p align="center">
  <img src="..\src\images\Roteiro 1\ldr_circuit.png" height="300px" />
</p>

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
      delay(500);
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.

2. Observe os valores de luminosidade capturados pelo LDR. Experimente abrir o Serial Plotter para visualizar os dados de forma gráfica.

### Passo 4: Exploração

1. O que acontece se apontar o LDR para as lâmpadas no teto ou para a lanterna do celular? E se tampar ele com a mão?

2. Como funciona o LDR? Qual o valor mínimo e máximo que é possível obter? O que esses valores representam?

3. Como podemos utilizar esses valores para controlar a intensidade de um LED? Experimente substituir o ```analogWrite()``` do LED RGB por um valor lido do LDR. Assim, o LED mudará de intensidade de acordo com a luminosidade capturada pelo sensor. Para isso, você deve mapear o valor lido do LDR (0 a 1023) para o intervalo de intensidade do LED (0 a 255) usando a função ```map()```.

```cpp
...
int ldrValue = analogRead(ldrPin); // Lê o valor do LDR

// Mapeia o valor do LDR para o intervalo de 0 a 255
ldrValue = map(ldrValue, 0, 1023, 0, 255); 

// Controla a intensidade do LED vermelho de acordo com o valor do LDR
analogWrite(redPin, ldrValue); 
...
```

---

### Bloco 7: Coleta de Dados de Luminosidade

Neste bloco, os alunos aprenderão a coletar dados de luminosidade com o LDR e a comparar a sensibilidade do sensor às diferentes cores de LEDs.

#### Passo 1: Introdução ao Circuito

O LDR é um resistor cuja resistência varia de acordo com a intensidade da luz que incide sobre ele. Quanto mais luz, menor a resistência.

Mantenha o circuito do bloco anterior. Usaremos o LED RGB como fonte de luz para o LDR. Portanto, basta seguir os passos dos blocos 5 e 6 para montar o circuito. 

<p align="center">
  <img src="..\src\images\Roteiro 1\ldr_with_rgb_led_circuit.png" height="300px" />
</p>

Depois disso:

1. Garanta que o LDR esteja exposto à luz emitida pelo LED RGB. Entorte o LDR para que ele aponte para o LED RGB.

2. Cubra o conjunto LDR e LED RGB com um copo plástico ou similar para bloquear a luz do ambiente. Isso reduzirá a interferência dela no experimento, permitindo uma coleta de dados mais precisa.

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código:
    ```cpp
    int ldrPin = A0;

    int ledRedPin = 11;
    int ledGreenPin = 10;
    int ledBluePin = 9;

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
      for (int i = 0; i <= 255; i = i+10) {
        analogWrite(ledRedPin, i);
        delay(500);

        int ldrValue = analogRead(ldrPin);

        Serial.print(i);
        Serial.print(",");
        Serial.println(ldrValue);
      }
      // Apaga o LED vermelho
      digitalWrite(ledRedPin, LOW);

      // Acende e controla a intensidade do LED verde
      Serial.println("Green LED");
      for (int i = 0; i <= 255; i = i+10) {
        analogWrite(ledGreenPin, i);
        delay(500);

        int ldrValue = analogRead(ldrPin);
        
        Serial.print(i);
        Serial.print(",");
        Serial.println(ldrValue);
      }
      // Apaga o LED verde
      digitalWrite(ledGreenPin, LOW);

      // Acende e controla a intensidade do LED azul
      Serial.println("Blue LED");
      for (int i = 0; i <= 255; i = i+10) {
        analogWrite(ledBluePin, i);
        delay(500);

        int ldrValue = analogRead(ldrPin);
        
        Serial.print(i);
        Serial.print(",");
        Serial.println(ldrValue);
      }
      // Apaga o LED azul
      digitalWrite(ledBluePin, LOW);
    }

    void loop() {
      // Nada a ser feito no loop
    }
    ```

> ⚠: É necessário manter ambos os blocos ```void setup()``` e ```void loop()``` separados, mesmo que um deles fique vazio. Nesse exemplo, como queremos que o Arduino execute a rotina de coleta de dados apenas uma vez após a inicialização, optamos por manter a coleta no ```void setup()```. Assim, ele não será executado no ```void loop()```, onde o código é repetido indefinidamente.

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.

2. Observe os valores de luminosidade capturados pelo LDR.

3. Copie os valores impressos para uma planilha do Excel e anote a cor do LED que gerou esses valores. No final, é desejado que seja construída uma tabela nesse formato:

| Intensidade do LED | LED Vermelho | LED Verde | LED Azul |
|---------------------|--------------|-----------|----------|
| 0                   | 298            | 1023         | 512        |
| 10                   | 250            | 976         | 508        |
| 20                  | 231            | 347         | 407        |
| ...                 | ...          | ...       | ...      |
| 250                 | 0         | 1      | 0      |

4. Construa gráficos de linhas para cada cor de LED, exibindo a curva de sensibilidade do LDR para cada cor.

### Passo 4: Exploração

1. O que as curvas representam?

2. As curvas são lineares? 

3. As curvas são similares? 

4. Existe alguma cor que o LDR é mais sensível? Busque um embasamento teórico pra sua resposta na [datasheet do sensor LDR](https://www.robocore.net/upload/attachments/sensor_ldr_gl5528_145.pdf). Considere que estamos utilizando um LDR de Sulfero de Cádmio (CdS).

---

### Conclusão
Este experimento introduziu conceitos básicos de controle de LEDs já embutidos na placa Arduino, externos e até mesmo RGB, além de coleta de dados com Arduino, proporcionando uma base sólida para futuros projetos em eletrônica e IoT. A comparação das respostas do LDR às diferentes cores de LEDs permite uma compreensão mais profunda da sensibilidade do sensor à luz e como essa informação pode ser utilizada em projetos futuros.

> ⚠: Lembre-se sempre de, quando possível, consultar a ficha técnica (datasheet) dos componentes utilizados para entender melhor o seu funcionamento e características. Essas informações são essenciais para a solução de problemas que possam surgir durante o desenvolvimento de projetos mais complexos.

---

### Referências para Consulta

- [Arduino Official Documentation](https://www.arduino.cc/en/Guide/HomePage)

- [Arduino Reference](https://www.arduino.cc/reference/en/)

- [Getting Started with Arduino IDE 2](https://docs.arduino.cc/software/ide-v2/tutorials/getting-started-ide-v2/)

- [Blink | Arduino Documentation](https://docs.arduino.cc/built-in-examples/basics/Blink/)

- [Introduction | Breadboards for Beginners](https://learn.adafruit.com/breadboards-for-beginners/introduction)

- [Pulse Width Modulation - SparkFun Learn](https://learn.sparkfun.com/tutorials/pulse-width-modulation/all)

- [LDR – Wikipédia](https://pt.wikipedia.org/wiki/LDR)

### Sugestões de Leitura
- [Arduino Cookbook: Recipes to Begin, Expand, and Enhance Your Projects](https://www.amazon.com/Arduino-Cookbook-Michael-Margolis/dp/1449313876)

- [Programming Arduino: Getting Started with Sketches](https://www.amazon.com/Programming-Arduino-Getting-Started-Sketches/dp/0071784225)

- [How to Read a Datasheet (Phil's Lab)](https://youtu.be/1EXXqWweTkI?si=hngcrZDaMttrbT5z)

- [How to Read a Datasheet (SparkFun Electronics)](https://www.sparkfun.com/tutorials/223)

- [Encyclopedia of Electronic Components Volume 1: Resistors, Capacitors, Inductors, Switches, Encoders, Relays, Transistors](https://www.amazon.com/Encyclopedia-Electronic-Components-Resistors-Transistors/dp/1449333893)

- [Encyclopedia of Electronic Components Volume 2: LEDs, LCDs, Audio, Thyristors, Digital Logic, and Amplification](https://www.amazon.com/Encyclopedia-Electronic-Components-Thyristors-Amplification/dp/1449334180)

- [Encyclopedia of Electronic Components Volume 3: Sensors, LEDs, Audio, Thyristors, Digital Logic, and Amplification](https://www.amazon.com/Encyclopedia-Electronic-Components-Sensors-Amplification/dp/1449334318)

---

