# Introdução à Eletrônica com Arduino

## IMU

### Descrição
Este roteiro de monitoria tem como objetivo compreender e explorar as aplicações do acelerômetro e do giroscópio integrados em um IMU (Unidade de Medida Inercial), utilizando o sensor MPU6050. A atividade inclui uma breve introdução às funções de cada componente, a implementação do protocolo I2C para comunicação com o Arduino e a análise da importância de um software na interpretação dos dados obtidos pelo sensor.

### Objetivos
- Aprender a configurar e conectar o IMU ao Arduino usando a comunicação I2C
- Explorar as funcionalidades de um IMU
- Entender a importância do processamento de dados para a análise de informações obtidas por sensores inerciais
- Desenvolver habilidades práticas para integrar sensores inerciais em projetos eletrônicos.

### Materiais Necessários
- 1x Placa Arduino + Cabo USB
- 1x Acelerômetro & Giroscópio - MPU-6050 (6DOF)
- 1x Protoboard
- Jumpers

### Palavras-chave
Arduino, acelerômetro, giroscópio, IMU, MPU6050, sensores inerciais, protocolo I2C.

---

## Metodologia

### Bloco 1: Acelerômetro
Um acelerômetro mede a aceleração adequada de um objeto, que é sua taxa de mudança de velocidade em relação a um referencial inercial em queda livre. Isso o diferencia da aceleração coordenada, que é medida em relação a um sistema de coordenadas, podendo estar acelerado ou não.

<p align="center">
  <img src="https://cdn.phidgets.com/docs/images/9/96/Accelerometer_Intro.jpg" height="300">
</p>

Eles têm diversas aplicações na indústria, ciência e produtos de consumo. São usados em sistemas de navegação inercial para aeronaves e mísseis, estabilização de veículos aéreos não tripulados e dispositivos portáteis, como smartphones, câmeras e controles de videogame, para detectar movimento e orientação.
Neste bloco, conectaremos o MPU6050 ao Arduino e utilizaremos o protocolo I2C para observar os dados coletados pelo acelerômetro. O protocolo I2C utiliza duas linhas principais: o pino de relógio serial (SCL), que envia pulsos regulares gerados pelo Arduino, e o pino de dados serial (SDA), responsável pela troca de informações entre os dispositivos.

<p align="center">
  <img src="..\..\src\images\Monitoria 3\Diagrama1.png" height="300">
</p>

#### Passo 1: Introdução ao Circuito
1. Conecte o pino SCL do sensor ao pino A5 do Arduino
2. Conecte o pino SDA do sensor ao pino A4 do Arduino
3. Conecte o pino VCC do sensor ao terminal de 5V do Arduino
4. Conecte o pino GND do sensor ao terminal GND do Arduino

#### Passo 2: Programação
1. Abra o Arduino IDE e escreva o seguinte código:

    ```cpp
    // Inclui a biblioteca Wire que possui as funções da comunicação I2C:
    #include <Wire.h>

    const int endereco_MPU = 0x68; // Endereço I2C do MPU-6050
    float acel_x; // aceleração linear eixo X
    float acel_y; // aceleração linear eixo Y
    float acel_z; // aceleração linear eixo Z

    void setup() {
    Serial.begin(9600);
    Wire.begin();

    // Inicializa o MPU-6050
    Wire.beginTransmission(endereco_MPU);
    Wire.write(0x6B); // Registrador PWR_MGMT_1
    Wire.write(0);
    Wire.endTransmission(true);
    }

    void loop() {
    Wire.beginTransmission(endereco_MPU);
    Wire.write(0x3B); // Registrador ACCEL_XOUT_H
    Wire.endTransmission(false);
    Wire.requestFrom(endereco_MPU, 6, true);

    // Lê os valores do acelerômetro
    acel_x = Wire.read() << 8 | Wire.read(); // Accel X
    acel_y = Wire.read() << 8 | Wire.read(); // Accel Y
    acel_z = Wire.read() << 8 | Wire.read(); // Accel Z

    // Converte os valores para g (escala de 2g)
    acel_x = acel_x / 16384.0;
    acel_y = acel_y / 16384.0;
    acel_z = acel_z / 16384.0;

    // Exibe os valores no Monitor Serial
    Serial.print("AcX: "); Serial.print(acel_x, 2);
    Serial.print(" | AcY: "); Serial.print(acel_y, 2);
    Serial.print(" | AcZ: "); Serial.print(acel_z, 2);
    Serial.println();

    delay(500);
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Abra o monitor serial e observe os dados coletados pelo MPU6050, devem estar aparecendo os dados dos três eixos
2. Mexa o sensor e verifique quais movimentos são mais aparentes
3. Coloque o sensor sobre a mesa e observe os dados coletados. O sensor apresenta leituras consistentes e precisas?

#### Passo 4: Exploração
1. Realize uma calibração inicial para garantir que os valores de rotação no estado "sem movimento" sejam zero. Como os valores se ajustam após isso?
2. Como o acelerômetro reage a diferentes velocidades de movimento?
3. Como o acelerômetro responde a forças aplicadas em diferentes direções?
4. Em quais aplicações você acredita que o acelerômetro poderia ser especialmente útil?

---

### Bloco 2: Giroscópio
Giroscópios são dispositivos projetados para medir ou manter o movimento rotacional. Giroscópios MEMS (Sistemas Microeletromecânicos) são sensores compactos e acessíveis que medem a velocidade angular, geralmente expressa em graus por segundo (°/s) ou revoluções por segundo (RPS). Velocidade angular é simplesmente uma medida de velocidade de rotação.

<p align="center">
  <img src="https://cdn.phidgets.com/docs/images/a/ae/Gyroscope_Intro.jpg" height="300">
</p>

Esses sensores são amplamente utilizados para determinar orientação e estão presentes na maioria dos sistemas de navegação autônomos. Por exemplo, em robôs, um giroscópio pode medir desvios da posição equilibrada e enviar correções aos motores para estabilizá-los. Neste bloco, realizaremos a leitura dos dados coletados pelo giroscópio do MPU6050 para entender como ele mede a rotação e a velocidade angular.

#### Passo 1: Introdução ao Circuito
1. Usaremos o mesmo circuito do bloco anterior

#### Passo 2: Programação
1. Modifique o código do bloco anterior da seguinte forma:
    - Troque as variáveis ```acel_x, acel_y e acel_y``` por ```giro_x, giro_y e giro_z```
    - Troque ```0x3B``` por ```0x43``` na linha x para ler os valores do giroscópio
    - Ao invés de converter os valores para g, converta os valores do giroscópio lidos em velocidade (º/s):
    ```cpp
    void loop(){
        ...
        // fator de conversão para escala de 250º/s
        giro_x = giro_x / 131.0;
        giro_y = giro_y / 131.0;
        giro_z = giro_z / 131.0;
        ...
    }
    ```
2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Abra o monitor serial e observe os dados coletados pelo MPU6050, devem estar aparecendo os dados dos três eixos
2. Coloque o sensor sobre a mesa e observe os dados coletados. O sensor apresenta leituras consistentes e precisas?

#### Passo 4: Exploração
1. Realize uma calibração inicial para garantir que os valores de rotação no estado "sem movimento" sejam zero. Como os valores se ajustam após isso?
2. Deixe o giroscópio rotacionando por um longo período e verifique se a precisão das medições se mantém ou se há drift (erro acumulado)
3. Faça um movimento rotacional com o sensor. Como as leituras do giroscópio variam com diferentes velocidades de rotação? Existe algum atraso nas medições de rotação quando o movimento é rápido?
4. Aumente a taxa de leitura do giroscópio e veja como ele responde a leituras mais rápidas. Há alguma perda de precisão?
5. Em quais aplicações você acredita que o giroscópio poderia ser especialmente útil?

---

### Bloco 3: Visualização dos dados
Neste bloco, iremos visualizar os dados coletados pelo acelerômetro e giroscópio do MPU6050 utilizando o plotter do Arduino IDE, com o objetivo de analisar quais movimentos são mais bem detectados por cada sensor. Além disso, discutiremos a utilidade dessa representação gráfica simples e sua eficácia para tirar conclusões sobre o comportamento dos sensores.


#### Passo 1: Introdução ao Circuito
1. Utilizaremos o mesmo circuito do bloco 1

#### Passo 2: Programação
1. Una os códigos dos blocos 1 e 2 para armazenar os dados coletados tanto pelo acelerômetro quanto pelo giroscópio e exiba da seguinte forma para poder visualizar no Serial Plotter:
    ```cpp
    void loop(){
        ...
        Serial.print("AcX:");
        Serial.print(acel_x, 2);
        Serial.print("\tAcY:");
        Serial.print(acel_y, 2);
        Serial.print("\tAcZ:");
        Serial.print(acel_z, 2);
        Serial.print("\tGyX:");
        Serial.print(giro_x, 2);
        Serial.print("\tGyY:");
        Serial.print(giro_y, 2);
        Serial.print("\tGyZ:");
        Serial.print(giro_z, 2);
        Serial.println(); // Nova linha necessária para o Serial Plotter

        delay(50); // Aguarda 50ms para suavizar o gráfico no Serial Plotter
    }
    ```
2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Abra o Serial Plotter na Arduino IDE para visualizar os dados de inércia em tempo real, de forma gráfica.
2. Com o sensor sobre a mesa, observe os dados coletados. Os valores do acelerômetro e do giroscópio permanecem constantes ou apresentam pequenas oscilações?
3. O gráfico do giroscópio mostra algum drift (deslocamento gradual nos valores) mesmo sem movimento?

#### Passo 4: Exploração
1. Movimente o sensor em linha reta em diferentes direções. Qual sensor apresenta maior variação nos gráficos?
2. Movimente o sensor lentamente e depois rapidamente em uma mesma direção. Como os gráficos do acelerômetro e do giroscópio se diferem entre movimentos suaves e bruscos?
3. Repita o mesmo movimento várias vezes. Os sensores fornecem leituras consistentes para cada repetição?
4. Com base apenas nos dados exibidos nos gráficos, é possível identificar a posição atual do sensor ou os movimentos que ele está realizando?
5. Quais aplicações você consegue imaginar ao combinar o uso do giroscópio e do acelerômetro? Como essa integração pode ser aproveitada em projetos tecnológicos?

---

### Bloco 4: Visualização das Dimensões de Rotação
Neste bloco, faremos uma integração entre o Arduino e o Processing para criar uma visualização em tempo real das três dimensões de rotação que descrevem o movimento de um objeto no espaço. Elas são usadas para descrever o movimento de aviões, navios e naves espaciais: roll, pitch e yaw. O Arduino terá a função de coletar os dados do sensor MPU6050, processar as informações de aceleração e rotação, calcular os ângulos de pitch, roll e yaw, e enviar esses valores via comunicação serial. No Processing, desenvolveremos uma interface gráfica que representará visualmente esses ângulos. 


<p align="center">
  <img src="https://automaticaddison.com/wp-content/uploads/2020/03/yaw_pitch_rollJPG.jpg" height="300">
</p>

#### Passo 1: Introdução ao Circuito
1. Utilizaremos o mesmo circuito do bloco 1

#### Passo 2: Programação
1. Modificaremos o código do bloco 3 para calcular pitch, roll e yaw e enviar ao Processing:
    ```cpp
    ...
    // Variáveis para pitch, roll e yaw
    float pitch = 0.0, roll = 0.0, yaw = 0.0;

    // Constantes para integração do giroscópio
    float dt = 0.05; // intervalo de tempo (50ms)
    float alfa = 0.98; // constante para filtro complementar
    
    ...

    void loop(){
        ...
        // Apagar os prints dos dados do acelerômetro e giroscópio

        // Calcula pitch e roll usando o acelerômetro
        float pitch_acel = atan2(acel_y, sqrt(acel_x * acel_x + acel_z * acel_z)) * 180 / PI;
        float roll_acel = atan2(-acel_x, acel_z) * 180 / PI;

        // Integra os dados do giroscópio
        pitch += giro_x * dt;
        roll += giro_y * dt;
        yaw += giro_z * dt;

        // Aplica filtro complementar
        pitch = alfa * pitch + (1 - alfa) * pitch_acel;
        roll = alfa * roll + (1 - alfa) * roll_acel;

        // Envia os valores para o Processing
        Serial.print("Pitch:");
        Serial.print(pitch, 2);
        Serial.print("\tRoll:");
        Serial.print(roll, 2);
        Serial.print("\tYaw:");
        Serial.print(yaw, 2);
        Serial.println();

        delay(50); // Aguarda 50ms
        
    }
    ```
2. Instale o Processing, de acordo com as instruções disponíveis no site oficial: Processing.
3. Abra o Processing e crie um novo sketch.
4. Escreva o seguinte código no sketch do Processing:

    ```java
    import processing.serial.*;

    Serial myPort; // Porta serial
    float pitch, roll, yaw; // Ângulos recebidos do Arduino

    void setup() {
        size(600, 600, P3D); // Janela 3D
        myPort = new Serial(this, "COM11", 9600); // Configura a porta serial
        myPort.bufferUntil('\n'); // Aguarda linha completa
    }

    void draw() {
        background(30); // Fundo preto
        lights(); // Ativa iluminação
        translate(width / 2, height / 2, -200); // Centraliza o sistema

        // Rotaciona o cubo conforme os ângulos
        rotateX(radians(-pitch));
        rotateY(radians(-yaw));
        rotateZ(radians(-roll));

        // Desenha o cubo
        fill(0, 0, 255);
        box(200); // Cubo azul
    }

    void serialEvent(Serial myPort) {
        // Lê os dados da porta serial
        String data = myPort.readStringUntil('\n');
        if (data != null) {
                data = trim(data); // Remove espaços
                String[] values = split(data, '\t');
                if (values.length == 3) {
                pitch = float(values[0].split(":")[1]);
                roll = float(values[1].split(":")[1]);
                yaw = float(values[2].split(":")[1]);
            }
        }
    }
    ```
4. Substitua a porta ```COM11``` pela porta onde o Arduino está conectado.
5. Execute o código no Processing para abrir o dashboard gráfico.

#### Passo 3: Observação
1. Observe o cubo gerado pelo Processing. Enquanto o IMU está parado o cubo permanece estático?
2. Experimente movimentar o IMU, como o cubo se comporta?

#### Passo 4: Exploração
1. Quais outras aplicações você imagina para exibir no Processing?
2. Como este sensor poderia ser útil em aplicações reais na marinha, como sistemas de navegação, estabilização e detecção de movimento?
3. Como você uniria o sensor IMU ao sonar feito em aula para criar um sistema de navegação?

---

### Conclusão
Este roteiro de monitoria permitiu explorar o funcionamento do sensor MPU6050, integrando conceitos de aceleração, rotação e navegação inercial. Através de experimentos com o acelerômetro, o giroscópio e ferramentas como o Serial Plotter e o Processing, foi possível compreender a coleta, processamento e visualização de dados em tempo real. A atividade destacou a importância da comunicação I2C e do processamento de dados para aplicações práticas, como estabilização de dispositivos, controle de robôs e navegação autônoma.

---

### Referências para Consulta
- [Accelerometer](https://en.wikipedia.org/wiki/Accelerometer)

- [Gyroscope](https://en.wikipedia.org/wiki/Gyroscope#:~:text=A%20gyroscope%20from%20Ancient%20Greek,assume%20any%20orientation%20by%20itself.)

- [Wire Library](https://docs.arduino.cc/language-reference/en/functions/communication/wire/) 

### Sugestões de Leitura
- [Protocolo I2C](https://docs.arduino.cc/learn/communication/wire/) 

- [Tutorial Giroscópio](https://learn.sparkfun.com/tutorials/gyroscope/all) 

---