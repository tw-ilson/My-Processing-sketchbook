class Hex{
  PVector position;
  PVector[] corners;
  final static float cornerDist = 10;
  float sideDist = cornerDist * sqrt(3)/2;
  color hexColor;
  boolean isAlive;
  
  Hex(float x, float y){
    position = new PVector(x,y);
    corners = setCorners();
    isAlive = false;
    hexColor = color(255,0,0);
  }
  
  public float getSideDist(){
    return cornerDist * sqrt(3)/2;
  }
  
  void setColor(color c){
    hexColor = c;
  }
  
  PVector[] setCorners(){
    PVector[] arr = new PVector[6];
    for(int i = 0; i <6; i++){
      arr[i] = new PVector(position.x + cornerDist*sin(i*PI/3), position.y + cornerDist*cos(i*PI/3));
    }
    return arr;
  }
  
  // index is a number 0-6 
  PVector getAdjacentPos(int index){
    return new PVector(position.x + 2*sideDist*cos(PI/3 + index*(PI/3)), position.y + 2*sideDist*sin(PI/3 + index*(PI/3)));
  }
  
  //void update(){
    
  //}
  void kill(){
    isAlive = false;
  }
  void revive(){
    isAlive = true;
  }
  void drawHex(){
    noStroke();
    fill(hexColor,200);
    quad(corners[0].x, corners[0].y, corners[1].x, corners[1].y, corners[2].x, corners[2].y, position.x, position.y);
    fill(hexColor,80);
    quad(corners[2].x, corners[2].y, corners[3].x, corners[3].y, corners[4].x, corners[4].y, position.x, position.y);
    fill(hexColor);
    quad(corners[4].x, corners[4].y, corners[5].x, corners[5].y, corners[0].x, corners[0].y, position.x, position.y);
    stroke(0);
    //for(int i = corners.length -1; i>0; i--){
    //  line(corners[i].x, corners[i].y, corners[i-1].x, corners[i-1].y);
    //}
    //line(corners[0].x, corners[0].y, corners[5].x,corners[5].y);
  }
}
  
