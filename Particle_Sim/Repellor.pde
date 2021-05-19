class Repellor{
  PVector position;
  float strength;
  
  Repellor(int x, int y){
    position = new PVector(x,y);
    strength = 100 ;
  }
  
  void update(int x, int y){
    position = new PVector(x,y);
  }
}
