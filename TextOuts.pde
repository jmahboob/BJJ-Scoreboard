void drawIncrements() {
  textFont(font, width/50);
  
  fill(0, 0, 0, textalpha);
  text("+2", 1*xinc-xhalf, 4*yinc - yhalf);
  text("+3", 1*xinc-xhalf, 5*yinc - yhalf);
  text("+4", 1*xinc-xhalf, 6*yinc - yhalf);
  text("-2", 1*xinc-xhalf, 7*yinc - yhalf);
  text("-3", 1*xinc-xhalf, 8*yinc - yhalf);
  text("-4", 1*xinc-xhalf, 9*yinc - yhalf);
  
  text("+2", 16*xinc-xhalf, 4*yinc - yhalf);
  text("+3", 16*xinc-xhalf, 5*yinc - yhalf);
  text("+4", 16*xinc-xhalf, 6*yinc - yhalf);
  text("-2", 16*xinc-xhalf, 7*yinc - yhalf);
  text("-3", 16*xinc-xhalf, 8*yinc - yhalf);
  text("-4", 16*xinc-xhalf, 9*yinc - yhalf);
  
  text("+1", 4*xinc-xhalf, 10*yinc-yhalf);
  text("-1", 4*xinc-xhalf, 12*yinc-yhalf);
  text("+1", 8*xinc-xhalf, 10*yinc-yhalf);
  text("-1", 8*xinc-xhalf, 12*yinc-yhalf);
  
  text("+1", 12*xinc-xhalf, 10*yinc-yhalf);
  text("-1", 12*xinc-xhalf, 12*yinc-yhalf);
  text("+1", 16*xinc-xhalf, 10*yinc-yhalf);
  text("-1", 16*xinc-xhalf, 12*yinc-yhalf);
  
  text("R", 0*xinc+xhalf, 12*yinc - yhalf);
  
  fill(0);
  text("ADVANTAGES", 2*xinc, 9*yinc+yhalf/2);
  text("ADVANTAGES", 10*xinc, 9*yinc+yhalf/2);
  text("PENALTIES", 6*xinc, 9*yinc+yhalf/2);
  text("PENALTIES", 14*xinc, 9*yinc+yhalf/2);
 

}

void drawTime() {
  fill(255);
  textFont(font, width/7.24);
  String[] time = new String[2];
  
  if(!stopped) {
    milli = (millis()-startTime);
    if(continued) milli += offset;
    seconds = milli / 1000;
    minutes = seconds / 60;
    seconds = seconds % 60;
  }
  time[0] = nf(minutes, 2);
  time[1] = nf(seconds, 2);
  String out = join(time, ":");
  text(out, 8*xinc, 2*yinc+yhalf);
  
  /*rectMode(CENTER);
  rect(14*xinc-xhalf, 1*yinc-yhalf, xhalf, xhalf);
  triangle(14*xinc-xhalf-xhalf/2, 1*yinc+yhalf/2,
            14*xinc-xhalf-xhalf/2, 2*yinc-yhalf/2,
            14*xinc-xhalf/2, 2*yinc - yhalf);
  textFont(font, 40);
  text("R", 15*xinc-xhalf, 2*yinc-yhalf);*/
}
