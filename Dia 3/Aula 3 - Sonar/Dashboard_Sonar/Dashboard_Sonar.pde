/**
 * #######################################################################
 * Software Arduino Sonar Monitor
 *
 * alterado por Rodrigues <https://rodriguesfas.github.io>
 * by Dejan Nedelkovski <www.HowToMechatronics.com>  
 *########################################################################
 */

import processing.serial.*; /* biblioteca para comunicação serial */
import java.awt.event.KeyEvent; /*biblioteca para leitura de dados na porta serial. */
import java.io.IOException;

Serial myPort; /* Define objeto serial */

/* define algumas variaveis.. */
String angle="";
String distance="";
String data="";
String noObject;
float pixsDistance;
int iAngle, iDistance;
int index1=0;
int index2=0;
//PFont orcFont;
PFont myFont;

/**
 * setup - 
 */
void setup() {

  size (800, 600); /* ***Alterar para resolução que desejar*** */
  smooth();
  myPort = new Serial(this, "COM5", 9600); /* inicia comunicação serial. */
  myPort.bufferUntil('.'); /* Lê oas dados atravéz da porta serial (angulo e distância) */

  //orcFont = loadFont("OCRAExtended-30.vlw");
  myFont = createFont("verdana", 10); /* define tipo de fonte e tamanho. */
}

/**
 * draw - 
 */
void draw() {
  fill(98, 245, 31);
  //textFont(orcFont);
  textFont(myFont); 

  /* simulando o borrão de movimento e lento desaparecer da linha móvel. */
  noStroke();
  fill(0, 4); 
  rect(0, 0, width, height-height*0.065); 

  fill(98, 245, 31); /* cor verde */

  /* chama as funções para desenhar o radar. */
  drawRadar(); 
  drawLine();
  drawObject();
  drawText();
}

/**
 * serialEvent --
 */
void serialEvent (Serial myPort) { /* começa a ler os dados aparti da porta serial. */
  /* lê os dados na porta serial (caractere) e armazena em uma string de dados. */
  data = myPort.readStringUntil('.');
  println("Dados recebidos" + data);
  data = data.substring(0, data.length()-1);

  index1 = data.indexOf(","); /* encontra o caractere e armazena na variavel "index1" */
  angle= data.substring(0, index1).trim(); /* ler os dados da posição "0" a posição do index1 váriavel ou isso é o valor do ânculo da placa Ardíno enviado */
  distance= data.substring(index1+1, data.length()).trim(); /* ler os dados de posição "index1" para o final do pr de dados que é o valor da distância. */

  // converte string para inteiro.
  iAngle = int(angle);
  iDistance = int(distance);
}

/**
 * drawRadar - 
 */
void drawRadar() {
  pushMatrix();
  translate(width/2, height-height*0.074); /* move as coordenadas para o novo local.  */
  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);

  // draws the arc lines
  arc(0, 0, (width-width*0.0625), (width-width*0.0625), PI, TWO_PI);
  arc(0, 0, (width-width*0.27), (width-width*0.27), PI, TWO_PI);
  arc(0, 0, (width-width*0.479), (width-width*0.479), PI, TWO_PI);
  arc(0, 0, (width-width*0.687), (width-width*0.687), PI, TWO_PI);

  // draws the angle lines
  line(-width/2, 0, width/2, 0);
  line(0, 0, (-width/2)*cos(radians(30)), (-width/2)*sin(radians(30)));
  line(0, 0, (-width/2)*cos(radians(60)), (-width/2)*sin(radians(60)));
  line(0, 0, (-width/2)*cos(radians(90)), (-width/2)*sin(radians(90)));
  line(0, 0, (-width/2)*cos(radians(120)), (-width/2)*sin(radians(120)));
  line(0, 0, (-width/2)*cos(radians(150)), (-width/2)*sin(radians(150)));
  line((-width/2)*cos(radians(30)), 0, width/2, 0);

  popMatrix();
}

/**
 * drawObject - 
 */
void drawObject() {
  pushMatrix();
  translate(width/2, height-height*0.074);  /* move as coordenadas para o novo local.  */
  strokeWeight(9);
  stroke(255, 10, 10); /* cor vermelho */

  pixsDistance = iDistance*((height-height*0.1666)*0.025); /* converte a distância entre o sensor de cm para px */

  /* limite de faixa de 40 cms */
  if (iDistance<40 & iDistance > 3) {
    /* desenha o objeto de acordo com o ângulo e a distância. */
    line(pixsDistance*cos(radians(iAngle)), -pixsDistance*sin(radians(iAngle)), (width-width*0.505)*cos(radians(iAngle)), -(width-width*0.505)*sin(radians(iAngle)));
  }
  popMatrix();
}

/**
 * drawLine - 
 */
void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(30, 250, 60);
  translate(width/2, height-height*0.074); /* move as coordenada iniciais para o novo local. */
  line(0, 0, (height-height*0.12)*cos(radians(iAngle)), -(height-height*0.12)*sin(radians(iAngle))); /* chama a linha de acordo com o angulo */
  popMatrix();
}

/**
 * drawText - 
 */
void drawText() { /* desenha os textos na tela. */

  pushMatrix();

  if (iDistance > 40) {
    noObject = "Fora de alcance!";
  } else {
    noObject = "Na faixa!";
  }

  fill(0, 0, 0);
  noStroke();
  rect(0, height-height*0.0648, width, height);
  fill(98, 245, 31);
  textSize(12);

  text("10cm", width-width*0.3854, height-height*0.0833);
  text("20cm", width-width*0.281, height-height*0.0833);
  text("30cm", width-width*0.177, height-height*0.0833);
  text("40cm", width-width*0.0729, height-height*0.0833);
  textSize(12);

  text("Objeto: " + noObject, width-width*0.875, height-height*0.0277);
  text("Ângulo: " + iAngle +" °", width-width*0.48, height-height*0.0277);
  text("Distância: ", width-width*0.26, height-height*0.0277);

  if (iDistance < 40) {
    text("        " + iDistance +" cm", width-width*0.225, height-height*0.0277);
  }

  /*plano cartesiano*/

  textSize(20);
  fill(98, 245, 60);
  translate((width-width*0.4994)+width/2*cos(radians(30)), (height-height*0.0907)-width/2*sin(radians(30)));
  rotate(-radians(-60));
  text("30°", 0, 0);
  resetMatrix();
  translate((width-width*0.503)+width/2*cos(radians(60)), (height-height*0.0888)-width/2*sin(radians(60)));
  rotate(-radians(-30));
  text("60°", 0, 0);
  resetMatrix();
  translate((width-width*0.507)+width/2*cos(radians(90)), (height-height*0.0833)-width/2*sin(radians(90)));
  rotate(radians(0));
  text("90°", 0, 0);
  resetMatrix();
  translate(width-width*0.513+width/2*cos(radians(120)), (height-height*0.07129)-width/2*sin(radians(120)));
  rotate(radians(-30));
  text("120°", 0, 0);
  resetMatrix();
  translate((width-width*0.5104)+width/2*cos(radians(150)), (height-height*0.0574)-width/2*sin(radians(150)));
  rotate(radians(-60));
  text("150°", 0, 0);
  popMatrix();
}

/**
 * stop - 
 */
void stop() {
  super.stop();
}
