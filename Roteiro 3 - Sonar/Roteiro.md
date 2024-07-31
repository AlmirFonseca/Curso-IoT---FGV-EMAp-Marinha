# Introdução à Eletrônica com Arduino

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

<p align="center">
  <img src="..\src\images\Roteiro 3\sonar_circuit.png" alt="Circuito do Potenciômetro" height="300">
</p>

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

<p align="center">
  <img src="..\src\images\Roteiro 3\stepper_motor_circuit.png" alt="Circuito do Potenciômetro" height="300">
</p>

2. Conecte o motor de passo ao driver usando o conector de 5 pinos.

#### Passo 2: Programação

1. Instale a biblioteca ```Bonezegei_ULN2003_Stepper``` na Arduino IDE. Para isso, abra o Library Manager e busque por ```ULN2003```.

2. Abra o Arduino IDE e escreva o seguinte código para exibir os valores de distância no Serial Monitor:

```cpp
#include "Bonezegei_ULN2003_Stepper.h"

Bonezegei_ULN2003_Stepper Stepper(8, 9, 10, 11);

#define STEPS_PER_REVOLUTION 2038

// Set This According to your Preference
#define FORWARD 1
#define REVERSE 0

void setup() {
  //Inititalize Pins
  Stepper.begin();

  Stepper.setSpeed(5); // Set 
}

void loop() {

  Stepper.step(FORWARD, STEPS_PER_REVOLUTION);
  delay(2000);

  Stepper.step(REVERSE, STEPS_PER_REVOLUTION);
  delay(2000);
}
```

3. Selecione a placa e a porta de conexão onde o Arduino está conectado.

4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o movimento do motor de passo conforme o código é executado. O motor deve girar lentamente, 1 volta para cada lado, a cada iteração do ```void loop()```.

2. Se necessário, cole uma fita adesiva ao eixo do motor para facilitar a visualização do movimento.

#### Passo 4: Exploração

1. O motor de passo gira de forma precisa? Ele consegue girar de forma precisa mesmo depois de múltiplas iterações do loop?

2. O que acontece se alterar o valor de ```STEPS_PER_REVOLUTION``` no código? Experimente aumentar ou diminuir esse valor e observe o comportamento do motor.

3. Como podemos controlar a velocidade dessa rotação? E a direção? Podemos pedir para ele girar mais voltas numa iteração?

4. O que esse motor difere do servo motor utilizado anteriormente? Em que cenários cada um é mais adequado?

5. O que acontece se você mover o eixo durante a rotação? O motor consegue compensar esse movimento? Ele continua preciso mesmo com interferências externas?

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
#include "Bonezegei_ULN2003_Stepper.h"
#include <HCSR04.h>

// Stepper motor initialization
Bonezegei_ULN2003_Stepper Stepper(8, 9, 10, 11);
#define STEPS_PER_REVOLUTION 2038

// Set direction constants according to your preference
#define FORWARD 1
#define REVERSE 0

// Ultrasonic sensor initialization
HCSR04 hc(2, 3); // Initialisation class HCSR04 (trig pin, echo pin)

void setup() {
  // Initialize stepper motor
  Stepper.begin();
  Stepper.setSpeed(5); // Set speed

  // Initialize serial communication for ultrasonic sensor
  Serial.begin(9600);
}

void loop() {
  // Stepper motor operations
  Stepper.step(FORWARD, STEPS_PER_REVOLUTION);
  delay(2000);
  Stepper.step(REVERSE, STEPS_PER_REVOLUTION);
  delay(2000);

  // Ultrasonic sensor distance measurement
  Serial.println(hc.dist()); // Return current distance in serial
  delay(60);                 // We suggest to use over 60ms measurement cycle, to prevent trigger signal to the echo signal.
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o movimento do motor de passo e a medição da distância pelo sensor HC-SR04.

2. Os valores de distância são exibidos no monitor serial. Observe como a distância varia conforme o sensor se move.

#### Passo 4: Exploração

1. O que acontece se alterar a velocidade do motor de passo? Experimente aumentar ou diminuir a velocidade e observe o comportamento.

2. Como podemos controlar o ângulo mínimo e máximo dos movimentos do motor? 

3. O que você pode concluir sobre a visualização dos dados de distância no monitor serial? É uma forma eficaz de analisar esses dados espaciais? O que poderia ser feito para melhorar essa visualização?

4. Experimente visualizar os dados através do Serial Plotter. Como essa visualização se compara à exibição no monitor serial? É melhor? É pior? É suficiente para analisar esses dados espaciais?

---

<!-- ### Bloco 5: Dashboard de Sonar com Processing

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

--- -->

### Conclusão

Este roteiro apresentou o uso de sensores de distância ultrassônicos, como o HC-SR04, para medir a distância entre o sensor e um objeto. A construção de um "sonar" com Arduino permitiu explorar o funcionamento do sensor e a visualização dos dados de distância em diferentes formatos, como monitor serial, plotter serial e dashboard gráfico. A utilização de ferramentas de visualização adequadas é essencial para analisar dados espaciais de forma eficaz e tomar decisões informadas em projetos de eletrônica e automação.

### Referências para Consulta

- [Documentação Oficial do Arduino](https://www.arduino.cc/en/Guide/HomePage)
- [Biblioteca HCSR04 Ultrasonic Sensor](https://www.arduino.cc/reference/en/libraries/hcsr04-ultrasonic-sensor/)
<!-- - [Biblioteca Stepper](https://www.arduino.cc/en/Reference/Stepper) -->
- [Processing](https://processing.org/)
- [Tutorial de Introdução ao Processing](https://processing.org/tutorials/gettingstarted/)
- [Processing Serial Library](https://processing.org/reference/libraries/serial/index.html)

### Sugestões de Leitura

- [Ultrasonic Sensor - Wikipedia](https://en.wikipedia.org/wiki/Ultrasonic_sensor)
- [Stepper Motor - Wikipedia](https://en.wikipedia.org/wiki/Stepper_motor)
- [Sonar - Wikipedia](https://en.wikipedia.org/wiki/Sonar)
- [Data Visualization - Wikipedia](https://en.wikipedia.org/wiki/Data_visualization)

---