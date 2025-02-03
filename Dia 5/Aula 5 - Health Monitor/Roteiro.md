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
| 1x Placa Arduino (Uno, Mega, ou similar) | <img src="https://d229kd5ey79jzj.cloudfront.net/1338/images/1338_2_X.png?20241107090313" height="100">                                                      |
| 1x Cabo USB para conexão com o computador  | <img src="https://m.media-amazon.com/images/I/5181PDv7RbL._AC_UF894,1000_QL80_.jpg" height="100">                                                     |
| 1x Sensor de Frequência Cardíaca e Oxigenação MAX30102 | <img src="https://ae01.alicdn.com/kf/S5450c2e454ec46ed902c16184232d10f7.jpg_640x640Q90.jpg_.webp"  height="100"> |
| 1x Display LCD 16x2                  | <img src="https://www.usinainfo.com.br/1020284-thickbox_default/display-lcd-16x2-com-fundo-verde.jpg" height="100">           |
| 1x Potenciômetro de 10k ohms         | <img src="https://www.soundtronics.co.uk/images/detailed/24/Ext-7300-400_n4xy-q3.jpg" height="100"> |
| Breadboard | <img src="https://cdn.awsli.com.br/600x700/1665/1665980/produto/11154566064a7523ad8.jpg" height="100"> |
| Jumpers | <img src="https://res.cloudinary.com/rsc/image/upload/b_rgb:FFFFFF,c_pad,dpr_1.0,f_auto,q_auto,w_700/c_pad,w_700/R2048241-01" height="100"> |

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
