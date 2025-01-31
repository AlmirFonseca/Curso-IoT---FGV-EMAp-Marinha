# Introdução à Eletrônica com Arduino

## Web Monitor

### Descrição
Este roteiro de monitoria tem como objetivo apresentar a transferência de informações do monitor serial da Arduino IDE para uma página web, utilizando o módulo ESP8266 em sua função de servidor web (web server). Além disso, será feita uma introdução ao Blynk, um aplicativo que emprega um protocolo próprio baseado no Protocolo de Controle de Transmissão (TCP), que permite a troca de mensagens entre dispositivos de computação, permitindo leitura e atuação com resposta praticamente instantânea. 

### Objetivos
- Entender o funcionamento do módulo ESP8266 e suas principais aplicações.
- Aprender os conceitos básicos de servidores web e sua implementação.
- Explorar os fundamentos da plataforma Blynk e suas funcionalidades.
- Desenvolver um dashboard no Blynk capaz de controlar o LED interno da placa, permitindo acendê-lo e apagá-lo remotamente.

### Materiais Necessários
- 1x Placa Arduino + Cabo USB
- 1x Protoboard
- 1x Módulo WiFi ESP8266
- 1x Adaptador para ESP8266
- 1x Módulo Relé
- 1x Potenciômetro 10k
- Jumpers

### Palavras-chave
Arduino, ESP8266, Servidor web, Protocolo TCP, Blynk, Monitoramento online

---

## Metodologia

### Bloco 1: ESP8266
O ESP8266 é um microcontrolador Wi-Fi de baixo custo, com software de rede TCP/IP integrado e capacidade de microcontrolador. Este pequeno módulo permite que microcontroladores se conectem a uma rede Wi-Fi e façam conexões TCP/IP simples usando comandos no estilo Hayes.

<p align="center">
  <img src="https://d229kd5ey79jzj.cloudfront.net/652/images/652_1_H.png" height="300">
</p>

Neste bloco, iniciaremos a comunicação com o módulo ESP8266. Primeiro, precisamos "chamar sua atenção" enviando o comando AT. Quando o módulo recebe esse comando, ele responde com um simples OK, indicando que está pronto para se comunicar. A partir desse ponto, podemos enviar outros comandos para interagir com o módulo. Esse AT faz parte de um conjunto específico de instruções conhecidas como comandos AT, que são amplamente utilizados para configurar e controlar dispositivos como o ESP8266.

#### Passo 1: Introdução ao Circuito
1. Conecte o ESP8266 no adaptador
2. Conecte o pino TXH do esp ao pino 10 do Arduino
3. Conecte o pino RXH do esp ao pino 11 do Arduino
4. Conecte o pino GND do esp ao terminal GND do Arduino
5. Conecte o pino VIN do esp ao terminal 5V do Arduino

<p align="center">
  <img src="..\..\src\images\Monitoria 5\Diagrama1.png" height="300">
</p>

#### Passo 2: Programação
1. Abra o Arduino IDE e escreva o seguinte código:

    ```cpp
    #include "SoftwareSerial.h"

    SoftwareSerial ESP_Serial(10, 11); // RX, TX, respectivamente, da placa Arduino

    void setup(){
        Serial.begin(9600);
        ESP_Serial.begin(9600);
    }

    void loop(){
        if (ESP_Serial.available()){
            Serial.write(ESP_Serial.read());
        }
        if (Serial.available()){
            ESP_Serial.write(Serial.read());
        }
    }
    ```

2. Selecione a placa e a porta de conexão onde o Arduino está conectado
3. Faça o upload do código para a placa Arduino

#### Passo 3: Observação
1. Abra o Serial Monitor no Arduino IDE

#### Passo 4: Exploração
1. Digite, no campo superior do monitor serial, AT e envie. O que o módulo retorna? Se ao enviar AT você não ver nada no monitor, desconecte a placa e refaça todas as ligações
2. Usando o [Set de Comandos AT](https://s3-sa-east-1.amazonaws.com/robocore-lojavirtual/652/Simple-AT-commands-ESP8266.pdf), faça perguntas ao módulo. O que ele responde?
3. Faça o módulo listar as redes Wi-Fi disponíveis por perto. Caso você receba uma mensagem de erro, mude o modo de operação do módulo para 1 usando o comando AT+CWMODE=1 e tente novamente
4. Usando o set de comandos AT, conecte-se à rede “MONITORIA” cuja senha é 12345678.

---

### Bloco 2: Web Monitor
Neste bloco, utilizaremos o módulo ESP8266 como servidor web. O módulo será conectado à rede Wi-Fi local e, ao acessarmos seu endereço IP, será possível visualizar em tempo real o valor de um pino analógico. Em vez de enviar os comandos AT manualmente pelo monitor serial, esses comandos serão enviados diretamente por meio do código programado no Arduino, automatizando a comunicação com o módulo ESP8266.

#### Passo 1: Introdução ao Circuito
1. Inclua um potenciômetro 10k ao circuito do bloco anterior, com o primeiro pino no GND, o segundo no A0 e o terceiro no 5V

<p align="center">
  <img src="..\..\src\images\Monitoria 5\Diagrama2.png" height="300">
</p>

#### Passo 2: Perguntando com ESP_Serial.println()
1. Abra o Arduino IDE e escreva o seguinte código:

    ```cpp
    #include "SoftwareSerial.h"

    SoftwareSerial ESP_Serial(10, 11); // RX, TX

    String resposta = "";
    
    void setup() {
        Serial.begin(9600);
        ESP_Serial.begin(9600);

        Serial.println("Inicializando...");
        delay(1000);

        Serial.println("Chamando atencao do modulo com AT...");
        sendCommand("AT");
        readResponse(1000);

        Serial.println("Mudando o modo com CWMODE=1...");
        sendCommand("AT+CWMODE=1");
        readResponse(1000);

        Serial.println("Verificando redes WiFi disponiveis com CWLAP...");
        sendCommand("AT+CWLAP");
        readResponse(7500);
    }

    void loop() {
    // por enquanto nao precisamos de nada aqui.

    }

    void sendCommand(String cmd) {
        ESP_Serial.println(cmd);
        }

        void readResponse(unsigned int timeout) {
        unsigned long timeIn = millis();
        resposta = "";
        while (timeIn + timeout > millis()) {
            if (ESP_Serial.available()) {
            char c = ESP_Serial.read();
            resposta += c;
            }
        }
        Serial.println(resposta);
    }
    ```
2. Selecione a placa e a porta de conexão onde o Arduino está conectado
3. Faça o upload do código para a placa Arduino
4. Abra o Monitor Serial do Arduino IDE. Deve aparecer algo parecido com o que foi feito na exploração do bloco anterior,  mas sem a necessidade de conversar com o módulo.

#### Passo 3: Conectando-se a rede e descobrindo o IP  
 
1. Faça alterações no código para se conectar a rede desejada sem precisar conversar com o módulo:

    ```cpp
    ...
    // Substitua os valores das variáveis abaixo pelo nome da rede e senha que usaremos
    String rede = "SUA-REDE-WIFI-AQUI"; 
    String senha = "SUA-SENHA-AQUI";
    ...
    void setup(){
        ...
        // Substitua a mudança de modo e a verificação de redes disponíveis pelas linhas abaixo 
        Serial.println("Conectando a rede...");
        String CWJAP = "\"AT+CWJAP=\"";
        CWJAP += rede;
        CWJAP += "\",\"";
        CWJAP += senha;
        CWJAP += "\"";
        sendCommand(CWJAP);
        readResponse(10000);

        delay(2000); //espera de seguranca

        if (resposta.indexOf("OK") == -1) { //procura na resposta se houve OK
            Serial.println("Atencao: Nao foi possivel conectar a rede WiFi.");
            Serial.println("Verifique se o nome da rede e senha foram preenchidos corretamente no codigo e tente novamente.");
        } else {
            Serial.println("Sucesso! Conectado a rede WiFi.");
        }
    }
    ...
    ```
2. Depois do passo anterior, dê upload no Arduino e abra o monitor serial novamente. O que aparece?
3. Assim que o módulo estiver conectado à internet, use o set de comandos AT para descobrir o IP do módulo na rede.
4.  Realize as seguintes alterações no código para configurar o módulo ESP8266 e criar uma página web acessível por meio do endereço IP do módulo:

    ```cpp
    ...
    void setup(){
        ...
        // troque o else do final do setup anterior pelas linhas abaixo 
        } else{ 
            Serial.println("Obtendo endereco de IP na rede...");
            sendCommand("AT+CIFSR");
            readResponse(1000);

            Serial.println("Configurando para multiplas conexoes...");
            sendCommand("AT+CIPMUX=1");
            readResponse(1000);

            Serial.println("Ligando servidor...");
            sendCommand("AT+CIPSERVER=1,80");
            readResponse(1000);

            Serial.print("Pronto, acesse o IP atraves de um dispositivo ligado na mesma rede do ESP8266.");
        }
    }

    void loop(){
        if (ESP_Serial.available()) {
            //.find le os dados vindos da serial ate o alvo, neste caso +IPD,
            if (ESP_Serial.find("+IPD,")) {
                delay(500);
                char id = ESP_Serial.peek();//pega ID da conexao
                
                //nossa pagina web em HTML
                String webpage = String("HTTP/1.1 200 OK\r\n") +
                                    "Content-Type: text/html\r\n" +
                                    "Connection: close\r\n" +
                                    "\r\n" +
                                    "<!DOCTYPE HTML>" +
                                    "<html>" +
                                    "<h1>" +
                                    "Ola Mundo!" +
                                    "</h1></html>" +
                                    "\r\n";

                String cipSend = "AT+CIPSEND=";
                cipSend += (int(id) - 48);
                cipSend += ",";
                cipSend += webpage.length();
                Serial.println(webpage.length());
                sendCommand(cipSend);
                readResponse(500);

                sendCommand(webpage);
                readResponse(750);

                String closeCommand = "AT+CIPCLOSE=";
                closeCommand += (int(id) - 48);
                sendCommand(closeCommand);
                readResponse(750);
            }
        }
    }
    ```
5. Troque as linhas com:

    ```cpp
    String webpage = String("HTTP/1.1 200 OK\r\n") +
                       "Content-Type: text/html\r\n" +
                       "Connection: close\r\n" +
                       "\r\n" +
                       "<html style=\"font-size:15em\">" +
                       analogRead(A0) + 
                       "</html>";
    ```

    por:

    ```cpp
    webpage = String("HTTP/1.1 200 OK\r\n") +
                "Content-Type: text/html\r\n" +
                "Connection: close\r\n" +
                "Refresh: 8\r\n" +
                "\r\n" +
                "<html style=\"font-size:15em\">" +
                analogRead(A0) +
                "</html>";
    ```

    para exibir o valor lido pelo potenciômetro na página web

---

### Bloco 3: Dashboard com Blynk
Até o momento, enfrentamos diversas limitações relacionadas à memória e à comunicação entre as placas. Uma solução eficiente para aproveitar ao máximo o potencial de uma placa da tecnologia Arduino, especialmente no que diz respeito à quantidade de portas, é enviar todos os dados para um servidor centralizado. A partir desse servidor, um aplicativo pode buscar os dados e exibi-los na tela de forma prática. Para isso, neste bloco, utilizaremos o aplicativo Blynk, que emprega um protocolo proprietário baseado em TCP, oferecendo respostas de leitura e controle quase instantâneas.

#### Passo 1: Criar o Template
1. Acesse o site do Blynk: Vá para https://blynk.io/ para criar uma conta e configurar o seu projeto.
2. Criação do projeto: Após criar sua conta, você verá uma tela de Quick Start. Como iremos criar um projeto do zero, clique no botão "Pular" para ignorar este assistente.
3. Criar um novo modelo:
    - Na tela inicial, clique em "+ Novo Template".
    - Na página de criação do template:
        - Dê um nome ao projeto.
        - No campo HARDWARE, selecione Arduino.
        - No campo TIPO DE CONEXÃO, selecione WiFi.
    - Após configurar, clique no botão "Concluído".
4. Adicionar um Datastream:
    - No menu lateral, clique em "Datastreams", depois clique no botão "+ Novo Datastream" e selecione "Pino Virtual".
    - Configuração do Datastream:
        - Dê um nome descritivo (ex.: "Controle de LED").
        - No campo PIN, selecione V1.
        - No campo TIPO DE DADOS, escolha Inteiro.
    - Deixe os demais campos no padrão e clique em "Criar" para finalizar.
5. Configurar o Web Dashboard:
    - Clique em "Painel de controle da Web" no menu lateral.
    - Arraste o widget "Interruptor" para o painel de controle.
    - Passe o mouse sobre o widget e clique no ícone de engrenagem.
    - No campo Datastream, selecione o Datastream criado anteriormente (ex.: "Controle de LED") e clique em "Salvar".
6. Criar o dispositivo:
    - Clique no ícone de cubo na barra lateral esquerda.
    - Clique em "+ Novo Dispositivo" e escolha a opção "A partir do modelo".
    - No campo MODELO, selecione o template que você criou.
    - No campo NOME DO DISPOSITIVO	, insira "ESP8266".

#### Passo 2: Introdução ao Circuito
Usaremos o mesmo circuito do bloco anterior

#### Passo 3: Programação
1. Instale a biblioteca "Blynk" no Arduino IDE. Para isso, abra o Library Manager e busque por "blynk".
2. Abra o Arduino IDE e escreva o seguinte código:

    ```cpp
    //Declaracao dos parametros de conexao do aplicativo
    //Alterar os codigos abaixo de acordo com o que foi gerado na plataforma
    #define BLYNK_TEMPLATE_ID "TMPL20Khy1jIj"
    #define BLYNK_TEMPLATE_NAME "Teste"
    #define BLYNK_AUTH_TOKEN "0WSmyMuTJPtt8kjnlruyPDQ4sEcN0apg"

    //Definicao do monitoramento de conexao da placa pela serial
    #define BLYNK_PRINT Serial

    //Adicao das bibliotecas
    #include <ESP8266_Lib.h>
    #include <BlynkSimpleShieldEsp8266.h>
    #include <SoftwareSerial.h>

    //Declaracao da variavel que armazena o codigo de autenticacao para conexao
    char auth[] = BLYNK_AUTH_TOKEN;

    //Declaracao do nome e senha da rede Wi-Fi
    //Altere as variaveis abaixo com o nome e senha da sua rede Wi-Fi
    char ssid[] = "MONITORIA";
    char pass[] = "12345678";

    //Criacao do objeto serial para comunicacao com o ESP8266
    SoftwareSerial EspSerial(10, 11); // RX, TX

    //Declaracao da variavel que armazena a velocidade de comunicacao do modulo
    const int ESP8266_BAUD = 9600;

    //Confiracao do objeto 'wifi' para usar a serial do ESP8266 para conexao
    ESP8266 wifi(&EspSerial);

    //Funcao que le o pino V1 a cada atualizacao de estado
    BLYNK_WRITE(V1){
        int pinValue = param.asInt(); //Le o valor do pino virtual
        digitalWrite(12, pinValue); //Aciona o LED da placa de acordo com o valor lido pelo pino virtual
    }

    //Configuracao do codigo
    void setup(){

        //Inicializacao do monitor serial
        Serial.begin(9600);
        delay(10);
        Serial.println("Iniciando conexão...");

        //Configura o pino do LED interno da placa como saida
        pinMode(LED_BUILTIN, OUTPUT);

        //Inicializa a comunicacao serial do ESP8266
        EspSerial.begin(ESP8266_BAUD);
        delay(10);

        //Inicializacao da comunicacao e conexao do modulo ao aplicativo
        Serial.println("Tentando conectar ao Blynk...");
        Blynk.begin(auth, wifi, ssid, pass);

        Serial.println("Conexão ao Blynk iniciada.");
    }
    //Repeticao do codigo
    void loop(){
        Blynk.run(); //Mantem a conexao ativa com o aplicativo e processa comandos recebidos ou enviados
        delay(10); // Pequeno atraso para evitar problemas de sincronização
    }
    ```

3. Altere os parâmetros de conexão BLYNK_TEMPLATE_ID, BLYNK_DEVICE_NAME e BLYNK_AUTH_TOKEN (estes dados estão acessíveis nas ferramentas de desenvolvedor do dispositivo criado no Blynk, clicando no ícone de ferramentas na barra abaixo do nome do dispositivo.), juntamente com o nome (ssid) e a senha (pass) da sua rede Wi-Fi
4. Selecione a placa e a porta de conexão onde o Arduino está conectado
5. Faça o upload do código para a placa Arduino

#### Passo 4: Observação
1. Abra o Monitor Serial no Arduino IDE. Se as configurações estiverem corretas, você deve ver algo como isto:

<p align="center">
  <img src="..\..\src\images\Blynk.jpeg" height="300">
</p>

2. Abra o Blynk, o dispositivo está sendo apresentado como conectado? Tente interagir com o interruptor para acender e apagar o LED interno do Arduino

#### Passo 5: Exploração
1. Qual é o tempo de resposta entre o envio do comando no Blynk e a execução da ação no LED?
2. Como o uso de pinos virtuais se comporta em termos de latência e controle? Existe alguma diferença perceptível entre controlar pinos físicos e virtuais?
3. É possível controlar mais de um dispositivo com o Blynk simultaneamente? Experimente adicionar um buzzer ao circuito e controlá-lo usando um controle deslizante no Blynk
4. Como o Blynk lida com quedas de conexão ou falhas na rede Wi-Fi? O aplicativo mantém o estado do dispositivo ou é necessário reconectar?

---

### Conclusão
Este roteiro proporcionou uma introdução prática à utilização do módulo ESP8266 e do aplicativo Blynk para implementar um monitoramento e controle remotos. Exploramos desde a comunicação inicial com o ESP8266, utilizando comandos AT, até a criação de um servidor web capaz de exibir valores de sensores em tempo real. Além disso, utilizamos o Blynk para criar um dashboard interativo, superando limitações de comunicação e memória ao integrar dados e funcionalidades em uma plataforma intuitiva. Esses conceitos e práticas representam uma base sólida para projetos de automação e IoT, permitindo expandir a conectividade e o controle de dispositivos em diferentes contextos.

---

### Referências para Consulta
[Comandos AT](https://s3-sa-east-1.amazonaws.com/robocore-lojavirtual/652/Simple-AT-commands-ESP8266.pdf) 

[Datasheet ESP8266](https://www.espressif.com/sites/default/files/documentation/0a-esp8266ex_datasheet_en.pdf) 

[Blynk](https://docs.blynk.io/en)

[Documentação Oficial do Arduino](https://www.arduino.cc/en/Guide/HomePage) 

### Sugestões de Leitura
[Esp8266](https://en.wikipedia.org/wiki/ESP8266) 

[Internet of things (IoT)](https://en.wikipedia.org/wiki/Internet_of_things) 

[Guia de conexão do ESP8266](https://learn-sparkfun-com.translate.goog/tutorials/esp8266-thing-hookup-guide/using-the-arduino-addon?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt&_x_tr_pto=tc) 

---