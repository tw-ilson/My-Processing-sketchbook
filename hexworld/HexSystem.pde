class HexSystem{
  Hex[][] h;
  PVector origin;
  OpenSimplexNoise noise;
  
  //Hex current;
  
  HexSystem(){
    h = new Hex[round(width/(getSideDist()*2))+1][round(height/(Hex.cornerDist*1.5))+1];
    //current = addHex(width/2, height/2);
    addHexes();
    noise = new OpenSimplexNoise();
  }
  
  void addHexes(){
    float side = getSideDist();
    for(int i = 0; i<h.length; i++){
      for(int j = 0; j<h[0].length; j++){
        h[i][j] = new Hex( i*side*2 + (j%2)*side, j*1.5*Hex.cornerDist);
      }
    }
    
  }
  //int getNumAdjacent(Hex hex){
  //  for ()
  //  return num;
  //}
  
  float getSideDist(){
    return Hex.cornerDist * sqrt(3)/2;
  }
  
  void update(){
    float t = norm(frameCount%120, 0, 120);
    float noiseScale =.02;
    float noiseRadius = 1;
    color nextcolor = color(0);
    for(int i = 0; i<h.length; i++){
      for(int j = 0; j<h[0].length; j++){
        float noiseVal = (float)(noise.eval(i*noiseScale, j*noiseScale, noiseRadius*cos(TWO_PI*t), noiseRadius*sin(TWO_PI*t))+1)/2;
        if(noiseVal%.1 > .075){
          h[i][j].revive();
          nextcolor = color(0,255* noiseVal,255 * (1-noiseVal));
        }else{
          h[i][j].kill();
        }
        h[i][j].setColor(nextcolor);
      }
    }
  }
  
  void drawHexes(){
    for(Hex[] i: h){
      for(Hex j: i){
        if(j.isAlive){
          j.drawHex();
        }
      }
    }
  }
  
}
