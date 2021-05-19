
class GrassBlade{
  private float bladeHeight;
  private float baseWidth;
  private PVector basePos;
  private PVector tipPos;
  private PVector windSpeed;
  private PVector[] spine;
  
  final int nDivisions = 10;
   float divisionSize;
  
  GrassBlade(int x, int y, int h,int w){
    basePos = new PVector(x,y);
    tipPos = new PVector(x, y - h);
    
    bladeHeight = h;
    baseWidth = w/2;
    
    spine = new PVector[nDivisions];
    spine[0] = basePos;
    divisionSize = h/nDivisions;
    for (int i = 1; i<nDivisions; i++){
      spine[i] = new PVector(x,y-i*divisionSize);
    }
    
  }
  void updateBlade(PVector wind){
    wind.normalize();
    float windScalar = 1;
    PVector newPos;
    for (int i = spine.length -1; i>0; i--){
      windScalar = ((float)i)/spine.length;
      newPos = spine[i].add(wind.mult(windScalar));
      if((new PVector(newPos.x - spine[i-1].x, newPos.y - spine[i-1].y).mag()) > divisionSize){
        newPos = PVector.add(spine[i-1],new PVector(newPos.x - spine[i-1].x, newPos.y - spine[i-1].y).normalize().mult(divisionSize));
      }
      spine[i] = newPos;
    }
  }
  void drawBlade(){
    //strokeWeight(3);
    //for(int i = 0; i<spine.length; i++){
    //  point(spine[i].x, spine[i].y);
    //}
    strokeWeight(1);
    for(int i = 0; i<spine.length -1; i++){
      line(spine[i].x, spine[i].y, spine[i+1].x, spine[i+1].y );    
    }
    stroke(0,255,0);
    float bladeWidth = baseWidth;
     for(int i = 0; i<spine.length; i++){
      line(spine[i].x-bladeWidth,spine[i].y, spine[i].x+ bladeWidth, spine[i].y);
      bladeWidth -= (baseWidth/nDivisions);
    }
  }
}
