# Introdução à Eletrônica com Arduino

## Dado Eletrônico

### Descrição
Este roteiro de monitoria tem como objetivo apresentar os conceitos fundamentais de números binários e circuitos integrados, aplicados ao uso do displays de 7 segmentos. O projeto consiste em desenvolver um dado eletrônico com 8 "faces", utilizando um display de 7 segmentos, um circuito integrado (CI) 4511 e um botão para interação. A atividade busca combinar teoria e prática, promovendo o entendimento dos princípios digitais e sua aplicação em circuitos eletrônicos.

### Objetivos
- Compreender os conceitos básicos de números binários e sua relevância para a eletrônica digital.
- Entender o princípio de funcionamento de circuitos integrados e sua aplicação prática.
- Aprender a controlar um display de 7 segmentos utilizando um decodificador 4511.
- Construir um dado eletrônico.

### Materiais Necessários
- Placa Arduino 
- Cabo USB
- Display de 7 Segmentos
- Circuito Integrado 4511
- 1x Resistor 300Ω
- 1x Chave Momentânea
- Protoboard
- Jumpers

### Palavras–chave
Arduino, Circuito Integrado, Display de 7 Segmentos, CI 4511, Dado Eletrônico, Eletrônica Digital.

---

## Metodologia

### Bloco 1: Display de 7 Segmentos

Um display de sete segmentos, como seu nome indica, é composto por sete LEDs individuais, chamados de segmentos, organizados em forma de "8". Esses segmentos são rotulados de a a g, e acendendo combinações específicas deles, é possível formar números de 0 a 9 e algumas letras ou símbolos. 

<p align="center">
  <img src="..\..\src\images\7SegmentDisplay.png" width="300">
</p>

Os displays de 7 segmentos continuam sendo populares devido à sua simplicidade e eficiência. Embora limitados em capacidade gráfica, são ideais para exibir números e informações básicas de forma clara e direta. Eles são amplamente usados ​​em relógios digitais, medidores eletrônicos, calculadoras básicas e outros dispositivos eletrônicos que exibem informações numéricas. 

<p align="center">
  <img src="..\..\src\images\7SegmentDisplayExample.png" width="300">
</p>

Nesse bloco, vamos explorar o funcionamento de um display de 7 segmentos e controlar cada segmento individualmente para fazer um contador com o Arduino.

### Passo 1: Introdução ao Circuito

1. Conecte o display de 7 segmentos ao arduino conforme o esquemático abaixo, se atente ao resistor de 300 ohms no pino catodo do display:

<p align="center">
  <img src="..\..\src\images\Monitoria 1\Diagram1.png" width="300">
</p>

### Passo 2: Programação
1. Abra o Arduino IDE e escreva o seguinte código: 
    ```cpp
    // pinos onde cada um dos segmentos estão conectados:
    const int pino_a = 12; 
    const int pino_b = 11; 
    const int pino_c = 10; 
    const int pino_d = 9; 
    const int pino_e = 8; 
    const int pino_f = 6; 
    const int pino_g = 7; 

    void setup() {
    // configura os pinos de cada segmento como saída:
    pinMode(pino_a, OUTPUT);
    pinMode(pino_b, OUTPUT);
    pinMode(pino_c, OUTPUT);
    pinMode(pino_d, OUTPUT);
    pinMode(pino_e, OUTPUT);
    pinMode(pino_f, OUTPUT);
    pinMode(pino_g, OUTPUT);
    }

    void loop() {
    // acende os segmentos necessários para formar o número 0 (zero):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, HIGH);
    digitalWrite(pino_e, HIGH);
    digitalWrite(pino_f, HIGH);
    digitalWrite(pino_g, LOW);
    delay(1000); // aguarda 1 segundo
    
    // acende os segmentos necessários para formar o número 1 (um):
    digitalWrite(pino_a, LOW);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, LOW);
    digitalWrite(pino_e, LOW);
    digitalWrite(pino_f, LOW);
    digitalWrite(pino_g, LOW);
    delay(1000); // aguarda 1 segundo

    // acende os segmentos necessários para formar o número 2 (dois):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, LOW);
    digitalWrite(pino_d, HIGH);
    digitalWrite(pino_e, HIGH);
    digitalWrite(pino_f, LOW);
    digitalWrite(pino_g, HIGH);
    delay(1000); // aguarda 1 segundo

    // acende os segmentos necessários para formar o número 3 (três):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, HIGH);
    digitalWrite(pino_e, LOW);
    digitalWrite(pino_f, LOW);
    digitalWrite(pino_g, HIGH);
    delay(1000); // aguarda 1 segundo

    // acende os segmentos necessários para formar o número 4 (quatro):
    digitalWrite(pino_a, LOW);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, LOW);
    digitalWrite(pino_e, LOW);
    digitalWrite(pino_f, HIGH);
    digitalWrite(pino_g, HIGH);
    delay(1000); // aguarda 1 segundo

    // acende os segmentos necessários para formar o número 5 (cinco):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, LOW);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, HIGH);
    digitalWrite(pino_e, LOW);
    digitalWrite(pino_f, HIGH);
    digitalWrite(pino_g, HIGH);
    delay(1000); // aguarda 1 segundo

    // acende os segmentos necessários para formar o número 6 (seis):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, LOW);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, HIGH);
    digitalWrite(pino_e, HIGH);
    digitalWrite(pino_f, HIGH);
    digitalWrite(pino_g, HIGH);
    delay(1000); // aguarda 1 segundo

    // acende os segmentos necessários para formar o número 7 (sete):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, LOW);
    digitalWrite(pino_e, LOW);
    digitalWrite(pino_f, LOW);
    digitalWrite(pino_g, LOW);
    delay(1000); // aguarda 1 segundo

    // acende os segmentos necessários para formar o número 8 (oito):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, HIGH);
    digitalWrite(pino_e, HIGH);
    digitalWrite(pino_f, HIGH);
    digitalWrite(pino_g, HIGH);
    delay(1000); // aguarda 1 segundo

    // acende os segmentos necessários para formar o número 9 (nove):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, HIGH);
    digitalWrite(pino_e, LOW);
    digitalWrite(pino_f, HIGH);
    digitalWrite(pino_g, HIGH);
    delay(1000); // aguarda 1 segundo
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

### Passo 3: Observação
1. Observe o display de 7 segmentos conforme o código é executado. Ele deve exibir os números de 0 a 9 com um delay de 1 segundo a cada iteração do void loop().
2. Além de números, quais letras são possíveis de exibir no display?

### Passo 4: Exploração
1. Adicione 2 possíveis letras no código após a sequência que exibe o número 9. Você pode fazer isso manipulando o nível lógico de cada segmento conforme o esquemático do display.
2. As letras foram exibidas corretamente? O que acontece se apenas colocarmos o nível lógico alto nos segmentos que queremos ligados?


### Bloco 2: Circuito Integrado 4511
Em eletrônica, um circuito integrado, microchip, chip e nano chip (do inglês, microchip, chip, nanochip), abreviadamente CI, é um circuito eletrônico miniaturizado (composto principalmente por dispositivos semicondutores) sobre um substrato fino de material semicondutor. Os circuitos integrados são usados em quase todos os equipamentos eletrônicos usados hoje e revolucionaram o mundo da eletrônica.

<p align="center">
  <img src="https://d229kd5ey79jzj.cloudfront.net/565/images/565_1_H.png?20241122172420" height="300px" />
</p>

O 4511 é um circuito integrado (CI) decodificador de display BCD (Binary Coded Decimal, ou Decimal Codificado em Binário) para um display de 7 segmentos de catodo comum. Ele é comumente usado em projetos eletrônicos para exibir números de 0 a 9 em um display de 7 segmentos. 

<p align="center">
  <img src="https://www.build-electronic-circuits.com/wp-content/uploads/2020/08/4511_Pinout-white.png" height="300px" />
</p>

Neste bloco, será feita uma introdução aos números binários para facilitar a compreensão do funcionamento do CI 4511. Em seguida, o circuito anterior será aprimorado com a implementação desse componente, destacando sua aplicação prática.

### Passo 1: Introdução ao circuito
1. Antes de integrar o CI 4511 ao circuito, recomendamos acessar o link https://encr.pw/JXbg4 para uma compreensão mais aprofundada sobre como este circuito integrado realiza a decodificação de números binários para o display de 7 segmentos. A tabela abaixo ilustra como o chip interpreta cada número inserido em suas entradas.

| Número em Binário | Número em Decimal |
| ------------- | ------------- |
| 0000  | 0  |
| 0001  | 1  |
| 0010  | 2  |
| 0011  | 3  |
| 0100  | 4  |
| 0101  | 5  |
| 0110  | 6  |
| 0111  | 7  |
| 1000  | 8  |
| 1001  | 9  |

2. Conecte o CI 4511 e o display de 7 segmentos ao arduino conforme o esquemático abaixo. Atente-se à depressão em forma de meia lua na extremidade inferior do CI, a partir dela podemos identificar quais são seus pinos:

<p align="center">
  <img src="..\..\src\images\Monitoria 1\Diagram2.png" height="300px" />
</p>

> ⚠ ATENÇÃO: Fique muito atento à ligação do circuito integrado. Se ligar um fio errado, isso pode danificar o componente de tal forma que pode queimá-lo e deixá-lo inutilizável!

### Passo 2: Programação
1. Abra o Arduino IDE e escreva o seguinte código:

    ```cpp
    // pinos onde cada um dos bits estão conectados:
    const int pino_a = 12; 
    const int pino_b = 9; 
    const int pino_c = 10; 
    const int pino_d = 11; 

    void setup() {
    // configura os pinos de cada bit como saída:
    pinMode(pino_a, OUTPUT);
    pinMode(pino_b, OUTPUT);
    pinMode(pino_c, OUTPUT);
    pinMode(pino_d, OUTPUT);
    }

    void loop() {
    // aciona os bits de modo a formar o número 0000 = 0 (zero):
    digitalWrite(pino_a, LOW);
    digitalWrite(pino_b, LOW);
    digitalWrite(pino_c, LOW);
    digitalWrite(pino_d, LOW);
    delay(1000); // aguarda 1 segundo
    
    // aciona os bits de modo a formar o número 0001 = 1 (um):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, LOW);
    digitalWrite(pino_c, LOW);
    digitalWrite(pino_d, LOW);
    delay(1000); // aguarda 1 segundo

    // aciona os bits de modo a formar o número 0010 = 2 (dois):
    digitalWrite(pino_a, LOW);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, LOW);
    digitalWrite(pino_d, LOW);
    delay(1000); // aguarda 1 segundo

    // aciona os bits de modo a formar o número 0011 = 3 (três):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, LOW);
    digitalWrite(pino_d, LOW);
    delay(1000); // aguarda 1 segundo

    // aciona os bits de modo a formar o número 0100 = 4 (quatro):
    digitalWrite(pino_a, LOW);
    digitalWrite(pino_b, LOW);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, LOW);
    delay(1000); // aguarda 1 segundo

    // aciona os bits de modo a formar o número 0101 = 5 (cinco):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, LOW);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, LOW);
    delay(1000); // aguarda 1 segundo

    // aciona os bits de modo a formar o número 0110 = 6 (seis):
    digitalWrite(pino_a, LOW);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, LOW);
    delay(1000); // aguarda 1 segundo

    // aciona os bits de modo a formar o número 0111 = 7 (sete):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, HIGH);
    digitalWrite(pino_c, HIGH);
    digitalWrite(pino_d, LOW);
    delay(1000); // aguarda 1 segundo

    // aciona os bits de modo a formar o número 1000 = 8 (oito):
    digitalWrite(pino_a, LOW);
    digitalWrite(pino_b, LOW);
    digitalWrite(pino_c, LOW);
    digitalWrite(pino_d, HIGH);
    delay(1000); // aguarda 1 segundo

    // aciona os bits de modo a formar o número 1001 = 9 (nove):
    digitalWrite(pino_a, HIGH);
    digitalWrite(pino_b, LOW);
    digitalWrite(pino_c, LOW);
    digitalWrite(pino_d, HIGH);
    delay(1000); // aguarda 1 segundo
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado.
3. Faça o upload do código para a placa Arduino.

### Passo 3: Observação
1. O display deve se comportar da mesma forma, fazendo uma contagem de 0 a 9 a cada iteração do void loop
Observe que diminuímos a quantidade de entradas/saídas usadas no Arduino e ganhamos mais espaço na memória do microcontrolador.
 
### Passo 4: Exploração
1. É possível exibir letras no display de 7 segmentos usando o CI 4511?
2. 4 bits são o suficiente para contar até 15, o que acontece se passarmos números maiores que 9 para o CI 4511 decodificar para o display?


### Bloco 3: Contador com um botão
Neste bloco, vamos adicionar um botão ao circuito desenvolvido anteriormente e ajustar o código para que o display de 7 segmentos incremente o valor exibido apenas quando o botão for pressionado. O contador exibirá valores de 0 a 9 e será reiniciado automaticamente para 0 ao atingir o número 9, criando o mesmo ciclo contínuo dos blocos anteriores.

### Passo 1: Introdução ao circuito
1. Mantenha as conexões do CI 4511 e do display de 7 segmentos ao Arduino conforme os blocos anteriores.
2. Conecte o botão ao Arduino conforme o esquemático abaixo: 

<p align="center">
  <img src="..\..\src\images\Monitoria 1\Diagram3.png" height="300px" />
</p>

### Passo 2: Programação
1. Crie uma variável para ser o contador
2. Defina o pino do botão como entrada no void setup() 
3. Faça uma verificação se o botão foi apertado e incremente a variável do contador
4. Exiba os números no display de acordo com a variável do contador. Caso a variável do contador passe de 9, ela deve ser igualada a 0.

### Passo 3: Observação
1. Incremente a variável pressionando o botão, o número exibido no display está correto?
2. Quando a variável chega a 9 e você pressiona o botão, o display exibe o número 0?

### Passo 4: Exploração
1. Se você mantiver o botão pressionado, ele incrementa a variável apenas uma vez?
2. O que acontece se tirarmos o botão e ligarmos seus fios?
3. Experimente mudar o incremento ou deixar a contagem decrescente
4. Experimente mudar a conexão dos pinos do botão, o circuito continua funcionando como o esperado?


### Bloco 4: Dado Eletrônico
Neste bloco, utilizaremos o circuito dos blocos anteriores para montar um dado eletrônico. Em vez de simplesmente incrementar uma variável, o botão será usado para "lançar" um dado de 8 faces, exibindo um número aleatório entre 1 e 8 no display de 7 segmentos.

### Passo 1: Introdução ao Circuito
1. Usaremos o mesmo circuito do bloco 3

### Passo 2: Programação
1. Mude a variável do contador para resultado
2. Ao invés de incrementar a variável, atribua ela um valor aleatório de 1 a 8 usando random(1,9)
3. Ao invés de usar ```if``` para as verificações, experimente usar o [switch...case](https://www.arduino.cc/reference/cs/language/structure/control-structure/switchcase/) 

### Passo 3: Observação
1. O display deve exibir um número aleatório a cada vez que o botão for pressionado
2. O dado aparenta estar viciado? Como você modificaria o código para ele favorecer a um número específico?
3. Como você adaptaria o circuito para exibir dados com mais de 8 faces?

### Passo 4: Exploração
1. Experimente fazer dados com outras quantidades de faces
2. O que acontece se você mantiver o botão pressionado? 
3. É possível fazer o display exibir números aleatórios e só parar enquanto o botão estiver sendo pressionado?
4. Tente fazer o dado favorecer um dos lados do dado

---

### Conclusão 
Esta monitoria apresentou o funcionamento de displays de 7 segmentos e circuitos integrados, começando com o controle direto dos segmentos pelo Arduino, seguido pela introdução do CI 4511 para simplificar o circuito. A implementação de um botão para gerar números aleatórios e exibi-los no display permitiu compreender como conceitos de eletrônica digital e programação podem ser aplicados para criar dispositivos interativos e eficientes.

--- 

### Referências para Consulta

- [Documentação Oficial do Arduino](https://www.arduino.cc/en/Guide/HomePage)
- [Datasheet CI4511](https://d229kd5ey79jzj.cloudfront.net/565/cd4511b.pdf) 
- [Função Random](https://docs.arduino.cc/language-reference/en/functions/random-numbers/random/) 

### Sugestões de Leitura

- [Seven-segment display](https://en.wikipedia.org/wiki/Seven-segment_display)
- [Serial 7-Segment Display](https://learn.sparkfun.com/tutorials/using-the-serial-7-segment-display/all) 
- [Probabilidade](https://en.wikipedia.org/wiki/Probability) 