int unitSize;
float noiseScale=0.005;
GrassBlade g[][];
public void settings() {
  fullScreen();
}

void setup(){    
    unitSize = 100;
    background(0);
    stroke(255);
    noFill();
    
    grid();
    for(int i= 0; i < g.length; i++){
       for(int j = 0; j< g[0].length; j++){
           g[i][j].drawBlade();
       }
    }
    
}
void draw(){
  //background(0);
  //PVector wind = new PVector(mouseX - width/2,0);
  //g.updateBlade(wind);
  //g.drawBlade();
}
void grid(){
  int unitsX = width/unitSize;
  int unitsY = height/unitSize;
  g = new GrassBlade[unitsX][unitsY];
    for (int i = 0; i < unitsX; i ++){
      for(int j = 0; j < unitsY; j ++){
        g[i][j] = new GrassBlade(i*unitSize,j*unitSize, 100, 20);
      }
  }
}
