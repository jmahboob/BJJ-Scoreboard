void drawBackgrounds() {
  rectMode(CORNER);
  //fill(#6D9BF1);
  fill(255);
  quad(8*xinc, 2*yinc, 
        8*xinc, 9*yinc, 
        15*xinc, 9*yinc,
        15*xinc, 2*yinc);
  
  fill(255);
  quad(0*xinc, 2*yinc,
        0*xinc, 9*yinc,
        8*xinc, 9*yinc,
        8*xinc, 2*yinc);
        
  fill(      #FFFF00, 255);
  quad(0, 9*yinc,
        0, 12*yinc,
        4*xinc, 12*yinc,
        4*xinc, 9*yinc);
    quad(8*xinc, 9*yinc,
        8*xinc, 12*yinc,
        12*xinc, 12*yinc,
        12*xinc, 9*yinc);
        
        fill(#FF0000, 255);
        
            quad(4*xinc, 9*yinc,
        4*xinc, 12*yinc,
        8*xinc, 12*yinc,
        8*xinc, 9*yinc);
        
                    quad(12*xinc, 9*yinc,
        12*xinc, 12*yinc,
        16*xinc, 12*yinc,
        16*xinc, 9*yinc);
        
        //fill(#7CCD7C, 250);
        fill(#00FF00, 200);
        quad(8*xinc, 3*yinc,
              8*xinc, 9*yinc,
              16*xinc, 9*yinc,
              16*xinc, 3*yinc);
              
        fill(0);
        quad(0, 0,
              width, 0,
              width, 3*yinc,
              0,3*yinc);
        
}
