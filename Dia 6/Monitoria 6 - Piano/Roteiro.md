# Introdução à Eletrônica com Arduino

## Piano 

### Descrição
Este roteiro de monitoria tem como objetivo integrar LEDs, botões e um buzzer para criar um piano eletrônico funcional, com a possibilidade de interagir com ele por meio do monitor serial. Essa atividade propõe uma abordagem criativa para explorar conceitos de eletrônica básica, como o uso de componentes interativos e a geração de sons, além de incentivar o desenvolvimento de habilidades práticas na programação e no manuseio de circuitos simples.

### Objetivos
- Manusear a frequência do buzzer para criar notas musicais
- Atribuir a cada botão e LED uma nota musical
- Interagir com o circuito pelo Monitor Serial
- Fazer com que os LEDs acendam enquanto a nota correspondente está sendo tocada.
- Tocar uma música

### Materiais Necessários
- 1x Placa Arduino + Cabo USB
- 1x Buzzer Passivo 5V
- 1x LED verde 5mm
- 1x LED amarelo 5mm
- 1x LED vermelho 5mm
- 3x Resistor 300Ω
- 3x Chave Momentânea (PushButton)
- 1x Protoboard
- Jumpers

### Palavras-chave
Arduino, LED, buzzer, botão, piano, monitor serial, notas musicais

---

## Metodologia

### Bloco 1: Notas Musicais no Buzzer
Quando a corda de um violão vibra, ela movimenta as moléculas de ar ao seu redor na mesma frequência de sua vibração. Essas oscilações no ar são captadas pelos nossos ouvidos, que as processam e as transformam em impulsos nervosos, permitindo que o cérebro interprete como som. De forma semelhante, quando um sinal elétrico é enviado ao transdutor piezoelétrico dentro de um buzzer, ele vibra em uma frequência específica, gerando o som desejado. Essas vibrações sonoras são amplificadas pela caixa do buzzer, aumentando sua intensidade e tornando o som perceptível ao ouvido humano. Neste bloco, faremos o buzzer tocar as 7 notas musicais básicas

#### Passo 1: Introdução ao Circuito
1. Conecte o pino positivo do buzzer ao pino 10 do Arduino
2. Conecte o pino negativo do buzzer ao terminal GND do Arduino

<p align="center">
  <img src="..\..\src\images\Monitoria 6\Diagrama1.png" height="300">
</p>

#### Passo 2: Programação
1. Crie 7 variáveis para armazenar as frequências de cada nota musical

| Notas | Frequências |
| ------------- | ------------- |
| Dó | 261,63 Hz |
| Ré | 293,66 Hz |
| Mi | 329,63 Hz |
| Fá | 349,23 Hz |
| Sol | 391,99 Hz |
| Lá | 440,00 Hz |
| Si | 493,88 Hz |

2. Faça o buzzer tocar cada uma por 1 segundo no void loop()
3. Selecione a placa e a porta de conexão onde o Arduino está conectado.
4. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Ouça o som emitido pelo buzzer. As notas estão sendo reproduzidas corretamente a cada segundo?

#### Passo 4: Exploração
1. Adicione frequências que não correspondam às notas musicais padrão e veja como elas soam. Essas frequências poderiam ser incorporadas em uma música?
2. Altere a ordem das notas musicais e sua duração, quais combinações soam mais agradáveis?

---

### Bloco 2: Botão + LED + Buzzer
Neste bloco, iremos expandir o circuito do bloco anterior integrando um botão e um LED. O objetivo é fazer com que o buzzer toque apenas quando o botão for pressionado, enquanto o LED será acionado simultaneamente, acendendo sempre que o buzzer estiver emitindo som. Dessa forma, combinamos interatividade e sinalização visual para tornar o circuito mais dinâmico e funcional.

#### Passo 1: Introdução ao Circuito
1. Conecte o pino da direita do botão ao pino 9 do Arduino e o pino da esquerda ao terminal GND
2. Conecte o pino negativo do LED ao terminal GND do Arduino e o positivo ao pino 13 através de um resistor de 300 ohms

<p align="center">
  <img src="..\..\src\images\Monitoria 6\Diagrama2.png" height="300">
</p>

#### Passo 2: Programação
1. Faça o buzzer tocar uma nota específica apenas quando o botão for pressionado 
2. Faça o LED acender quando o buzzer estiver emitindo som
3. Selecione a placa e a porta de conexão onde o Arduino está conectado.
4. Faça o upload do código para a placa Arduino.
	
#### Passo 3: Observação
1. Observe o circuito. O buzzer deve permanecer silencioso até que o botão seja pressionado.
2. Pressione o botão. O circuito se comporta conforme o esperado?

#### Passo 4: Exploração
1. O LED acende de forma sincronizada com o som? O comportamento do LED é adequado para indicar visualmente o funcionamento do buzzer?
2. Experimente trocar a nota do buzzer ou fazer com que o buzzer alterne as notas conforme o botão for pressionado
3. Qual efeito você nota ao pressionar o botão rapidamente? Como o LED e o buzzer trabalham juntos para representar esse ritmo?

---

### Bloco 3: Piano
Neste bloco, vamos expandir o circuito adicionando dois botões com seus respectivos LEDs, além de um potenciômetro que permitirá controlar o volume do som emitido pelo buzzer. Com essas melhorias, nosso piano eletrônico estará completo e pronto para oferecer uma experiência mais interativa e personalizável.

#### Passo 1: Introdução ao Circuito
1. Acrescente os botões, LEDs e potenciômetro da seguinte forma

<p align="center">
  <img src="..\..\src\images\Monitoria 6\Diagrama3.png" height="300">
</p>

#### Passo 2: Programação
1. Abra o Arduino IDE e faça as seguintes alterações no código do bloco anterior:
    - Crie constantes para armazenar os pinos dos LEDs e botões adicionados
    - No ```void setup()```: Defina os botões como entrada e os LEDs como saída
    - No ```void loop()```: Implemente condicionais para que, ao pressionar cada botão, o buzzer toque uma nota específica e o LED correspondente acenda:
        - Botão 1: toca a nota Dó e acende o LED verde.
        - Botão 2: toca a nota Ré e acende o LED amarelo.
        - Botão 3: toca a nota Mi e acende o LED vermelho.
2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Pressione os botões com as notas escolhidas, o buzzer e os LEDs se comportam conforme o esperado?
2. Teste o potenciômetro, ele aumenta e diminui o volume do buzzer?

#### Passo 4: Exploração 
1. Pesquise músicas possíveis de tocar com 3 acordes
2. Modifique as notas no código
3. Toque o piano

---

### Bloco 4: Passando uma música pelo monitor serial
A comunicação serial é um método utilizado para enviar e receber dados entre uma placa Arduino e um computador ou outros dispositivos. Todas as placas Arduino possuem, pelo menos, uma porta serial, que pode ser usada para esse tipo de comunicação. Neste bloco, vamos usar apenas o Arduino, o buzzer e o potenciômetro para transmitir uma música através do monitor serial. A música será representada por dois arrays: um contendo as notas musicais e outro com os tempos de cada nota. Esse processo permite que os dados sejam enviados em formato simples, facilitando a interação entre o Arduino e o monitor serial.

#### Passo 1: Introdução ao Circuito
1. Deixe apenas o buzzer e o botão 1 do circuito do bloco anterior

<p align="center">
  <img src="..\..\src\images\Monitoria 6\Diagrama4.png" height="300">
</p>

#### Passo 2: Programação
1. Abra o Arduino IDE e escreva o seguinte código:

    ```cpp
    const int pino_buzzer = 10; // pino onde o buzzer está conectado
    const int pino_botao = 7;
    const int tempo = 1000;

    // Inicializando variáveis globais
    int notas[50]; // Array para armazenar as notas
    int tempos[50]; // Array para armazenar os tempos
    int tamanho = 0, i;

    void setup() {
        pinMode(pino_botao, INPUT_PULLUP);
        pinMode(pino_buzzer, OUTPUT); // configura o pino com o buzzer como saída
        Serial.begin(9600); // Inicia a comunicação serial
        while (!Serial); // Aguarda a conexão serial

        Serial.println("Digite as notas e tempos via serial:");

        // Leitura das notas e tempos via Serial
        while (Serial.available() == 0) {
            // Aguardando o usuário enviar dados via Serial
        }

        // Leitura das notas
        if (Serial.available() > 0) {
            String notas_str = Serial.readStringUntil('\n'); // Lê as notas como uma string
            parseNotas(notas_str); // Função para processar as notas
        }

        // Leitura dos tempos
        while (Serial.available() == 0) {
            // Aguardando o usuário enviar os tempos
        }
        
        if (Serial.available() > 0) {
            String tempos_str = Serial.readStringUntil('\n'); // Lê os tempos como uma string
            parseTempos(tempos_str); // Função para processar os tempos
        }
    }

    void loop() {
        bool estado_botao = digitalRead(pino_botao);
        if (estado_botao == LOW) {
            for (i = 0; i < tamanho; i++) {
            if (notas[i] == 0) {
                noTone(pino_buzzer);
                delay(tempos[i]);
            }
            else {
                tone(pino_buzzer, notas[i]);
                delay(tempos[i]);
            }
            }
        }
    }

    // Função para processar as notas
    void parseNotas(String notas_str) {
        int j = 0;
        String nota = "";
        for (int i = 0; i < notas_str.length(); i++) {
            if (notas_str.charAt(i) == ',') {
            notas[j++] = getNota(nota); // Converte a nota para frequência
            nota = "";
            } else {
            nota += notas_str.charAt(i);
            }
        }
        // Adiciona a última nota
        if (nota != "") {
            notas[j] = getNota(nota);
        }
        tamanho = j + 1; // Definindo o tamanho do array
    }

    // Função para converter a string da nota para a frequência correspondente
    int getNota(String nota) {
        if (nota == "c") return 261;
        if (nota == "d") return 293;
        if (nota == "e") return 329;
        if (nota == "f") return 349;
        if (nota == "g") return 391;
        if (nota == "a") return 440;
        if (nota == "b") return 493;
        return 0; // Se não for uma nota válida, retorna 0 (pausa)
    }

    // Função para processar os tempos
    void parseTempos(String tempos_str) {
        int j = 0;
        String tempo_str = "";
        for (int i = 0; i < tempos_str.length(); i++) {
            if (tempos_str.charAt(i) == ',') {
            tempos[j++] = tempo / tempo_str.toInt(); // Converte tempo relativo
            tempo_str = "";
            } else {
            tempo_str += tempos_str.charAt(i);
            }
        }
        // Adiciona o último tempo
        if (tempo_str != "") {
            tempos[j] = tempo / tempo_str.toInt();
        }
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

#### Passo 3: Observação
1. Abra o Monitor Serial no Arduino IDE

#### Passo 4: Exploração
1. Copie e cole o seguinte exemplo de notas e tempos:
    - Notas: c,d,e,g,g,e,f,f,0,c,d,e,g,g,f,e,0,c,c,d,e,g,0,g,f,e,c,f,0,f,e,d,d,e,0,d,d,c,c,0
    - Tempos: 4,4,2,2,2,2,2,2,2,4,4,2,2,2,2,1,4,4,4,4,2,2,4,4,4,4,2,2,4,4,4,4,2,2,4,4,4,4,1,6
2. Qual música foi tocada?
3. Experimente mudar as notas e tempos para tocar uma outra música

--- 

### Conclusão
Este roteiro de monitoria permitiu a criação de um piano eletrônico interativo usando Arduino, LEDs, botões, buzzer e potenciômetro. Através da manipulação de frequências e tempos, foi possível aprender conceitos de eletrônica básica, programação e comunicação serial. O uso do monitor serial para controlar notas e tempos facilitou a interação com o circuito, enquanto a adição de componentes como o potenciômetro e LEDs tornaram a experiência mais dinâmica.

---

### Referências para Consulta
- [Documentação Oficial do Arduino](https://www.arduino.cc/en/Guide/HomePage) 

- [Função Serial.read()](https://docs.arduino.cc/language-reference/pt/funções/communication/serial/read/) 

- [PWM](https://learn.sparkfun.com/tutorials/pulse-width-modulation/all) 

### Sugestões de Leitura
- [Potenciometer](https://en.wikipedia.org/wiki/Potentiometer) 

- [Comunicação Serial](https://docs.arduino.cc/language-reference/pt/funções/communication/serial/) 

- [Arduino Cookbook](https://www.amazon.com/Arduino-Cookbook-Michael-Margolis/dp/1449313876) 

- [Notas musicais no buzzer](https://raullesteves.medium.com/notas-musicais-no-buzzer-do-arduino-1fea7813ba6e) 

---
