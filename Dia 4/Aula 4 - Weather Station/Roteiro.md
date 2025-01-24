# Introdução à Eletrônica com Arduino

## Weather Station (Qualidade do Ar)

### Descrição

Neste roteiro, vamos utilizar o sensor MQ-2 para medir a concentração de gases inflamáveis, fumaça e álcool no ambiente. Além disso, vamos adicionar o DHT11, capaz de medir a temperatura e umidade relativa do ar. Combinando esses sensores, vamos construir uma "estação meteorológica" com Arduino para monitorar a qualidade do ar e as condições ambientais em tempo real. Além disso, iremos explorar novos métodos de exibição dos dados, com uma primeira experiência construindo um alarme residencial.

### Objetivos

- Utilizar o sensor DHT11 para medir a temperatura e umidade relativa do ar.
- Apresentar o funcionamento do sensor MQ-2 para medir a concentração de gases inflamáveis, fumaça e álcool no ambiente.
- Construir uma estação meteorológica com Arduino para monitorar a qualidade do ar e as condições ambientais em tempo real.
- Exibir os dados da estação meteorológica em um display LCD, construindo um alarme sonoro para situações críticas.

### Materiais Necessários

- 1x Placa Arduino (Uno, Mega, ou similar)
- 1x Cabo USB para conexão com o computador
- 1x Sensor de temperatura e umidade DHT11
- 1x Sensor de gás inflamável MQ-2
- 1x Display LCD 16x2
- 1x Buzzer passivo
- 1x Potenciômetro de 10k ohms (B10K)
- 2x Resistor de 10k ohms
- Breadboard e jumpers
- Isqueiro/Álcool em gel para testes

### Palavras-chave

Arduino, Sensor de Temperatura e Umidade, DHT11, Sensor de Gás Inflamável, MQ-2, Display LCD, Buzzer, Alarme.

---

## Metodologia

### Bloco 1: DHT11: Sensor de Temperatura

O sensor DHT11 é um sensor de temperatura e umidade relativa do ar, capaz de medir a temperatura do ambiente. Ele é amplamente utilizado em projetos de automação residencial, controle de climatização e monitoramento ambiental. Neste bloco, vamos explorar o funcionamento do sensor DHT11 e como ele pode ser utilizado para medir a temperatura do ar.

#### Passo 1: Introdução ao Circuito

1. Conecte o sensor DHT11 ao Arduino conforme o esquemático abaixo:
   - Pino VCC do sensor ao 5V do Arduino
   - Pino GND do sensor ao GND do Arduino
   - Pino DATA do sensor ao pino digital 2 do Arduino

<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS30K55UqeITRNTNB1I5sXJSxa9DanTKt-GXw&s" width="300">
</p>

2. Adicione um resistor de 10k ohms entre o pino DATA e o pino VCC do sensor (para manter o pino DATA em nível lógico alto quando não houver transmissão de dados).

<p align="center">
  <img src="..\src\images\Roteiro 4\dht11_circuit.png" height="300">
</p>

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

2. O sensor responde rapidamente a mudanças de temperatura? Experimente assoprar vento quente na superfície do sensor e observe a resposta. Depois, esperimente sobrar vento frio paralelamente ao sensor, e observe a resposta.

3. Como o sensor DHT11 poderia ser utilizado em projetos de automação residencial ou controle de climatização? Quais condições de temperatura podem indicar situações críticas?

---

### Bloco 2: DHT11: Sensor de Humidade

Além de medir a temperatura do ar, o sensor DHT11 também é capaz de medir a umidade relativa do ar. A umidade relativa é um parâmetro importante para avaliar o conforto térmico e a qualidade do ar em ambientes internos. Neste bloco, vamos explorar a medição da umidade relativa do ar com o sensor DHT11.

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito do bloco anterior montado e conectado ao Arduino.

#### Passo 2: Programação

Nesse bloco, vamos utilizar o mesmo código do bloco anterior, pois o objetivo é coletar dados de umidade para análise posterior.

1. Abra o exemplo "DHT11" em ```File > Examples > DHT11 > ReadHumidity```

#### Passo 3: Observação

1. Abra o Serial Monitor na Arduino IDE.
2. Observe a umidade relativa do ar medida pelo sensor DHT11. A umidade é exibida em porcentagem.

#### Passo 4: Exploração

1. O sensor DHT11 é preciso e estável na medição da umidade relativa do ar? Existem flutuações nos valores de umidade? Experimente sobrar na superfície do sensor e observe a resposta. Após atingir um alto nível de humidade, experimente deixar o sensor estável por alguns minutos, e observe a resposta.

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

<p align="center">
    <img src="..\src\images\Roteiro 4\mq_2_circuit.png" height="300">
</p>

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

3. Aproxime o sensor de uma fonte de fumaça ou álcool e observe as mudanças nos valores de leitura. Use o gás do isqueiro ou esfregue álcool gel nas mãos para estimular o sensor.

#### Passo 4: Exploração

1. O sensor MQ-2 é sensível e preciso na medição da concentração de gases inflamáveis? Existem flutuações nos valores de leitura? Ele atinge a estabilidade logo após a inicialização do sensor, ou toma algum tempo?

2. O trimpot (potenciômetro) na face traseira do módulo é usado para configurar um threshold de detecção. Experimente ajustar o trimpot para o mínimo e o máximo e observe como isso interfere na saída digital quando se aproxima o isqueiro.

3. Configure o trimpot sensor MQ-2 para manter a saída digital em nível baixo (0) quando não houver detecção de gases inflamáveis mas, quando houver uma fonte próxima, a saída digital seja acionada. Para isso, posicione o isqueiro/álcool e ajuste o trimpot até que a saída digital seja acionada. Experimente mover a fonte de gás inflamável para diferentes distâncias e observe o comportamento do sensor.

3. Como o sensor MQ-2 poderia ser utilizado em projetos de segurança, monitoramento de incêndios ou controle de qualidade do ar? Quais gases inflamáveis ele é capaz de detectar? Como ele funciona? Consule a datasheet do módulo para mais informações.

---

### Bloco 4: Display LCD e Monitor de Qualidade do Ar

Neste bloco, vamos combinar os sensores DHT11 e MQ-2 com um display LCD para criar uma "estação meteorológica" com Arduino. Vamos exibir a temperatura, umidade relativa e a concentração de gases inflamáveis no ambiente em tempo real. Além disso, vamos explorar novos métodos de exibição dos dados, com um display LCD.

<p align="center">
    <img src="https://www.makerhero.com/wp-content/uploads/2020/04/aula7.1.png" width="300">
</p>

#### Passo 1: Introdução ao Circuito

1. Mantenha as conexões dos sensores DHT11 e MQ-2 ao Arduino conforme os blocos anteriores.

2. Conecte o display LCD ao Arduino conforme o esquemático abaixo:

<p align="center">
    <img src="..\src\images\Roteiro 4\lcd_circuit.png" height="300">
</p>

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
#define LCD_RS 13
#define LCD_EN 12
#define LCD_D4 11
#define LCD_D5 10
#define LCD_D6 9
#define LCD_D7 8

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

### Bloco 5: Alarme para emergências

Neste bloco, vamos adicionar um alarme sonoro ao nosso projeto de estação meteorológica com Arduino. O alarme será acionado quando a concentração de gases inflamáveis no ambiente ultrapassar um limite pré-estabelecido (ou se o sinal digital estiver em HIGH), quando a temperatura estiver acima de um valor crítico ou quando a umidade relativa do ar estiver abaixo de um valor crítico. O alarme sonoro será acionado por um buzzer passivo.

<p align="center">
    <img src="https://5.imimg.com/data5/SELLER/Default/2023/8/335983939/TM/NW/CG/14880888/piezo-buzzer-b-10n-piezo-electric-buzzers-rm0338-by-robomart-399-600x600-jpg-1-500x500.jpg" width="200">
</p>

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito original, apenas adicione um buzzer passivo ao Arduino conforme o esquemático abaixo:
   - Pino positivo do buzzer ao pino digital 4 do Arduino
   - Pino negativo do buzzer ao GND do Arduino

<p align="center">
    <img src="..\src\images\Roteiro 4\buzzer_circuit.png" height="300">
</p>

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código para acionar o alarme sonoro quando algumas das condições críticas forem atingidas:
- Temperatura acima de 30°C
- Umidade relativa do ar abaixo de 30%
- Concentração de gases inflamáveis acima de 200
- Sinal digital do sensor MQ-2 em HIGH

```cpp
#include <DHT11.h> // Inclui a biblioteca do sensor DHT11
#include <LiquidCrystal.h> // Inclui a biblioteca do display LCD

// Define os pinos do DHT11
#define DHT11_PIN 2

// Define os pinos do MQ-2
#define MQ2_DOUT_PIN 3 // Pino DOUT do sensor MQ-2
#define MQ2_AOUT_PIN A0 // Pino AOUT do sensor MQ-2

// Define os pinos do display LCD
#define LCD_RS 13
#define LCD_EN 12
#define LCD_D4 11
#define LCD_D5 10
#define LCD_D6 9
#define LCD_D7 8

// Define o pino do buzzer
#define BUZZER_PIN 4

// Inicializa o display LCD
LiquidCrystal lcd(LCD_RS, LCD_EN, LCD_D4, LCD_D5, LCD_D6, LCD_D7);

// Inicializa o sensor DHT11
DHT11 dht11(DHT11_PIN);

void setup() {
    Serial.begin(9600);
    lcd.begin(16, 2); // Inicializa o display LCD com 16 colunas e 2 linhas
    pinMode(BUZZER_PIN, OUTPUT); // Configura o pino do buzzer como saída
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

    // Condições para acionar ou desligar o alarme sonoro
    if (temperature > 30 || humidity < 30 || gasAnalogValue > 200 || gasDigitalValue == HIGH) {
        alarmOn(); // Aciona o alarme sonoro
    } else {
        alarmOff(); // Desliga o alarme sonoro
    }

    delay(3000); // Aguarda 3 segundos antes de repetir o loop
}

void alarmOn() {
    tone(BUZZER_PIN, 440); // Aciona o alarme sonoro
}

void alarmOff() {
    noTone(BUZZER_PIN); // Desliga o alarme sonoro
}

```

> **Nota:** O comando ```tone(BUZZER_PIN, 440)``` aciona o alarme sonoro no pino do buzzer com uma frequência de 440Hz. O comando ```noTone(BUZZER_PIN)``` desliga o alarme sonoro.

> Nesse sketchs, utilizamos o conceito de definição de funções para acionar e desligar o alarme sonoro (```alarmOn()``` e ```alarmOff()```), que facilita a organização do código e a manutenção do projeto.

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o display LCD e o buzzer conectados ao Arduino.

2. O alarme sonoro é acionado quando a temperatura ultrapassa 30°C, a umidade relativa do ar está abaixo de 30%, a concentração de gases inflamáveis ultrapassa 200 ou o sinal digital do sensor MQ-2 está em HIGH. Portanto, experimente aquecer o sensor DHT11 ou aproximar o sensor MQ-2 de uma fonte de gás inflamável para acionar o alarme.

#### Passo 4: Exploração

1. O alarme sonoro é eficaz para alertar sobre situações críticas? Ele é alto o suficiente para ser ouvido em ambientes ruidosos? O que poderia ser feito para melhorar a eficácia do alarme sonoro? Experimente ajustar a frequência do buzzer para tornar o alarme mais perceptível.

2. Como o alarme sonoro poderia ser integrado a outros sistemas de segurança ou monitoramento? Quais outros sensores ou dispositivos poderiam ser acionados em conjunto com o alarme sonoro? Experimente pesquisar sobre sistemas de alarme e segurança para obter ideias de integração.

3. Como o projeto da estação meteorológica poderia ser expandido para incluir mais sensores, dispositivos de exibição ou sistemas de alerta? Quais outras funcionalidades poderiam ser adicionadas ao projeto para torná-lo mais completo e eficiente? Experimente idealizar um sistema de monitoramento ambiental completo, com sensores de qualidade do ar, temperatura, umidade, luminosidade, ruído, entre outros.

---

### Conclusão

Neste roteiro, exploramos o funcionamento dos sensores DHT11 e MQ-2 para medir a temperatura, umidade e concentração de gases inflamáveis no ambiente. Construímos uma estação meteorológica com Arduino para monitorar a qualidade do ar e as condições ambientais em tempo real. Além disso, adicionamos um display LCD e um alarme sonoro ao projeto para exibir os dados e alertar sobre situações críticas.



### Referências para Consulta

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

