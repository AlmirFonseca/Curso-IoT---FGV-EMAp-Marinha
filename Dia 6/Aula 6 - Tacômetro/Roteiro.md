# Introdução à Eletrônica com Arduino

## Controle de Motor DC com Arduino

### Descrição

Neste roteiro, vamos explorar o controle de um motor DC (corrente contínua) com Arduino. Os motores DC são amplamente utilizados em projetos de robótica, automação e eletrônica, devido à sua simplicidade e versatilidade. Neste roteiro, vamos aprender a controlar a velocidade e a direção de um motor DC utilizando um transistor de potência (TIP122) e a técnica de modulação por largura de pulso (PWM). Além disso, vamos explorar o uso de um joystick para controlar a velocidade do motor e um sensor de efeito Hall para medir a velocidade de rotação do motor, construindo um equipamento industrial conhecido como "tacômetro".

### Objetivos

- Entender o funcionamento de um motor DC e como ele pode ser controlado com Arduino.
- Controlar a velocidade de um motor DC utilizando um transistor de potência (TIP122) e a técnica de modulação por largura de pulso (PWM).
- Utilizar um joystick para controlar a velocidade de um motor DC em tempo real.
- Construir um tacômetro com Arduino e um sensor de efeito Hall para medir a velocidade de rotação de um motor DC.

### Materiais Necessários

| Componente                           | Imagem                                                                                                      |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------|
| 1x Placa Arduino (Uno, Mega, ou similar) | <img src="https://d229kd5ey79jzj.cloudfront.net/1338/images/1338_2_X.png?20241107090313" height="100">                                                      |
| 1x Cabo USB para conexão com o computador  | <img src="https://m.media-amazon.com/images/I/5181PDv7RbL._AC_UF894,1000_QL80_.jpg" height="100">                                                     |
| 1x Motor DC (corrente contínua)        | <img src="https://www.arcaelectronica.com/cdn/shop/products/Motor_DC_cudrado_2048x.jpg?v=1558320811" height="100">                                                     |
| 1x Transistor de Potência TIP122       | <img src="https://cdn.awsli.com.br/78/78150/arquivos/TIP122-ci-transistor-npn.jpg" height="100">                                                       |
| 1x Joystick (potenciômetro)            | <img src="https://cdn.awsli.com.br/600x700/468/468162/produto/19414328/b653f88a4b.jpg" height="100">                                                     |
| 1x Sensor de Efeito Hall               | <img src="https://http2.mlstatic.com/D_NQ_NP_845409-MLB49370398505_032022-O.webp" height="100">                                                  |
| 2x Ímã de Neodímio                     | <img src="https://img.elo7.com.br/product/zoom/233199A/10pcs-ima-de-neodimio-12x2-redondo-pastilha-12mm-x-2mm-n35-ima-super-forte.jpg" height="100">                                             |
| 1x Resistor de 10 K ohms                | <img src="https://www.usinainfo.com.br/1017894-thickbox_default/resistor-10k-14w-kit-com-10-unidades.jpg" height="100">                                                     |
| 1x Diodo 1N4007                        | <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJw5uQsaI5mNaSml1dUjsf6ka4t_AC2Kfing&s" height="100">                                                     |
| Breadboard | <img src="https://cdn.awsli.com.br/600x700/1665/1665980/produto/11154566064a7523ad8.jpg" height="100"> |
| Jumpers | <img src="https://res.cloudinary.com/rsc/image/upload/b_rgb:FFFFFF,c_pad,dpr_1.0,f_auto,q_auto,w_700/c_pad,w_700/R2048241-01" height="100"> |

### Bloco 1: Motores DC

Os motores DC (corrente contínua) são dispositivos que convertem energia elétrica em movimento mecânico rotativo. Eles são amplamente utilizados em projetos de robótica, automação, eletrônica e engenharia. Neste bloco, vamos explorar o funcionamento de um motor DC e como ele pode ser controlado com Arduino.

O Arduino consegue controlar o estado de pinos mas não consegue fornecer corrente suficiente para alimentar um motor DC. Para isso, utilizamos um transistor de potência, como o TIP122, para controlar a corrente que alimenta o motor. A ideia é simples: o Arduino controla o transistor, que por sua vez controla a corrente que alimenta o motor, agindo como um interruptor eletrônico.

#### Passo 1: Introdução ao Circuito

Um transistor de potência, como o TIP122, é um componente eletrônico capaz de controlar correntes elevadas com base em um sinal de controle de baixa corrente. Esse tipo de transistor é ideal para controlar motores DC, lâmpadas, solenoides e outros dispositivos de alta corrente, e possui 3 pinos: Base (B), Coletor (C) e Emissor (E).

<p align="center">
  <img src="https://cdn.awsli.com.br/78/78150/arquivos/TIP122-ci-transistor-npn-pinout.jpg" width="300">
</p>

<p align="center">
  <img src="..\..\src\images\Aula 6\motor_circuit.png" hieght="300">
</p>

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código para controlar a velocidade do motor DC com Arduino e o transistor TIP122:

```cpp
#define MOTOR_PIN 11 // Pino de controle do motor

void setup() {
    pinMode(MOTOR_PIN, OUTPUT);
}

void loop() {
    digitalWrite(MOTOR_PIN, HIGH); // Liga o motor
    delay(1000);

    digitalWrite(MOTOR_PIN, LOW); // Desliga o motor
    delay(1000);
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o motor DC conectado ao circuito. O motor deve ligar e desligar a cada segundo, controlado pelo Arduino e pelo transistor TIP122.

2. Se necessário, ajuste o tempo de ligar e desligar do motor no código para observar o comportamento do motor.

#### Passo 4: Exploração

1. O motor DC liga e desliga corretamente? Ele gira em uma direção específica ou em ambas as direções? Como o circuito pode ser alterado para inverter a direção de rotação do motor?

4. O que esse motor difere do servo motor ou do motor de passo? Em que cenários cada um é mais adequado?

2. O que acontece se alterar o tempo de ligar e desligar do motor no código? Experimente aumentar ou diminuir esse tempo e observe o comportamento do motor.

---

### Bloco 2: Controle de Velocidade com PWM

O controle de velocidade de um motor DC é uma tarefa comum em projetos de automação, robótica e eletrônica. Uma técnica eficaz para controlar a velocidade de um motor DC é a modulação por largura de pulso (PWM), que consiste em variar a largura dos pulsos de um sinal digital para controlar a média da potência entregue ao motor. Neste bloco, vamos explorar o controle de velocidade de um motor DC com Arduino utilizando a técnica de PWM.

<p align="center">
  <img src="https://wiki.ifsc.edu.br/mediawiki/images/5/59/Dutycicle2.png" width="300">
</p>

#### Passo 1: Introdução ao Circuito

1. Mantenha o circuito do bloco anterior montado e conectado ao Arduino.

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código para controlar a velocidade do motor DC com PWM. Para isso, usaremos ```analogWrite()``` para gerar um sinal PWM no pino 11 do Arduino:

```cpp
#define MOTOR_PIN 11 // Pino de controle do motor

void setup() {
    Serial.begin(9600);

    pinMode(MOTOR_PIN, OUTPUT);
}

void loop() {
    // Acelera o motor, indo de 0 a 255
    for (int i = 0; i <= 255; i++) {
        analogWrite(MOTOR_PIN, i); // Controla a velocidade do motor
        Serial.println(i); // Exibe o valor de PWM no monitor serial
        delay(50);
    }

    // Desacelera o motor, indo de 255 a 0
    for (int i = 255; i >= 0; i--) {
        analogWrite(MOTOR_PIN, i); // Controla a velocidade do motor
        Serial.println(i); // Exibe o valor de PWM no monitor serial
        delay(50);
    }
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o motor DC conectado ao circuito. O motor deve acelerar e desacelerar gradualmente, controlado pela técnica de PWM.

2. Observe os valores de PWM exibidos no Plotter Serial. Eles variam de 0 a 255, representando a velocidade do motor.

#### Passo 4: Exploração

1. O motor DC acelera e desacelera corretamente? A variação de velocidade é suave e contínua?

2. Existe algum valor que não é capaz de acelerar o motor? Por que isso acontece? Esse "threshold" é o mesmo para desacelerar?

3. Isso acontece com outros sistemas? Como você consegue garantir uma inicialização mais suave? Pense no controle de um carro, por exemplo.

---

### Bloco 3: Joystick para Controle de Velocidade

Os joysticks são dispositivos de entrada que permitem controlar a posição de um cursor ou objeto em um sistema. Eles são amplamente utilizados em videogames, simulações e interfaces de usuário. Neste bloco, vamos explorar o uso de um joystick para controlar a velocidade de um motor DC em tempo real, permitindo ajustar a velocidade do motor de forma analógica e precisa.

#### Passo 1: Introdução ao Circuito

1. Mantenha o restante to circuito, incluindo o motor DC e o transistor TIP122.

2. Conecte o joystick ao Arduino conforme o esquemático abaixo:
    - Pino +5V do joystick ao 5V do Arduino
    - Pino GND do joystick ao GND do Arduino
    - Pino VRx do joystick ao pino analógico A0 do Arduino
    - Pino VRy do joystick ao pino analógico A1 do Arduino
    - Pino SW do joystick ao pino analógico A2 do Arduino

<p align="center">
    <img src="../../src/images/Aula 6/motor_joystick_circuit.png" height="300">
</p>

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código para controlar a velocidade do motor DC com um joystick. O joystick controlará a velocidade do motor proporcionalmente à sua posição:

```cpp
#define MOTOR_PIN 11 // Pino de controle do motor

#define JOYSTICK_X A0 // Pino do joystick para o eixo X
#define JOYSTICK_Y A1 // Pino do joystick para o eixo Y
#define JOYSTICK_SW A2 // Pino do joystick para botão de pressão

bool motorOn = false; // Estado do motor (ligado/desligado)

void setup() {
    Serial.begin(9600);

    pinMode(MOTOR_PIN, OUTPUT);
    pinMode(JOYSTICK_SW, INPUT_PULLUP); // Configura o pull-up interno do Arduino para o botão do joystick
}

void loop() {
    // Se o botão for pressionado, liga/desliga o motor
    if (digitalRead(JOYSTICK_SW) == LOW) {
        
        // Inverte o estado do motor
        if (motorOn) {
            motorOn = false;
            Serial.println("Motor desligado");
        } else {
            motorOn = true;
            Serial.println("Motor ligado");
        }

        delay(200); // Debounce do botão
    }

    if (motorOn) {
        int joystickValue = analogRead(JOYSTICK_X); // Lê a posição do joystick

        int speed = map(joystickValue, 0, 1023, 0, 255); // Mapeia a posição do joystick para a velocidade do motor

        analogWrite(MOTOR_PIN, speed); // Controla a velocidade do motor
        // Serial.println(speed); // Exibe a velocidade no monitor serial
        Serial.print("motorOn: ");
        Serial.print(motorOn);
        Serial.print(" - speed: ");
        Serial.print(speed);
        Serial.print(" - joystickValue: ");
        Serial.println(joystickValue);
    } else {
        analogWrite(MOTOR_PIN, 0); // Desliga o motor
    }
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o motor DC conectado ao circuito. O motor deve ligar e desligar conforme o botão do joystick é pressionado.

2. Movimente o joystick para controlar a velocidade do motor. A velocidade do motor deve variar proporcionalmente à posição do joystick.

#### Passo 4: Exploração

1. O joystick controla a velocidade do motor corretamente? A variação de velocidade é suave e proporcional à posição do joystick? O joystick responde linearmente em todo o seu percurso?

2. Como você poderia usar o outro eixo do joystick (eixo Y) para controlar a direção do motor? Experimente modificar o código para controlar a direção do motor com o eixo Y do joystick.

3. Como você poderia inverter a direção do aumento de velocidade do motor? Experimente modificar o código para inverter a relação entre a posição do joystick e a velocidade do motor.

4. O motor se movimenta para qualquer valor do joystick? Por que isso acontece? Como você poderia regular a faixa de movimento do motor?

---

### Bloco 4: Efeito Hall: um Switch Magnético

O sensor de efeito Hall é um dispositivo que detecta campos magnéticos e converte essa informação em um sinal elétrico proporcional à intensidade do campo magnético. Ele é amplamente utilizado em aplicações de controle, medição e detecção de campos magnéticos. Neste bloco, vamos explorar o uso de um sensor de efeito Hall para medir a velocidade de rotação de um motor DC, construindo um equipamento industrial conhecido como "tacômetro", amplamente utilizado para medir a velocidade de motores e máquinas rotativas.

O transistor 3144 é um sensor de efeito Hall que detecta a presença de um campo magnético e gera um sinal de saída digital, chaveando entre os estados alto e baixo conforme a presença de um ímã. Neste bloco, vamos utilizar o sensor 3144 para medir a velocidade de rotação de um motor DC, posicionando um ímã numa hélice acoplada ao motor e observando a frequência de pulsos gerados pelo sensor.

<p align="center">
  <img src="https://5.imimg.com/data5/ZL/TJ/XF/SELLER-562456/a3144-hall-effect-sensor.jpg" width="300">
</p>

#### Passo 1: Introdução ao Circuito

1. Conecte o sensor de efeito Hall 3144 ao Arduino conforme o esquemático abaixo:
    - Pino VCC do sensor ao 5V do Arduino
    - Pino GND do sensor ao GND do Arduino
    - Pino DO (Digital Output) do sensor ao pino digital A5 do Arduino

> Você sabia? Todo pino analógico do Arduino pode ser utilizado como pino digital, permitindo aumentar o número de pinos disponíveis para conexão de sensores e atuadores. Contudo, os pinos digitais não são capazes de realizar leituras analógicas.

<p align="center">
    <img src="../../src/images/Aula 6/motor_joystick_halleffect_circuit.png" height="300">
</p>

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código para medir a velocidade de rotação do motor DC com um sensor de efeito Hall:

```cpp
#define HALL_SENSOR_PIN A5 // Pino de leitura do sensor de efeito Hall

void setup() {
    Serial.begin(9600);

    pinMode(HALL_SENSOR_PIN, INPUT_PULLUP); // Configura o pino do sensor como entrada com pull-up interno
}

void loop() {
    int sensorValue = digitalRead(HALL_SENSOR_PIN); // Lê o valor do sensor de efeito Hall

    if (sensorValue == LOW) {
        Serial.println("MAGNET DETECTED!!"); // Exibe a detecção do ímã no monitor serial
        delay(100);
    } else {
        Serial.println("."); // Exibe a ausência do ímã no monitor serial
        delay(100);
    }
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o sensor de efeito Hall conectado ao circuito. O sensor deve detectar a presença de um campo magnético gerado pelo ímã quando ele passa em frente ao sensor.

> O sensor de efeito Hall 3144 é sensível à polaridade do campo magnético. Certifique-se de posicionar o ímã corretamente em relação ao sensor para gerar os pulsos de saída. Após encontrar o polo capaz de ativar o sensor, marque o imã para facilitar a identificação. Na sequência, cole o ímã na hélice do motor para medir a velocidade de rotação.

2. Mova o ímã em frente ao sensor de efeito Hall e observe a detecção do campo magnético no monitor serial. A presença do ímã deve gerar pulsos de saída no sensor.

#### Passo 4: Exploração

1. Qual a distância máxima que o ímã pode estar do sensor para ser detectado?

2. Como você poderia usar o sensor de efeito Hall para medir a velocidade de rotação de um motor DC? Quais aplicações práticas poderiam se beneficiar desse tipo de medição? Por quais motivos?

3. Como você poderia melhorar a intensidade do campo magnético gerado pelo ímã para aumentar a sensibilidade do sensor de efeito Hall? Quais materiais ou técnicas poderiam ser utilizados para isso?

---

### Bloco 5: Tacômetro com Sensor de Efeito Hall

O tacômetro é um equipamento utilizado para medir a velocidade de rotação de um motor ou máquina rotativa. Ele é amplamente utilizado em aplicações industriais, automotivas e de controle de qualidade para monitorar a velocidade de motores, turbinas, hélices e outros dispositivos rotativos. Neste bloco, vamos construir um tacômetro com Arduino e um sensor de efeito Hall para medir a velocidade de rotação de um motor DC.

#### Passo 1: Introdução ao Circuito

1. Mantenha o sensor de efeito Hall 3144 conectado ao Arduino conforme o bloco anterior.

2. Conecte o motor DC e joystick ao Arduino conforme o bloco 3, para controlar a velocidade do motor com PWM.

#### Passo 2: Programação

1. Abra a Arduino IDE e escreva o seguinte código para medir a velocidade de rotação do motor DC com um sensor de efeito Hall e um joystick:

```cpp
#define HALL_SENSOR_PIN A5 // Pino de leitura do sensor de efeito Hall

#define MOTOR_PIN 11 // Pino de controle do motor

#define JOYSTICK_X A0 // Pino do joystick para o eixo X
#define JOYSTICK_Y A1 // Pino do joystick para o eixo Y
#define JOYSTICK_SW A2 // Pino do joystick para botão de pressão

bool motorOn = false; // Estado do motor (ligado/desligado)

const long int evaluationTimeMicroseconds = 1000000; // Número de pulsos para medir a velocidade

// Função para medir a velocidade de rotação do motor com o sensor de efeito Hall
float tachometer() {
    // Inicia a contagem de tempo
    unsigned long startTime = micros();

    int lastMagnetState = 1; // Estado anterior do ímã
    int pulseCounter = 0; // Contador de pulsos

    // Conta os pulsos de rotação do motor por um determinado tempo
    while (micros() - startTime <= evaluationTimeMicroseconds) {
        // Lê o estado atual do sensor de efeito Hall
        int currentMagnetState = digitalRead(HALL_SENSOR_PIN);

        // Incrementa o contador se:
        // 1. O estado atual do sensor é LOW (ímã detectado)
        // 2. O estado atual é diferente do estado anterior
        if (!currentMagnetState && currentMagnetState != lastMagnetState) pulseCounter++;

        // Atualiza o estado anterior do sensor
        lastMagnetState = currentMagnetState;
    }

    // Calcula a velocidade de rotação em RPM
    float secondsDuration = (micros() - startTime) / 1000000.0;
    float rpmValue = pulseCounter / secondsDuration * 60.0;
    return rpmValue;
}

void setup() {
    Serial.begin(9600);

    pinMode(HALL_SENSOR_PIN, INPUT_PULLUP); // Configura o pino do sensor como entrada com pull-up interno
    pinMode(MOTOR_PIN, OUTPUT);
    pinMode(JOYSTICK_SW, INPUT_PULLUP); // Configura o pull-up interno do Arduino para o botão do joystick
}

void loop() {
    // Se o botão for pressionado, liga/desliga o motor
    if (digitalRead(JOYSTICK_SW) == LOW) {
        
        // Inverte o estado do motor
        if (motorOn) {
            motorOn = false;
            Serial.println("Motor desligado");
        } else {
            motorOn = true;
            Serial.println("Motor ligado");
        }

        delay(200); // Debounce do botão
    }

    if (motorOn) {
        int joystickValue = analogRead(JOYSTICK_X); // Lê a posição do joystick

        int speed = map(joystickValue, 0, 1023, 0, 255); // Mapeia a posição do joystick para a velocidade do motor

        analogWrite(MOTOR_PIN, speed); // Controla a velocidade do motor

        // Mede a velocidade de rotação do motor com o sensor de efeito Hall
        float rpm = tachometer();
        Serial.print("rpm: ");
        Serial.println(rpm);

    } else {
        analogWrite(MOTOR_PIN, 0); // Desliga o motor
    }
}
```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.

3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação

1. Observe o motor DC conectado ao circuito. O motor deve ligar e desligar conforme o botão do joystick é pressionado.

2. Movimente o joystick para controlar a velocidade do motor. A velocidade do motor deve variar proporcionalmente à posição do joystick.

3. Aproxime o sensor de efeito hall da trajetória dos imãs presos às hélices do motor. Observe a leitura de RPM no monitor serial.

#### Passo 4: Exploração

1. O tacômetro mede corretamente a velocidade de rotação do motor DC? A leitura de RPM é precisa e estável? Experimente variar a velocidade do motor e observe a resposta do tacômetro. Experimente também usar o dedo para desacelerar levemente o motor e observe a resposta do tacômetro.

2. Usamos 2 imãs para garantir a estabilidade da hélice, mas essa escolha pode afetar a leitura do sensor de efeito hall. Como o código deve ser adaptado para lidar com essa situação? Como o circuito poderia ser adaptado para garantir a leitura correta?

3. Você teve problemas ao ligar o motor? e ao desligar? Experimente ligar e desligar o motor múltiplas vezes, contando as tentativas que falharam. Busque uma justificativa para comandos mal correspondidos pelo código.

5. Como você poderia utilizar a leitura de RPM em um projeto prático? Quais aplicações poderiam se beneficiar desse tipo de medição sem contato?

---

### Conclusão

Neste roteiro, exploramos o controle de um motor DC com Arduino, utilizando um transistor de potência (TIP122) e a técnica de modulação por largura de pulso (PWM) para controlar a velocidade do motor com o auxílio de um joystick. Além disso, utilizamos um sensor de efeito Hall para medir a velocidade de rotação do motor, construindo um tacômetro.

### Referências para Consulta

2. [Arduino - AnalogWrite()](https://www.arduino.cc/reference/en/language/functions/analog-io/analogwrite/)
3. [Arduino - DigitalRead()](https://www.arduino.cc/reference/en/language/functions/digital-io/digitalread/)
4. [Arduino - Micros()](https://www.arduino.cc/reference/en/language/functions/time/micros/)
5. [Arduino - Map()](https://www.arduino.cc/reference/en/language/functions/math/map/)
6. [Arduino - Pull-up Resistors](https://www.arduino.cc/en/Tutorial/InputPullupSerial)
7. [Building Arduino Tachometer Using A3144 Hall Effect Sensor](https://www.makerguides.com/arduino-tachometer-a3144-hall-effect-sensor/)

### Sugestões de Leituras

- [Arduino Cookbook: Recipes to Begin, Expand, and Enhance Your Projects](https://www.amazon.com/Arduino-Cookbook-Michael-Margolis/dp/1449313876)
- [Encyclopedia of Electronic Components Volume 1: Resistors, Capacitors, Inductors, Switches, Encoders, Relays, Transistors](https://www.amazon.com/Encyclopedia-Electronic-Components-Resistors-Transistors/dp/1449333893)
- [Encyclopedia of Electronic Components Volume 2: LEDs, LCDs, Audio, Thyristors, Digital Logic, and Amplification](https://www.amazon.com/Encyclopedia-Electronic-Components-Thyristors-Amplification/dp/1449334180)
- [Encyclopedia of Electronic Components Volume 3: Sensors, LEDs, Audio, Thyristors, Digital Logic, and Amplification](https://www.amazon.com/Encyclopedia-Electronic-Components-Sensors-Amplification/dp/1449334318)
