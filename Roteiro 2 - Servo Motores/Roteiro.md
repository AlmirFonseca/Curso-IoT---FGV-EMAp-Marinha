
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

1. Instale a biblioteca "Servo" no Arduino IDE.
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

---