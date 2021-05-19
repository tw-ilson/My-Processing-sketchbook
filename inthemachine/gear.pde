class gear{
 PVector origin;
 PVector position;
 
 float radius;
 float startradius;
 
 int numpts;
 float spikiness;
 PVector[] edgepts;
 color startcolor;
 
 boolean clockwise;
 float rotspeed;
 float rotation;
 
 float distance;
 float startdistance;
 
 boolean isDead;
 
 gear(float x,float y,float r,int teeth, color c){
   origin = new PVector(x,y);
   position = origin;
   radius = r;
   startradius = r;
   startcolor = c;
   spikiness = random(.8, .9);
   clockwise = random(1) >=.5;
   rotation = 0;
   rotspeed = random(.005,.05);
   distance = origin.mag();
   startdistance = origin.mag();
   isDead = false;
   numpts = 2*teeth;
   edgepts = new PVector[numpts];
 }
 
 void update(){
  float toothangle = TWO_PI/numpts;
  if(!clockwise){
    rotation += rotspeed;
  }else{
    rotation -= rotspeed;
  }
  distance -= startdistance/200;
  if(distance <=0){
    isDead = true;
  }
  position.setMag(distance);
  radius = startradius*(distance/startdistance);
  for(int i =0; i<numpts;i++){
    if (i%2 == 0){
      edgepts[i] = new PVector(position.x + spikiness*radius*cos(toothangle*i + rotation),position.y + spikiness*radius*sin(toothangle*i + rotation));
    }else{
      edgepts[i] = new PVector(position.x + radius*cos(toothangle*i + rotation),position.y + radius*sin(toothangle*i + rotation));
    }
  }
 }
 
 void display(){
   noStroke();
   fill(0);
   //fill(lerpColor(color(0),startcolor,norm(distance, 0, startdistance)));
   circle(position.x,position.y, 2*spikiness*radius);
   for(int i = 0; i<numpts-2;i+=2){
     triangle(edgepts[i].x,edgepts[i].y,edgepts[i+1].x,edgepts[i+1].y,edgepts[i+2].x,edgepts[i+2].y);
   }
   triangle(edgepts[numpts-2].x,edgepts[numpts-2].y,edgepts[numpts-1].x,edgepts[numpts-1].y,edgepts[0].x,edgepts[0].y);
   stroke(0);
   
   stroke((255*((float)(Math.log10(norm(distance, 0, startdistance))+2)/2)));
   for(int i =1; i<numpts;i++){
    line(edgepts[i-1].x, edgepts[i-1].y, edgepts[i].x, edgepts[i].y);
  }
  line(edgepts[numpts-1].x, edgepts[numpts-1].y, edgepts[0].x, edgepts[0].y);
 }
}

class flatGear extends gear{
  flatGear(float x,float y,float r,int teeth, color c){
    super(x,y,r,teeth,c);
    numpts = 4*teeth;
    edgepts = new PVector[numpts];
  }
  
  void update(){
  float toothangle = TWO_PI/numpts;
  if(!clockwise){
    rotation += rotspeed;
  }else{
    rotation -= rotspeed;
  }
  distance -= startdistance/200;
  if(distance <=0){
    isDead = true;
  }
  position.setMag(distance);
  radius = startradius*(distance/startdistance);
  for(int i =0; i<numpts-3;i+=4){
      edgepts[i] = new PVector(position.x + spikiness*radius*cos(toothangle*i + rotation),position.y + spikiness*radius*sin(toothangle*i + rotation));
      edgepts[i+1] = new PVector(position.x + radius*cos(toothangle*i + rotation),position.y + radius*sin(toothangle*i + rotation));
      
      edgepts[i+2] = new PVector(position.x + radius*cos(toothangle*(i+2) + rotation),position.y + radius*sin(toothangle*(i+2) + rotation));
      edgepts[i+3] = new PVector(position.x + spikiness*radius*cos(toothangle*(i+2) + rotation),position.y + spikiness*radius*sin(toothangle*(i+2) + rotation));
    }
  }
 
  void display(){
   noStroke();
   fill(0);
   //fill(lerpColor(color(0),startcolor,norm(distance, 0, startdistance)));
   circle(position.x,position.y, 2*spikiness*radius);
   for(int i = 0; i<numpts-3;i+=4){
     quad(edgepts[i].x,edgepts[i].y,edgepts[i+1].x,edgepts[i+1].y,edgepts[i+2].x,edgepts[i+2].y,edgepts[i+3].x,edgepts[i+3].y);
   }
   stroke(0);
   stroke((255*((float)(Math.log10(norm(distance, 0, startdistance))+2)/2)));
   for(int i =1; i<numpts;i++){
    line(edgepts[i-1].x, edgepts[i-1].y, edgepts[i].x, edgepts[i].y);
  }
  line(edgepts[numpts-1].x, edgepts[numpts-1].y, edgepts[0].x, edgepts[0].y);
 }
}
