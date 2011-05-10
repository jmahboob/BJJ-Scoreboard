/* @pjs preload="data/JJI_scoreboardLOGO.png"; */

//import fullscreen.*;
//import processing.opengl.*;

//SoftFullScreen fs;
PFont font;
PImage logo;
PImage europelogo;

Competitor p1;
Competitor p2;

int xinc;
int yinc;
int xhalf;
int yhalf;

int startTime = 0;
int seconds, minutes, milli, offset;
boolean stopped = true;
boolean continued = false;

int textalpha = 10;

void setup() {
  size(1024, 768);
  //size(screen.width, screen.height);
  xinc = width/16;
  yinc = height/12;
  xhalf = xinc/2;
  yhalf = yinc/2;

  //println("Test1"); 
  //fs = new SoftFullScreen(this);
  //fs.enter();

  //font = loadFont("data/Arial-Black-200.vlw");
  font = loadFont("arial");
  textFont(font, 200);
  logo = loadImage("data/JJI_scoreboardLOGO.png");
  //europelogo = loadImage("logo-official.png");

  //println("Test2"); 

  p1 = new Competitor();
  p2 = new Competitor();
  p1.init();
  p2.init();

  //startTime = millis();
}

void draw() {
  background(255);
  smooth();

  //println("Test3");

  //seconds = (millis() - startTime) / 1000;
  //minutes = seconds / 60;

  //fill(255);
  rectMode(CENTER);
  //rect(width/2, height/2, width - 20, height - 20);


  stroke(220); 
  strokeWeight(1);
  for(int i = 1; i < 13; i++) {
    line(0, i*(height/12), width, i*(height/12));
  }
  for(int i = 1; i < 17; i++) {
    line(i*(width/16), 0, i*(width/16), height);
  }

  drawBackgrounds();



  stroke(0); 
  strokeWeight(10);
  line(0, 0, width, 0);
  line(0, 0, 0, height);
  line(width, height, 0, height);
  line(width, height, width, 0);


  line(0, 3*yinc, width, 3*yinc);
  line(8*xinc, 3*yinc, 8*xinc, height);
  strokeWeight(2);
  line(0, 9*yinc, width, 9*yinc);
  line(4*xinc, 9*yinc, 4*xinc, height);
  line(12*xinc, 9*yinc, 12*xinc, height);


  fill(0);
  //textFont(font, width/3.41);
  textFont(font, width/4);
  textAlign(CENTER, CENTER);

  noStroke();

  fill(0);
  text(nf(p1.getPoints(), 2), 3*xinc, 7*yinc);
  text(nf(p2.getPoints(), 2), 13*xinc, 7*yinc);

  textFont(font, width/7.82);
  text(nf(p1.getAdvantages(), 1), 2*xinc, 11*yinc);
  text(nf(p2.getAdvantages(), 1), 10*xinc, 11*yinc);
  if(p1.getPenalties() == 0)   text(nf(p1.getPenalties(), 1), 6*xinc, 11*yinc);
  else  text("-"+nf(p1.getPenalties(), 1), 6*xinc, 12*yinc - yhalf);
  if(p2.getPenalties() == 0)   text(nf(p2.getPenalties(), 1), 14*xinc, 11*yinc);
  else  text("-"+nf(p2.getPenalties(), 1), 14*xinc, 12*yinc - yhalf);

  drawTime();
  drawIncrements();

  //println("Test5");

  fill(255);
  stroke(0);
  strokeWeight(10);
  ellipse(width/2, height/2, width/3.6, width/3.6);
  imageMode(CENTER);
  image(logo, width/2, height/2, width/3.9, width/3.9);
  //image(europelogo, 2*xinc+xhalf, 1*yinc+yhalf, width/3.9, height/6);
  //image(europelogo, 13*xinc+xhalf, 1*yinc+yhalf, width/3.9, height/6);

  if(mouseX < 16*xinc && mouseX > 13*xinc && mouseY > 0*yinc && mouseY < 1*yinc) {
    fill(255, 100);
    noStroke();
    quad(13*xinc, 0,
    16*xinc, 0,
    16*xinc, 1*yinc,
    13*xinc, 1*yinc);
    fill(0);
    textFont(font, width/22);
    text("STOP", 14*xinc+xhalf, yhalf+yhalf/2);
  }
  else if(mouseX < 16*xinc && mouseX > 13*xinc && mouseY > 1*yinc && mouseY < 2*yinc){
    fill(255, 100);
    noStroke();
    quad(13*xinc, 1*yinc,
    16*xinc, 1*yinc,
    16*xinc, 2*yinc,
    13*xinc, 2*yinc);
    fill(0);
    textFont(font, width/22);
    text("START", 14*xinc+xhalf, 1*yinc+yhalf+yhalf/2);
  }
  else if(mouseX < 16*xinc && mouseX > 13*xinc && mouseY > 2*yinc && mouseY < 3*yinc){
    fill(255, 100);
    noStroke();
    quad(13*xinc, 2*yinc,
    16*xinc, 2*yinc,
    16*xinc, 3*yinc,
    13*xinc, 3*yinc);
    fill(0);
    textFont(font, width/22);
    text("RESET", 14*xinc+xhalf, 2*yinc+yhalf+yhalf/2);
  }
  //println("Test4");
}

void mousePressed() {
  if(mouseX < 1*xinc && mouseX > 0*xinc && mouseY > 3*yinc && mouseY < 4*yinc) p1.changePoints(2);
  else if(mouseX < 1*xinc && mouseX > 0*xinc && mouseY > 4*yinc && mouseY < 5*yinc) p1.changePoints(3);
  else if(mouseX < 1*xinc && mouseX > 0*xinc && mouseY > 5*yinc && mouseY < 6*yinc) p1.changePoints(4);
  else if(mouseX < 1*xinc && mouseX > 0*xinc && mouseY > 6*yinc && mouseY < 7*yinc) p1.changePoints(-2);
  else if(mouseX < 1*xinc && mouseX > 0*xinc && mouseY > 7*yinc && mouseY < 8*yinc) p1.changePoints(-3);
  else if(mouseX < 1*xinc && mouseX > 0*xinc && mouseY > 8*yinc && mouseY < 9*yinc) p1.changePoints(-4);

  else if(mouseX < 16*xinc && mouseX > 15*xinc && mouseY > 3*yinc && mouseY < 4*yinc) p2.changePoints(2);
  else if(mouseX < 16*xinc && mouseX > 15*xinc && mouseY > 4*yinc && mouseY < 5*yinc) p2.changePoints(3);
  else if(mouseX < 16*xinc && mouseX > 15*xinc && mouseY > 5*yinc && mouseY < 6*yinc) p2.changePoints(4);
  else if(mouseX < 16*xinc && mouseX > 15*xinc && mouseY > 6*yinc && mouseY < 7*yinc) p2.changePoints(-2);
  else if(mouseX < 16*xinc && mouseX > 15*xinc && mouseY > 7*yinc && mouseY < 8*yinc) p2.changePoints(-3);
  else if(mouseX < 16*xinc && mouseX > 15*xinc && mouseY > 8*yinc && mouseY < 9*yinc) p2.changePoints(-4);

  //Advantages and Penalties
  else if(mouseX < 4*xinc && mouseX > 3*xinc && mouseY > 9*yinc && mouseY < 10*yinc) p1.changeAdvantages(+1);
  else if(mouseX < 4*xinc && mouseX > 3*xinc && mouseY > 11*yinc && mouseY < 12*yinc) p1.changeAdvantages(-1);
  else if(mouseX < 8*xinc && mouseX > 7*xinc && mouseY > 9*yinc && mouseY < 10*yinc) p1.changePenalties(+1);
  else if(mouseX < 8*xinc && mouseX > 7*xinc && mouseY > 11*yinc && mouseY < 12*yinc) p1.changePenalties(-1);

  else if(mouseX < 12*xinc && mouseX > 11*xinc && mouseY > 9*yinc && mouseY < 10*yinc) p2.changeAdvantages(+1);
  else if(mouseX < 12*xinc && mouseX > 11*xinc && mouseY > 11*yinc && mouseY < 12*yinc) p2.changeAdvantages(-1);
  else if(mouseX < 16*xinc && mouseX > 15*xinc && mouseY > 9*yinc && mouseY < 10*yinc) p2.changePenalties(+1);
  else if(mouseX < 16*xinc && mouseX > 15*xinc && mouseY > 11*yinc && mouseY < 12*yinc) p2.changePenalties(-1);

  else if(mouseX < 16*xinc && mouseX > 13*xinc && mouseY > 0*yinc && mouseY < 1*yinc) stopped = true;
  else if(mouseX < 16*xinc && mouseX > 13*xinc && mouseY > 1*yinc && mouseY < 2*yinc) {
    stopped = false;
    continued = true;
    startTime = millis();
    offset  = milli;
  }
  else if(mouseX < 16*xinc && mouseX > 13*xinc && mouseY > 2*yinc && mouseY < 3*yinc) {
    p1.init();
    p2.init();

    stopped = true;
    continued = true;
    startTime = millis();
    offset = 0;
    milli = seconds = minutes = 0;
  }

  else if(mouseX < 1*xinc && mouseX > 0*xinc && mouseY < 12*yinc & mouseY > 11*yinc) {
    p1.init();
    p2.init();

    stopped = true;
    continued = true;
    startTime = millis();
    offset = 0;
    milli = seconds = minutes = 0;
  }

}

void keyPressed() {
  if (key == CODED) {
    if(keyCode == UP) {
      textalpha += 5;
      if(textalpha >= 255) textalpha = 255;
    }
    else if(keyCode == DOWN) {
      textalpha -= 5;
      if(textalpha <= 0) textalpha = 0;
    }
  }
}

