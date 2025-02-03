# Introdução à Eletrônica com Arduino

## Sensor de Distância e Sonar

### Descrição

Esse roteiro apresenta o uso de sensores de distância ultrassônicos, como o HC-SR04, para medir a distância entre o sensor e um objeto. Sensores de distância são amplamente utilizados em projetos de robótica, automação e IoT para detectar a presença de objetos e medir distâncias. Na marinha, por exemplo, são utilizados sonares para medir a profundidade do oceano e detectar a presença de peixes e outras embarcações.

Existem diversos tipos de sensores de distância, como os sensores ultrassônicos, infravermelhos e a laser. Em projetos simples de eletrônica, os sensores ultrassônicos são uma opção acessível e eficaz para medir distâncias de alguns centímetros a vários metros, dependendo do modelo. Para projetos mais avançados, sensores a laser podem ser utilizados para medir distâncias com maior precisão e em maiores distâncias, podendo ser encontrados em sistemas de navegação de veículos autônomos e drones.

Neste roteiro, vamos explorar o funcionamento do sensor de distância e como ele pode ser utilizado para medir a distância entre o sensor e um objeto, construindo o nosso sonar com Arduino.

### Objetivos

- Apresentar o funcionamento do sensor de distância ultrassônico HC-SR04.
- Utilizar exemplos de bibliotecas para sensores na Arduino IDE.
- Realizar experimentos para medir a distância entre o sensor e um objeto.
- Construir um sonar com Arduino e exibir os dados em um dashboard gráfico.
- Discutir a importância de ferramentas de visualização adequadas para análise de dados.

### Materiais Necessários
| Componente                           | Imagem                                                                                                      |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------|
| 1x Placa Arduino (Uno, Mega, ou similar) | <img src="https://d229kd5ey79jzj.cloudfront.net/1338/images/1338_2_X.png?20241107090313" height="100"> |
| 1x Cabo USB para conexão com o computador | <img src="https://m.media-amazon.com/images/I/5181PDv7RbL._AC_UF894,1000_QL80_.jpg" height="100"> |
| 1x Sensor de distância ultrassônico HC-SR04 | <img src="https://images.tcdn.com.br/img/img_prod/650361/sensor_ultrassonico_hc_sr04_sensor_de_distancia_241_1_f8752df5ed253ef25ef00c3549a12768.png" height="100"> |
| 1x Motor de passo (28BYJ-48) e driver (ULN200x) | <img src="https://images.tcdn.com.br/img/img_prod/707426/arduino_motor_de_passo_drive_uln2003_16548_1_20190911151942.jpg" height="100"> |
| Peças impressas em 3D | <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEhinASCRRjS-NVLtaqJ_xFPIRriMdFFM_yg&s" height="100"> |
| Breadboard | <img src="https://cdn.awsli.com.br/600x700/1665/1665980/produto/11154566064a7523ad8.jpg" height="100"> |
| Jumpers | <img src="https://res.cloudinary.com/rsc/image/upload/b_rgb:FFFFFF,c_pad,dpr_1.0,f_auto,q_auto,w_700/c_pad,w_700/R2048241-01" height="100"> |

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
  <img src="..\..\src\images\Aula 3\sonar_circuit.png" alt="Circuito do Potenciômetro" height="300">
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
    - Pino IN1 do driver ao pino digital 9 do Arduino
    - Pino IN2 do driver ao pino digital 10 do Arduino
    - Pino IN3 do driver ao pino digital 11 do Arduino
    - Pino IN4 do driver ao pino digital 12 do Arduino
    - Pino GND do driver ao GND do Arduino
    - Pino VCC do driver ao 5V do Arduino

<p align="center">
  <img src="..\..\src\images\Aula 3\stepper_motor_circuit.png" alt="Circuito do Potenciômetro" height="300">
</p>

2. Conecte o motor de passo ao driver usando o conector de 5 pinos.

#### Passo 2: Programação

1. Instale a biblioteca ```Bonezegei_ULN2003_Stepper``` na Arduino IDE. Para isso, abra o Library Manager e busque por ```ULN2003```.

2. Abra o Arduino IDE e escreva o seguinte código para exibir os valores de distância no Serial Monitor:

```cpp
// Inclui a biblioteca do motor de passo Bonezegei ULN2003.
#include "Bonezegei_ULN2003_Stepper.h"

// Cria um objeto Stepper para controlar o motor de passo nos pinos 9, 10, 11, 12.
Bonezegei_ULN2003_Stepper Stepper(9, 10, 11, 12);

// Define o número de passos por revolução do motor.
#define STEPS_PER_REVOLUTION 2038

// Define a direção do motor como constante: 1 para frente e 0 para reverso.
#define FORWARD 1
#define REVERSE 0

void setup() {
  // Inicializa os pinos conectados ao motor.
  Stepper.begin();

  // Define a velocidade do motor para 3 RPM.
  Stepper.setSpeed(3);
}

void loop() {
  // Move o motor para a frente por uma revolução.
  Stepper.step(FORWARD, STEPS_PER_REVOLUTION);
  // Aguarda 2 segundos antes de mudar de direção.
  delay(2000);

  // Move o motor para trás por uma revolução.
  Stepper.step(REVERSE, STEPS_PER_REVOLUTION);
  // Aguarda 2 segundos antes de repetir o ciclo.
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

<p align="center">
  <img src="..\..\src\images\Aula 3\sonar_dashboard.png" alt="Dashboard de Sonar" height="300">
</p>

#### Passo 1: Introdução ao Circuito

1. Monte as peças impressas em 3D para construir o suporte do sensor HC-SR04.

2. Conecte o sensor HC-SR04 ao Arduino conforme o esquemático do bloco 1.

3. Posicione o sensor no suporte e aponte-o para a área que deseja medir a distância.

#### Passo 2: Programação

1. Abra o Arduino IDE e escreva o seguinte código:

```cpp
// Inclui a biblioteca para o motor de passo ULN2003 e a biblioteca do sensor ultrassônico HCSR04.
#include "Bonezegei_ULN2003_Stepper.h"
#include <HCSR04.h>

// Inicializa o motor de passo nos pinos 9, 10, 11, 12.
Bonezegei_ULN2003_Stepper Stepper(9, 10, 11, 12);
#define STEPS_PER_REVOLUTION 2038  // Define o número de passos necessários para uma revolução completa do motor.

// Define constantes de direção: 1 para frente e 0 para trás.
#define FORWARD 1
#define REVERSE 0

// Inicializa o sensor ultrassônico nos pinos 2 (trig) e 3 (echo).
HCSR04 hc(2, 3);

void setup() {
  // Inicializa o motor de passo.
  Stepper.begin();
  Stepper.setSpeed(5); // Define a velocidade do motor para 5 RPM.

  // Inicializa a comunicação serial a 9600 bauds para o sensor ultrassônico.
  Serial.begin(9600);
}

void loop() {
  int angleStep = 5; // Define o incremento de ângulo para cada movimento.

  // Loop para mover o motor de 0 a 180° em incrementos de 5°.
  for (int angle = 0; angle <= 180; angle += angleStep) {
    // Move o motor de passo para o ângulo atual.
    Stepper.step(FORWARD, STEPS_PER_REVOLUTION / 360 * angleStep); // Move o motor 5° para frente.
    delay(500); // Aguarda 500ms para o motor se posicionar.

    // Medição de distância pelo sensor ultrassônico.
    Serial.print(angle); // Envia o ângulo atual para o monitor serial.
    Serial.print(","); // Envia uma vírgula para separar os valores.
    int dist = hc.dist(); // Mede a distância com o sensor ultrassônico.  
    Serial.print(dist); // Envia a distância medida para o monitor serial.
    Serial.println("."); // Envia um ponto e pula para a próxima linha.
  }

  // Loop para mover o motor de 180 a 0° em decrementos de 5°.
  for (int angle = 180; angle >= 0; angle -= angleStep) {
    // Move o motor de passo para o ângulo atual.
    Stepper.step(REVERSE, STEPS_PER_REVOLUTION / 360 * angleStep); // Move o motor 5° para trás.
    delay(500); // Aguarda 500ms para o motor se posicionar.

    // Medição de distância pelo sensor ultrassônico.
    Serial.print(angle); // Envia o ângulo atual para o monitor serial.
    Serial.print(","); // Envia uma vírgula para separar os valores.
    int dist = hc.dist(); // Mede a distância com o sensor ultrassônico.  
    Serial.print(dist); // Envia a distância medida para o monitor serial.
    Serial.println("."); // Envia um ponto e pula para a próxima linha.
  }

  delay(2000); // Aguarda 2 segundos antes de iniciar o próximo ciclo de medição.
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o movimento do motor de passo e a medição da distância pelo sensor HC-SR04.

2. Os valores de distância são exibidos no monitor serial. Observe como a distância varia conforme o sensor se move.

#### Passo 4: Exploração

1. O que acontece se alterar a velocidade do motor de passo? Experimente aumentar ou diminuir a velocidade e observe o comportamento.

2. Como podemos controlar o ângulo mínimo e máximo dos movimentos do motor? E o tamanho do seu movimento a cada iteração? E a velocidade em que ele repete seus movimentos? 

3. O que você pode concluir sobre a visualização dos dados de distância no monitor serial? É uma forma eficaz de analisar esses dados espaciais? O que poderia ser feito para melhorar essa visualização?

4. Experimente visualizar os dados através do Serial Plotter. Como essa visualização se compara à exibição no monitor serial? É melhor? É pior? É suficiente para analisar esses dados espaciais?

---

### Bloco 5: Dashboard de Sonar com Processing

Neste bloco, vamos utilizar o Processing para criar um dashboard gráfico para exibir os dados do "sonar" de forma mais visual e interativa. O Processing é uma linguagem de programação e ambiente de desenvolvimento integrado (IDE) de código aberto baseado em Java, amplamente utilizado para criar visualizações interativas, arte generativa e aplicações multimídia.

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito do bloco anterior montado e conectado ao Arduino.

2. Mantenha o Arduino conectado ao computador via cabo USB.

#### Passo 2: Programação

1. Instale o Processing, de acordo com as instruções disponíveis no site oficial: [Processing](https://processing.org/download/).

2. Abra o Processing e crie um novo sketch.

3. Escreva o seguinte código no sketch do Processing:

```java
/**
 * #######################################################################
 * Software Arduino Sonar Monitor
 *
 * alterado por Rodrigues <https://rodriguesfas.github.io>
 * by Dejan Nedelkovski <www.HowToMechatronics.com>  
 *########################################################################
 */

import processing.serial.*; /* biblioteca para comunicação serial */
import java.awt.event.KeyEvent; /*biblioteca para leitura de dados na porta serial. */
import java.io.IOException;

Serial myPort; /* Define objeto serial */

/* define algumas variaveis.. */
String angle="";
String distance="";
String data="";
String noObject;
float pixsDistance;
int iAngle, iDistance;
int index1=0;
int index2=0;
//PFont orcFont;
PFont myFont;

/**
 * setup - 
 */
void setup() {

  size (800, 600); /* ***Alterar para resolução que desejar*** */
  smooth();
  myPort = new Serial(this, "COM5", 9600); /* inicia comunicação serial. */
  myPort.bufferUntil('.'); /* Lê oas dados atravéz da porta serial (angulo e distância) */

  //orcFont = loadFont("OCRAExtended-30.vlw");
  myFont = createFont("verdana", 10); /* define tipo de fonte e tamanho. */
}

/**
 * draw - 
 */
void draw() {
  fill(98, 245, 31);
  //textFont(orcFont);
  textFont(myFont); 

  /* simulando o borrão de movimento e lento desaparecer da linha móvel. */
  noStroke();
  fill(0, 4); 
  rect(0, 0, width, height-height*0.065); 

  fill(98, 245, 31); /* cor verde */

  /* chama as funções para desenhar o radar. */
  drawRadar(); 
  drawLine();
  drawObject();
  drawText();
}

/**
 * serialEvent --
 */
void serialEvent (Serial myPort) { /* começa a ler os dados aparti da porta serial. */
  /* lê os dados na porta serial (caractere) e armazena em uma string de dados. */
  data = myPort.readStringUntil('.');
  println("Dados recebidos" + data);
  data = data.substring(0, data.length()-1);

  index1 = data.indexOf(","); /* encontra o caractere e armazena na variavel "index1" */
  angle= data.substring(0, index1).trim(); /* ler os dados da posição "0" a posição do index1 váriavel ou isso é o valor do ânculo da placa Ardíno enviado */
  distance= data.substring(index1+1, data.length()).trim(); /* ler os dados de posição "index1" para o final do pr de dados que é o valor da distância. */

  // converte string para inteiro.
  iAngle = int(angle);
  iDistance = int(distance);
}

/**
 * drawRadar - 
 */
void drawRadar() {
  pushMatrix();
  translate(width/2, height-height*0.074); /* move as coordenadas para o novo local.  */
  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);

  // draws the arc lines
  arc(0, 0, (width-width*0.0625), (width-width*0.0625), PI, TWO_PI);
  arc(0, 0, (width-width*0.27), (width-width*0.27), PI, TWO_PI);
  arc(0, 0, (width-width*0.479), (width-width*0.479), PI, TWO_PI);
  arc(0, 0, (width-width*0.687), (width-width*0.687), PI, TWO_PI);

  // draws the angle lines
  line(-width/2, 0, width/2, 0);
  line(0, 0, (-width/2)*cos(radians(30)), (-width/2)*sin(radians(30)));
  line(0, 0, (-width/2)*cos(radians(60)), (-width/2)*sin(radians(60)));
  line(0, 0, (-width/2)*cos(radians(90)), (-width/2)*sin(radians(90)));
  line(0, 0, (-width/2)*cos(radians(120)), (-width/2)*sin(radians(120)));
  line(0, 0, (-width/2)*cos(radians(150)), (-width/2)*sin(radians(150)));
  line((-width/2)*cos(radians(30)), 0, width/2, 0);

  popMatrix();
}

/**
 * drawObject - 
 */
void drawObject() {
  pushMatrix();
  translate(width/2, height-height*0.074);  /* move as coordenadas para o novo local.  */
  strokeWeight(9);
  stroke(255, 10, 10); /* cor vermelho */

  pixsDistance = iDistance*((height-height*0.1666)*0.025); /* converte a distância entre o sensor de cm para px */

  /* limite de faixa de 40 cms */
  if (iDistance<40 & iDistance > 3) {
    /* desenha o objeto de acordo com o ângulo e a distância. */
    line(pixsDistance*cos(radians(iAngle)), -pixsDistance*sin(radians(iAngle)), (width-width*0.505)*cos(radians(iAngle)), -(width-width*0.505)*sin(radians(iAngle)));
  }
  popMatrix();
}

/**
 * drawLine - 
 */
void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(30, 250, 60);
  translate(width/2, height-height*0.074); /* move as coordenada iniciais para o novo local. */
  line(0, 0, (height-height*0.12)*cos(radians(iAngle)), -(height-height*0.12)*sin(radians(iAngle))); /* chama a linha de acordo com o angulo */
  popMatrix();
}

/**
 * drawText - 
 */
void drawText() { /* desenha os textos na tela. */

  pushMatrix();

  if (iDistance > 40) {
    noObject = "Fora de alcance!";
  } else {
    noObject = "Na faixa!";
  }

  fill(0, 0, 0);
  noStroke();
  rect(0, height-height*0.0648, width, height);
  fill(98, 245, 31);
  textSize(12);

  text("10cm", width-width*0.3854, height-height*0.0833);
  text("20cm", width-width*0.281, height-height*0.0833);
  text("30cm", width-width*0.177, height-height*0.0833);
  text("40cm", width-width*0.0729, height-height*0.0833);
  textSize(12);

  text("Objeto: " + noObject, width-width*0.875, height-height*0.0277);
  text("Ângulo: " + iAngle +" °", width-width*0.48, height-height*0.0277);
  text("Distância: ", width-width*0.26, height-height*0.0277);

  if (iDistance < 40) {
    text("        " + iDistance +" cm", width-width*0.225, height-height*0.0277);
  }

  /*plano cartesiano*/

  textSize(20);
  fill(98, 245, 60);
  translate((width-width*0.4994)+width/2*cos(radians(30)), (height-height*0.0907)-width/2*sin(radians(30)));
  rotate(-radians(-60));
  text("30°", 0, 0);
  resetMatrix();
  translate((width-width*0.503)+width/2*cos(radians(60)), (height-height*0.0888)-width/2*sin(radians(60)));
  rotate(-radians(-30));
  text("60°", 0, 0);
  resetMatrix();
  translate((width-width*0.507)+width/2*cos(radians(90)), (height-height*0.0833)-width/2*sin(radians(90)));
  rotate(radians(0));
  text("90°", 0, 0);
  resetMatrix();
  translate(width-width*0.513+width/2*cos(radians(120)), (height-height*0.07129)-width/2*sin(radians(120)));
  rotate(radians(-30));
  text("120°", 0, 0);
  resetMatrix();
  translate((width-width*0.5104)+width/2*cos(radians(150)), (height-height*0.0574)-width/2*sin(radians(150)));
  rotate(radians(-60));
  text("150°", 0, 0);
  popMatrix();
}

/**
 * stop - 
 */
void stop() {
  super.stop();
}
```

4. Substitua a porta ```COM5``` pela porta onde o Arduino está conectado.

5. Execute o código no Processing para abrir o dashboard gráfico. 

> **Atenção:** O código do Processing deve ser executado após o código do Arduino, para que a comunicação serial funcione corretamente. Além disso, apenas 1 programa do computador pode usar a porta de comunicação serial por vez. Portanto, certifique-se de que a Arduino IDE não possui o Serial Monitor ou o Serial Plotter abertos enquanto executa o código do Processing. De preferência, feche a janea da Arduino IDE.

#### Passo 3: Observação

1. Observe o dashboard gráfico gerado pelo Processing. Ele deve exibir uma visualização similar a um sonar, com pontos representando as distâncias medidas pelo sensor em diferentes ângulos.

#### Passo 4: Exploração

1. O que você pode concluir sobre a visualização dos dados de distância no dashboard gráfico? É uma forma mais eficaz de analisar esses dados espaciais em comparação com o monitor serial e o plotter serial?

2. Como essa visualização poderia ser útil em aplicações reais na marinha, como sistemas de navegação, mapeamento de ambientes ou detecção de obstáculos?

3. Para além da marinha, quais sistemas utilizam esse tipo de sistema de localização e mapeamento? Carros? Drones? Robôs? Aspiradores de pó automáticos?

---

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