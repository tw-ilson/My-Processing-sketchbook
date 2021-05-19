class Walker{
 final static float segmentLength = 5;
 
 public boolean cangrow;
 public boolean split;
 public int length;
 float deathchance;
 float rotation;
 PVector startpos;
 ArrayList<PVector> points;
 
 Walker(float x, float y, float r){
  cangrow = true;
  split = false;
  deathchance = 0.1;
  length = 1;
  rotation = r;
  startpos = new PVector(x,y);
  points = new ArrayList<PVector>();
  points.add(startpos);
 }
 
 void update(){
   if(cangrow){
     addPoint();
   }
   if (random(1) < deathchance){
     cangrow = false;
   }
 }
 void addPoint(){
   length++;
   deathchance *= 1.1;
   PVector prev = points.get(points.size()-1);
   float angle = rotation + random(PI/4, 3*PI/4);
   points.add(new PVector(prev.x + segmentLength*cos(angle), prev.y - segmentLength*sin(angle)));
 }
 PVector getEndpoint(){
   return points.get(points.size()-1);
 }
 
 void drawWalker(){
   stroke(#A66829);
   strokeWeight(2);
   for(int i = points.size() -1; i>0; i--){
     PVector p1 = points.get(i);
     PVector p2 = points.get(i-1);
     line(p1.x, p1.y, p2.x,p2.y);
   }
   
   //stroke(0,150,0);
   //strokeWeight(4);
   //for(int i = 0; i<points.size(); i++){
   //  PVector cur = points.get(i);
   //  point(cur.x, cur.y);
   //}
  
 }
}
