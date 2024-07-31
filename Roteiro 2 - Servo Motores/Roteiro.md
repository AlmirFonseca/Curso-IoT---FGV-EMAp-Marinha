
# Introdução à Eletrônica com Arduino

## Potenciômetros e Servo Motores 

### Descrição

Esse roteiro de atividades tem como objetivo introduzir o uso de potenciômetros como controladores e o uso de servo motores como atuadores em sistemas eletrônicos. Além disso, serão utilizados diferentes tipos de potenciômetros e discutidas as diferenças entre eles, bem como a linearização do comportamento de um potenciômetro não linear.

### Objetivos

- Apresentar o funcionamento de um potenciômetro e observar seu output no Serial Plotter.
- Apresentar o controle de um servo motor com uma rotina de movimento pré-programada.
- Controlar o servo motor a partir de um potenciômetro, ajustando a amplitude dos valores usando a função map().
- Comparar o comportamento de um potenciômetro do tipo A com um do tipo B e discutir as diferenças na resposta do sistema.
- Coletar dados de um transferidor graduado fixo ao servo a fim de observar a linearidade do potenciômetro do tipo A.

### Materiais Necessários

- 1x Placa Arduino (Uno, Mega, ou similar)
- 1x Cabo USB para conexão com o computador
- 1x Servo motor
- 1x Potenciômetro tipo A (10k ohms)
- 1x Potenciômetro tipo B (10k ohms)
- Peças graduadas impressas em 3D
- Breadboard e jumpers

### Palavras-chave

Arduino, Arduino IDE, Servo, Potenciômetro, Potenciômetro Linear, Potenciômetro Logarítimico, Serial Plotter, Linearização, Transferidor, Função Inversa.

---

## Metodologia

### Bloco 1: Potenciômetros

Potenciômetros são componentes eletrônicos presentes em diversos dispositivos eletrônicos, como controles de volume, brilho, entre outros. Inventados por Thomas Edison em 1872 (há controvérsias), eles são utilizados para controlar a resistência elétrica de um circuito, variando a tensão ou corrente que passa por ele. Neste bloco, vamos explorar o funcionamento de um potenciômetro e observar como ele pode ser utilizado para controlar um sistema eletrônico.

<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Zu9CfHnIzPHmp8j7if3I4SO-HSclugEo2Q&s" alt="Potenciômetro" height="300">
</p>

#### Passo 1: Introdução ao Circuito

1. Conecte o pino central do potenciômetro ao pino analógico A0 do Arduino.

2. Conecte um dos outros pinos do potenciômetro ao terminal de 5V do Arduino.

3. Conecte o outro pino do potenciômetro ao terminal GND do Arduino.

<p align="center">
  <img src="..\src\images\Roteiro 2\pot_circuit.png" alt="Circuito do Potenciômetro" height="300">
</p>

4. Insira o tranferidor impresso em 3D no eixo do potenciômetro para facilitar a leitura da posição.

5. Rotacione o eixo do potenciômetro até o início da escala (0 graus) e insira o knob no eixo do potenciômetro.

#### Passo 2: Programação

1. Abra o Arduino IDE e escreva o seguinte código:

```cpp
void setup() {
  Serial.begin(9600); // Inicializa a comunicação serial a 9600 bps

  pinMode(A0, INPUT); // Define o pino A0 como entrada
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

1. Qual o valor mínimo lido pelo potenciômetro? E o máximo?

2. Qual a amplitude, em graus, do potenciômetro?

3. Qual a relação entre a posição do potenciômetro e o valor lido? parece ser linear? Experimente girar o potenciômetro lentamente e observe a saída na tela. Calcule a razão entre a variação do potenciômetro e a variação do valor lido para pelo menos 3 valores para verificar a linearidade.

4. O que acontece se inverter as conexões do potenciômetro? Inverta os fios de alimentação (5V) e terra (GND) e observe o comportamento. O que acontece ao girar o potenciômetro como antes?

---

### Bloco 2: Servo Motores

Servo motores são dispositivos capazes de girar em um ângulo específico, controlados por um sinal PWM (Pulse Width Modulation). Eles são amplamente utilizados em projetos de robótica, automação e modelismo. Neste bloco, vamos explorar o controle de um servo motor e observar seu movimento entre posições específicas, pré-definidas no código.

Seu funcionamento é baseado em um motor DC com uma caixa de redução e um potenciômetro acoplado ao eixo, formando um sistema de feedback que permite controlar a posição do eixo. O sinal PWM enviado ao servo motor determina a posição do eixo, variando o ângulo de rotação.

<p align="center">
  <img src="https://www.vidadesilicio.com.br/wp-content/uploads/2021/09/1848-jpg.webp" alt="Servo Motor" height="300">
</p>

#### Passo 1: Introdução ao Circuito

1. Conecte o fio de alimentação (vermelho) do servo ao terminal de 5V do Arduino.

2. Conecte o fio terra (marrom ou preto) do servo ao terminal GND do Arduino.

3. Conecte o fio de controle do servo ao pino digital 9 do Arduino.

<p align="center">
  <img src="..\src\images\Roteiro 2\servo_circuit.png" alt="Circuito do Potenciômetro" height="300">
</p>

4. Insira o transferidor impresso em 3D no eixo do servo motor para facilitar a leitura da posição

5. Insira o ponteiro no eixo do eixo do servo motor e aperte o parafuso usando a chave philips.

> ⚠: O servo motor pode consumir uma corrente maior que a fornecida pelo Arduino. Se o servo motor não estiver se movendo corretamente, considere alimentá-lo com uma fonte externa.

#### Passo 2: Programação

1. Instale a biblioteca "Servo" no Arduino IDE. Para isso, abra o Library Manager e busque por "servo".

<p align="center">
  <img src="..\src\images\Servo library.png" alt="Circuito do Potenciômetro" height="150">
</p>

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

1. Observe o movimento do servo motor entre as posições mínima (0°), média (90°) e máxima (180°).

2. O ponteiro aponta para a posição correta no transferidor? Se necessário, desligue o Arduino para que o servo motor não se mova e ajuste a posição do ponteiro para a posição correta.

#### Passo 4: Exploração

1. Ele é capaz de repetir os movimentos com precisão?

2. O que acontece se alterar os valores de 0, 90 e 180 graus no código? É possível inverter a direção do servo? Experimente alterar esses valores e observe o comportamento do servo.

3. Como você poderia controlar o servo motor de forma mais sauve, com ângulos intermediários? Experimente adicionar mais posições intermediárias no código.

5. O que acontece se inserir um valor maior que 180 ou menor que 0? Experimente e observe o comportamento.


---

### Bloco 3: Controle do Servo com Potenciômetro Linear

Agora que já exploramos o funcionamento do potenciômetro e do servo motor, vamos combinar os dois para controlar o servo motor a partir da posição do potenciômetro. 

Neste bloco, vamos utilizar um potenciômetro linear para controlar o ângulo do servo motor, ajustando a amplitude dos valores lidos pelo potenciômetro para o intervalo de 0 a 180 graus. Para isso, utilizaremos a função `map()` do Arduino, que mapeia um valor de um intervalo para outro.

#### Passo 1: Introdução ao Circuito

Nesse bloco, combinaremos os circuitos dos blocos 1 e 2, conectando o potenciômetro e o servo motor ao Arduino.

<p align="center">
  <img src="..\src\images\Roteiro 2\pot_and_servo_circuit.png" alt="Circuito do Potenciômetro" height="300">
</p>

#### Passo 2: Programação

1. Abra o Arduino IDE e escreva o seguinte código:

```cpp
#include <Servo.h>

Servo myServo;

void setup() {
  myServo.attach(9);
  Serial.begin(9600);

  pinMode(A0, INPUT);
}

void loop() {
  int potValue = analogRead(A0);

  int angle = map(potValue, 0, 1023, 0, 180); // Mapeia o valor do potenciômetro (0 a 1023) para a amplitude do servo (0 a 180 graus)

  myServo.write(180 - angle); // Define a posição do servo motor

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

3. O que acontece se alterar os valores de 0 e 180 graus no código? e ps valores de 0 a 1023? Experimente alterar esses valores e observe o comportamento do servo.

---

### Bloco 4: Potenciômetro "Diferente"

Neste bloco, vamos substituir o potenciômetro do tipo B pelo potenciômetro do tipo A e observar as diferenças no comportamento do servo motor.

#### Passo 1: Introdução ao Circuito

Substitua o potenciômetro B10K pelo potenciômetro A10K, mantendo as mesmas conexões do bloco anterior.

#### Passo 2: Programação

Nesse bloco, usaremos o mesmo código do bloco anterior, pois a mudança no potenciômetro não afeta a programação do Arduino, apenas os valores que serão lidos e mapeados para o servo motor. 

Antes de começar as análises, confira se o código referente ao bloco anterior está carregado na placa.

#### Passo 3: Observação

1. Gire o potenciômetro e observe a resposta do servo motor.

2. Observe os valores no Serial Monitor para entender as diferenças na leitura do potenciômetro do tipo A comparado ao do tipo B.

#### Passo 4: Exploração

1. A relação entre a posição do potenciômetro e o ângulo do servo é linear? Experimente girar o potenciômetro lentamente e observe a saída na tela e na escala do servo. Calcule a razão entre a variação do potenciômetro e a variação do ângulo do servo para pelo menos 3 valores para verificar a linearidade.

2. O que acontece se inverter as conexões do potenciômetro? Inverta os fios de alimentação (5V) e terra (GND) e observe o comportamento. O que acontece ao girar o potenciômetro assim como antes?

3. Porque isso acontece? O que você pode concluir sobre o uso de potenciômetros logarítmicos em sistemas de controle? Em que cenários eles podem ser mais úteis que os lineares?

--- 

### Bloco 5: Linearidade do Potenciômetro Logarítmico

Neste bloco, vamos coletar dados de um transferidor graduado fixo ao servo motor para gerar observar o comportamento do potenciômetro logarítmico (Tipo A). A Embora estejamos realizando esse procedimento manualmente, em sistemas mais complexos, essa coleta pode ser feita por meio de algoritmos de controle, sendo úteis para calibrar até mesmo sensores lineares que possuem algum desvio ou não-linearidade.

### Passo 1: Introdução ao Circuito

Nesse bloco, usaremos o mesmo circuito do bloco anterior, com o potenciômetro logarítmico e o servo motor conectados ao Arduino. Contudo, para facilitar a coleta de dados e produzir um volume constante de dados, vamos utilizar um botão para controlar o instante em que os dados serão coletados.

1. Adicione um botão à protoboard

2. Conecte um dos pinos ao GND.

3. Conecte um pino do mesmo lado do botão ao pino 2 do Arduino. Quando pressionado, o botão fechará o circuito entre os pinos, enviando um sinal ```LOW``` ao Arduino.

<p align="center">
  <img src="..\src\images\Roteiro 2\pot_servo_button_circuit.png" alt="Circuito do Potenciômetro" height="300">
</p>

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
    myServo.write(180 - angle);

    if (digitalRead(buttonPin) == LOW) { // Verifica se o botão foi pressionado
    
        Serial.print("Potentiometer Value: ");
        Serial.print(potValue);
        Serial.print(" - Servo Angle: ");
        Serial.println(angle);
        
        delay(1000);
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


| Ângulo do Potenciômetro | Valor do Potenciômetro | Ângulo do Servo |
|------------------------|-------------------------|-----------------|
| 0                      | 0                       | 0               |
| 30                    | 27                      | 4              |
| 60                    | 63                      | 1              |
| ...                    | ...                     | ...            |
| 300                    | 1023                    | 180            |

### Passo 4: Análise dos Dados no Excel

1. Gere um gráfico de dispersão com os dados coletados, conectando os pontos com linhas retas ou suaves. O eixo x será o ângulo do potenciômetro e o eixo y será o ângulo do servo motor. Como é o formato da curva gerada? Isso condiz com o comportamento logarítimico do potenciômetro?

2.  A curva é realmente logarítmica? Ou é uma composição de funções? Porque você acha que isso acontece?

3. Crie uma coluna ```Valor Linear do Potenciômetro```, apontando o comportamento "ideal" caso o potenciômetro fosse linear. Para isso, simularemos a função ```map```, mapeando o intervalo de 0 a 1023 para o intervalo de 0 a 300 graus, de maneira linear. Calcule a seguinte razão:

$$ = (\text{Ângulo do Pot.} / \text{Ângulo Máximo do Pot.}) * \text{Valor Máximo do Pot.} $$

onde o Ângulo Máximo do Potenciômetro é 300 graus, e o Valor Máximo do Potenciômetro é 1023.

4. Crie uma coluna ```Erro```, calculando a diferença entre o valor linear e o valor real do potenciômetro para cada ponto. Exiba os resultados num gráfico similar aos anteriores. O que você pode concluir sobre o comportamento do potenciômetro logarítmico em relação ao linear?

### Conclusão

Este experimento apresentou os potenciômetros e servo motores, começando com o uso de um potenciômetro linear, seguido pela substituição por um potenciômetro logarítmico. A coleta de dados e a visualização da linearidade da resposta do potenciômetro logarítmico proporcionaram uma compreensão prática de como um mesmo componente eletrônico, mas com especificações diferentes, podem interferir no controle de dispositivos eletrônicos.

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

---