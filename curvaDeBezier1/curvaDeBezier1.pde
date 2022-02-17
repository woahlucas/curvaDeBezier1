float P1x, P1y, P2x, P2y;
float A1x, A1y, A2x, A2y;
float x, y, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, t;

int xRect = 60;

int pAtual;

void setup() {
  size(500, 500);
  P1x=150;
  P1y=400;
  P2x=300;
  P2y=400;

  A1x=50;
  A1y=150;
  A2x=450;
  A2y=250;

  t = (frameCount/200.0%1);
  x = bezierPoint(A1x, P1x, P2x, A2x, t);
  y = bezierPoint(A1y, P1y, P2y, A2y, t);
}

void draw() {
  background(255);
  noFill();
  inicio();
  
  //dependendo da seleção/clique que o usuário fizer, será mostrado uma etapa diferente 
  if (pAtual == 1) {
    p1();
    contagem();
  }
  if (pAtual == 2) {
    p2();
    contagem();
  }
  if (pAtual == 3) {
    p3();
    contagem();
  }
  if (pAtual == 4) {
    p4();
    contagem();
  }
  if (pAtual == 5) {
    p5();
    contagem();
  }
  if (pAtual == 6) {
    pfinal();
    contagem();
  }
  desenhaRect();
  clicar();


/*
utilizo a função bezierPoint para pegar as posições das diversas curvas da aplicação e fazer elipses andarem sobre elas 

o frameCount serve para acelerar ou desacelerar a velocidade com que t cresce 
*/
  t = (frameCount/400.0%1);
  x = bezierPoint(A1x, P1x, P2x, A2x, t);
  y = bezierPoint(A1y, P1y, P2y, A2y, t);
  x2 = bezierPoint(P1x, P1x+50, P2x-50, P2x, t);
  y2 = bezierPoint(P1y, P1y, P2y, P2y, t);
  x3= bezierPoint(A1x, A1x, P1x, P1x, t);
  y3= bezierPoint(A1y, A1y, P1y, P1y, t);
  x4= bezierPoint(P2x, P2x, A2x, A2x, t);
  y4= bezierPoint(P2y, P2y, A2y, A2y, t);
  x5 = bezierPoint(x3, x3, x2, x2, t);
  y5 = bezierPoint(y3, y3, y2, y2, t);
  x6 = bezierPoint(x2, x2, x4, x4, t);
  y6 = bezierPoint(y2, y2, y4, y4, t);
  x7 = bezierPoint(x5, x5, x6, x6, t);
  y7 = bezierPoint(y5, y5, y6, y6, t);
}


void inicio() {
  stroke(245);
  strokeWeight(3);
  bezier(P1x, P1y, P1x+50, P1y, P2x-50, P2y, P2x, P2y);
  fill(245);
  bezier(A1x, A1y, P1x, P1y, P2x, P2y, A2x, A2y);
  stroke(0);
  strokeWeight(1);


  bezier(A1x, A1y, A1x, A1y, P1x, P1y, P1x, P1y);
  bezier(A2x, A2y, A2x, A2y, P2x, P2y, P2x, P2y);



  fill(255);
  ellipse(P1x, P1y, 10, 10);
  ellipse(P2x, P2y, 10, 10);
  fill(0);
  ellipse(A1x, A1y, 10, 10);
  ellipse(A2x, A2y, 10, 10);
}

void p1() {
  inicio();
  noStroke();
  fill(141, 120, 214);
  ellipse(x2, y2, 10, 10);
  ellipse(x3, y3, 10, 10);
  ellipse(x4, y4, 10, 10);
}

void p2() {
  inicio();
  p1();
  strokeWeight(2);
  stroke(141, 120, 214);
  bezier(x2, y2, x2, y2, x3, y3, x3, y3);
  bezier(x2, y2, x2, y2, x4, y4, x4, y4);
}

void p3() {
  inicio();
  p2();
  noStroke();
  fill(120, 222, 209);
  ellipse(x5, y5, 10, 10);
  ellipse(x6, y6, 10, 10);
}

void p4() {
  inicio();
  p3();
  strokeWeight(3);
  stroke(120, 222, 209);
  bezier(x5, y5, x5, y5, x6, y6, x6, y6);
}

void p5() {
  inicio();
  p4();
  noStroke();
  fill(0);
  ellipse(x7, y7, 10, 10);
}

void pfinal() {
  inicio();
  p5();
  noFill();
  stroke(0);
  bezier(A1x, A1y, P1x, P1y, P2x, P2y, A2x, A2y);
}


//desenha os botões e os textos
void desenhaRect() {
  noStroke();
  fill(0);
  rect(xRect, 50, 50, 25, 15);
  rect(xRect + 65, 50, 50, 25, 15);
  rect(xRect + 65*2, 50, 50, 25, 15);
  rect(xRect + 65*3, 50, 50, 25, 15);
  rect(xRect + 65*4, 50, 50, 25, 15);
  rect(xRect + 65*5, 50, 50, 25, 15);


  textAlign(CENTER, TOP);
  textSize(18);
  fill(255);
  text("1", xRect+25, 50);
  text("2", xRect+25+65, 50);
  text("3", xRect+25+65*2, 50);
  text("4", xRect+25+65*3, 50);
  text("5", xRect+25+65*4, 50);
  textSize(12);
  text("FINAL", xRect+25+65*5, 54);
  fill(0);
  text("Âncora 1",A1x,A1y-30);
  text("Âncora 2",A2x,A2y-30);
  text("P.C. 1",P1x-35,P1y-10);
  text("P.C. 2",P2x+35,P2y-10);
  
  
}

//clicar nos botões para escolher a fase
void clicar() {
  if (mousePressed && mouseX > xRect && mouseX < xRect+50 && mouseY > 50 && mouseY < 75)
    pAtual = 1;
  if (mousePressed && mouseX > xRect+65 && mouseX < xRect+65+50 && mouseY > 50 && mouseY < 75)
    pAtual = 2;
  if (mousePressed && mouseX > xRect+65*2 && mouseX < xRect+65*2+50 && mouseY > 50 && mouseY < 75)
    pAtual = 3;
  if (mousePressed && mouseX > xRect+65*3 && mouseX < xRect+65*3+50 && mouseY > 50 && mouseY < 75)
    pAtual = 4;
  if (mousePressed && mouseX > xRect+65*4 && mouseX < xRect+65*4+50 && mouseY > 50 && mouseY < 75)
    pAtual = 5;
  if (mousePressed && mouseX > xRect+65*5 && mouseX < xRect+65*5+50 && mouseY > 50 && mouseY < 75)
    pAtual = 6;
}

//faz um contador indo de 0 a 100 em função de t (que vai de 0 a 1) e coloca o valor na tela
void contagem() {
  float cont = map(t, 0, 1, 0, 100);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("t = "+(int)cont+"%", width/2, 450);
}
