Population p;
PVector mousePos;
FishBody fb;
void setup() {
  size(800, 800);
  p = new Population(1);
  //follower = new PVector(200,200);
  //Fish f = new Fish(200,200, 0, "");
  fb = new FishBody(new PVector(200, 200), color(0,0,200));
}

void draw() {
  //f.update();
  background(0);
  p.update();
  p.display();
  mousePos = new PVector(mouseX, mouseY);
  //fb.update(mousePos);
  //fb.display();
}  

//takes two pvectors and ensures that the follower is within _dist_ of the leader. the returned PVector will be the updated position of the follower.
PVector tether(PVector p1, PVector p2, float dist){
    if(abs(p1.x - p2.x) < dist && abs(p1.y - p2.y) < dist){
      return new PVector(p2.x, p2.y); 
    }else{
      PVector p3 = new PVector(-(p1.x-p2.x), -(p1.y-p2.y));
      p3.setMag(dist);
      return p1.add(p3);
    }
  }
