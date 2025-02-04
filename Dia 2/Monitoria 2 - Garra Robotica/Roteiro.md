# Introdução à Eletrônica com Arduino

## Garra Robótica

### Descrição
Este roteiro de monitoria tem como objetivo explorar os conceitos de comunicação via luz infravermelha (IR, do inglês "Infra Red"), utilizados para a troca de dados entre dispositivos eletrônicos sem o uso de fios, em conjunto com a introdução ao controle de motores, aplicados à robótica. O projeto propõe compreender o funcionamento de um controle remoto e utilizá-lo para controlar uma garra robótica, promovendo uma integração prática entre teoria e aplicação na robótica.

### Objetivos
- Compreender os conceitos de comunicação infravermelha
- Introduzir conceitos de controle de motores e sua aplicação em robótica
- Promover a interação entre teoria e prática no desenvolvimento de sistemas automatizados.
- Operar a garra com o controle remoto

### Materiais Necessários

| Componente                           | Imagem                                                                                                      |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------|
| 1x Placa Arduino (Uno, Mega, ou similar) | <img src="https://d229kd5ey79jzj.cloudfront.net/1338/images/1338_2_X.png?20241107090313" height="100"> |
| 1x Cabo USB para conexão com o computador | <img src="https://m.media-amazon.com/images/I/5181PDv7RbL._AC_UF894,1000_QL80_.jpg" height="100"> |
| 1x LED vermelho | <img src="https://cdn.awsli.com.br/600x700/468/468162/produto/1941435412328b077d.jpg" height="100"> |
| 1x LED amarelo | <img src="https://techsuleletronicos.com.br/wp-content/uploads/2018/11/26d8d978af.png" height="100"> |
| 1x LED verde | <img src="https://cdn.awsli.com.br/600x700/468/468162/produto/19414355828b769476.jpg" height="100"> |
| 1x LED Receptor IR 5mm | <img src="https://cdn.awsli.com.br/600x700/95/95881/produto/249396787/ev1-2o6pppg0fy.png" height="100"> |
| 3x Resistor de 300 ohms | <img src="https://http2.mlstatic.com/D_NQ_NP_988873-MLB43270980270_082020-O.webp" height="100"> |
| 1x Resistor de 10k ohms | <img src="https://www.usinainfo.com.br/1017894-thickbox_default/resistor-10k-14w-kit-com-10-unidades.jpg" height="100"> |
| 1x Servo motor | <img src="https://cdn.awsli.com.br/600x450/463/463999/produto/19213618/4c079f22f7.jpg" height="100"> |
| 1x Controle Remoto IRRC | <img src="https://d229kd5ey79jzj.cloudfront.net/722/images/722_2_H.png?20240909162424" height="100"> |
| 1x Garra Robótica Ant | <img src="https://http2.mlstatic.com/D_802112-MLA81073960089_112024-C.jpg" height="100"> |
| Breadboard | <img src="https://cdn.awsli.com.br/600x700/1665/1665980/produto/11154566064a7523ad8.jpg" height="100"> |
| Jumpers | <img src="https://res.cloudinary.com/rsc/image/upload/b_rgb:FFFFFF,c_pad,dpr_1.0,f_auto,q_auto,w_700/c_pad,w_700/R2048241-01" height="100"> |

### Palavras-chave
Arduino, comunicação IR (infravermelha), controle remoto, controle de motores, automação, garra robótica.

---

## Metodologia

### Bloco 1: Controle Remoto e Comunicação IR
A comunicação IR, ou infravermelha, é uma tecnologia de comunicação sem fio comum, barata e fácil de usar. A luz IR é muito semelhante à luz visível, exceto que tem um comprimento de onda um pouco maior. Isso significa que o IR é indetectável ao olho humano - perfeito para comunicação sem fio. 

<p align="center">
  <img src="..\..\src\images\ComunicacaoIR.jpeg" height="300px" />
</p>

Um controle remoto é um dispositivo eletrônico usado para enviar comandos sem fio para outro dispositivo, como TVs, ar-condicionado, ou sistemas de som. Ele funciona geralmente por meio de sinais infravermelhos (IR).

<p align="center">
  <img src="https://d229kd5ey79jzj.cloudfront.net/722/images/722_1_H.png?20240909162424" height="300px" />
</p>

Neste bloco, utilizaremos o LED receptor IR de 5 mm (também chamado de fotorreceptor), conforme mostrado na imagem abaixo, para captar os sinais transmitidos pelo controle remoto, que contém o LED emissor. Esse componente funciona ao detectar raios infravermelhos, permitindo a passagem de corrente entre os seus pinos, chamados de "coletor" e "emissor". Podemos distinguir esses pinos pelo tamanho, como mostra a imagem abaixo: O emissor tem a perna mais longa, e o coletor, a mais curta. Dessa forma, torna-se possível receber os sinais transmitidos, e assim interpretar os comandos enviados e controlar dispositivos no circuito.

<p align="center">
  <img src="..\..\src\images\Fotorreceptor.jpeg" height="300px" />
</p>

#### Passo 1: Introdução ao Circuito
1. Conecte o pino coletor do fotoreceptor ao pino digital 11 do Arduino
2. Conecte o pino emissor do fotoreceptor ao GND do Arduino
3. Adicione um resistor 10k ohms entre o coletor e o VCC 

<p align="center">
  <img src="..\..\src\images\Monitoria 2\Diagrama1.png" height="300px" />
</p>

> ⚠ Atenção: O fotoreceptor tem polaridade, portanto se você ligar invertido o sistema não irá funcionar. Verifique quais pinos são o coletor e o emissor.

#### Passo 2: Programação
1. Instale a versão 2.6.1 da biblioteca "IRremote" no Arduino IDE. Para isso, abra o Library Manager, busque por "IRremote" e selecione a versão 2.6.1.
2. Abra o Arduino IDE e escreva o seguinte código:
    ```cpp
    #include "IRremote.h"
    int RECV_PIN = 11;
    IRrecv irrecv(RECV_PIN);
    decode_results results;

    void setup()
    {
        Serial.begin(9600);
        Serial.println("Enabling IRin");
        irrecv.enableIRIn(); 
        Serial.println("Enabled IRin");
    }

    void loop() {
        if (irrecv.decode(&results)) {
            Serial.println(results.value, HEX);
            irrecv.resume(); 
        }
        delay(100);
    }
    ```

O código acima é uma adaptação do exemplo IRrecvDemo presente na própria biblioteca. O código simplesmente recebe informações do fotoreceptor, que está ligado ao pino 11, e mostra no monitor serial seu código em formato Hexadecimal. 
3. Selecione a placa e a porta de conexão onde o Arduino está conectado.
4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação 
1. Abra o Serial Monitor na Arduino IDE.
2. Mire o controle para o fototransistor e aperte as teclas dele.
3. Faça uma tabela com as teclas do controle e seus respectivos valores

#### Passo 4: Exploração 
1. Até que distância o fotoreceptor consegue captar o sinal?
2. Experimente colocar objetos com diferentes níveis de transparência na frente do controle, como o plástico do próprio controle remoto ou a embalagem da bateria. Quais deles interferem no sinal?

---

### Bloco 2: Acendendo LEDs
Neste bloco, daremos continuidade ao que foi desenvolvido no bloco anterior, implementando uma programação condicional para controlar o estado de 3 LEDs (acender e apagar) com botões distintos. Para isso, utilizaremos os valores hexadecimais coletados no último bloco, associando cada botão a uma ação específica.

#### Passo 1: Introdução ao Circuito
1. Conecte o pino positivo do LED verde ao pino 10 do Arduino
2. Conecte o pino positivo do LED amarelo ao pino 9 do Arduino
3. Conecte o pino positivo do LED vermelho ao pino 8 do Arduino
4. Conecte o pino negativo de cada led ao GND do Arduino através de um resistor de 300 ohms.

<p align="center">
  <img src="..\..\src\images\Monitoria 2\Diagrama2.png" height="300px" />
</p>

#### Passo 2: Programação
1. Crie 3 variáveis para armazenar a porta de cada LED
2. Defina cada pino como saída no void setup()
3. Implemente condicionais no void loop() para alternar o nível lógico de cada LED (ligar ou desligar) com base no botão pressionado.

#### Passo 3: Observação
1. Manipule o nível lógico de cada LED usando o controle remoto
2. Experimente mudar quais botões ligam ou desligam os LEDs
3. Use alguns botões para ligar ou desligar mais de um LED
 
#### Passo 4: Exploração
1. Como o uso de PWM (Modulação por Largura de Pulso) pode criar uma transição suave no brilho dos LEDs? Experimente ajustar a intensidade de um LED, ao invés de simplesmente ligar/desligar.
2. Teste se é possível acender dois LEDs simultaneamente com a combinação de dois botões do controle remoto.
3. Tente fazer um botão ligar e desligar um mesmo LED

---

### Bloco 3: Garra Robótica
Uma garra robótica pode ser o último elemento de um braço robótico. Elas são frequentemente responsáveis pela execução das atividades do robô, como soldagem, movimentação de peças, fixação de circuitos integrados em placas, etc.

<p align="center">
  <img src="https://d229kd5ey79jzj.cloudfront.net/1080/images/1080_5_H.png?20241202161243" height="300px" />
</p>

As garras robóticas podem ser construídas de diversas maneiras, variando em quantidade de dedos e nos métodos utilizados para segurar objetos. Um exemplo dessa variação está nos modelos linear e pivotante. Na garra linear, os dedos se movimentam em linha reta para agarrar ou soltar o objeto. Já na garra pivotante, que será utilizada neste projeto, os dedos giram em torno de pontos fixos, proporcionando um movimento de pinça mais natural e eficiente.

<p align="center">
  <img src="https://d229kd5ey79jzj.cloudfront.net/1159/images/1159_2_X.png?20241207123639" height="300px" />
</p>

Neste bloco, exploraremos o funcionamento de uma garra robótica do tipo pivotante, cuja movimentação é controlada por um servo motor. Essa abordagem permitirá entender como os movimentos precisos e coordenados podem ser realizados para manipular objetos de forma eficiente.

#### Passo 1: Introdução ao Circuito
1. Usaremos o circuito do bloco 2 da aula 2 (servo)
2. Primeiro, usaremos apenas o servo para descobrir o limite de abertura e fechamento da garra
3. Depois, colocaremos a garra e faremos ela se movimentar automaticamente

<p align="center">
  <img src="..\..\src\images\Monitoria 2\Diagrama3.png" height="300px" />
</p>

#### Passo 2: Programação
1. Instale a biblioteca "Servo" no Arduino IDE. Para isso, abra o Library Manager e busque por "servo".
2. Abra o Arduino IDE e escreva o seguinte código:

  ```cpp
  #include <Servo.h> // Inclui a biblioteca Servo

  Servo myServo; // Cria um objeto Servo chamado myServo

  // Modifique as constantes abaixo para os limites de fechamento e abertura da garra
  const int CLOSE = 180; // Limite de fechamento do servo
  const int OPEN = 0; // Limite de abertura do servo

  void setup() {
    myServo.attach(9); // Associa o servo ao pino digital 9
    Serial.begin(9600);
  }

  void loop() {
    myServo.write(CLOSE); // Posição mínima
    delay(1000);
    myServo.write(OPEN); // Posição máxima
    delay(1000);
  }
  ```
> ⚠ Atenção: Não rode o código no Arduino com a garra acoplada antes de se certificar que os limites de fechamento e abertura estão corretos. Realizar o experimento com os limites errados pode danificar os componentes.

3. Selecione a placa e a porta de conexão onde o Arduino está conectado.
4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Observe as diferenças entre o código atual e o código base, usado no primeiro contato com o servo motor
2. Observe o movimento do servo e modifique os limites de fechamento e abertura para conseguirmos colocar a garra
3. Qual a importância de colocarmos esses limites?
4. Após modificar o código, coloque a garra no servo e a observe fechando e abrindo.

#### Passo 4: Exploração
1. O que acontece se os limites forem muito pequenos ou grandes? Como isso pode impactar o funcionamento da garra?
2. Como integrar diferentes tecnologias para expandir as funcionalidades da garra?
3. Como um sensor para monitorar a posição ou força aplicada pela garra pode melhorar seu controle e eficiência?

---

### Bloco 4: Controlando a Garra Com o Controle Remoto
Neste bloco, combinaremos os conhecimentos dos blocos 1 e 3 para controlar a abertura e fechamento da garra robótica utilizando o controle remoto. Essa integração permitirá a aplicação prática dos conceitos de comunicação IR e controle de motores.

#### Passo 1: Introdução ao Circuito
1. Combine as conexões dos blocos 1 e 3

<p align="center">
  <img src="..\..\src\images\Monitoria 2\Diagrama4.png" height="300px" />
</p>

#### Passo 2: Programação
1. No código do bloco 1:
  - Adicione a biblioteca do servo ```#include <Servo.h>``` e crie um objeto myServo ```Servo myServo;``` 
  - Crie as variáveis com o limite de fechamento ```const int CLOSE = 170;``` e abertura da garra ```const int OPEN = 90;```
  - Associe o servo ao seu pino digital ```myServo.attach(9);``` dentro do ```void setup()```
  - Crie condicionais para mover a garra no ```void loop()```, por exemplo, se apertar A ela abre e se apertar B ela fecha

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. A garra abre e fecha de acordo com os botões pressionados no controle remoto?
2. Experimente usar as setas para movimentar a garra gradativamente enquanto você estiver pressionando os botões

#### Passo 4: Exploração
1. Há algum atraso perceptível entre pressionar o botão e a ação da garra? O que poderia causar isso?
2. Quais ajustes no código ou no controle remoto seriam necessários para melhorar a eficiência da garra em aplicações reais?
3. O controle remoto permite ajustes suficientes para lidar com objetos variados?

---

### Conclusão
Este roteiro de monitoria apresentou uma abordagem prática e didática para explorar conceitos fundamentais de comunicação infravermelha e controle de motores, aplicados à robótica. Com atividades que integram teoria e prática, foi possível aprender a utilizar o controle remoto IR para operar uma garra robótica. O aprendizado proporcionado por este roteiro pode servir como base para projetos mais complexos, incentivando a criatividade e o aprofundamento na área de robótica e automação.

--- 

### Referências para Consulta
- [Documentação Oficial do Arduino](https://www.arduino.cc/en/Guide/HomePage )

- [Controle remoto](https://www.robocore.net/radio-frequencia-infravermelho/controle-remoto-infra-vermelho-irrc?srsltid=AfmBOoqkzNgAPTPbB6t3T_BMaYWlM64jwD97w7NLyqr5kuo8jq6QNp7l)   

- [Garra Robótica](https://d229kd5ey79jzj.cloudfront.net/1159/Desenho_Tecnico_Garra_ANT2_Medidas.PDF) 

- [Biblioteca Servo](https://docs.arduino.cc/libraries/servo/) 

### Sugestões de Leitura
- [Comunicação IR](https://learn.sparkfun.com/tutorials/ir-communication/all) 

- [Servo Motor](https://en.wikipedia.org/wiki/Servomotor)

- [Servos Explained](https://www.sparkfun.com/servos)

---
