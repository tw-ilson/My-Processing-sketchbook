import com.hamoid.*;
Tree[] trees;
PImage earth;
VideoExport ve;
int n = 8;
int r = 60;

void setup(){
  size(600,600);
  background(160,160,255);
  translate(width/2,height/2);
  earth = loadImage("earth.png");
  image(earth,-60,-60);
  
  //ve = new VideoExport(this);
  //w = new Walker(width/2, height);
  //ve.startMovie();
  stroke(0);
  noFill();
  //circle(0,0,2*r);
  trees = new Tree[n];
  float spacing = TWO_PI/n;
  for(int i = 0; i < n; i++){
    trees[i] = new Tree(0, -r, 0);
  }
  
  for(int i = 0; i < n; i++){
    rotate(spacing);
    //line(0,100,0,120);
    trees[i].drawTree();
    //push();
  }
  //t1 = new Tree(-200, 0, 0);
  //t2 = new Tree(0, 0, 0);
  //t3 = new Tree(200, 0, 0);
  //t1.drawTree();
  //t2.drawTree();
  //t3.drawTree();
}
void mouseClicked(){
  setup();
}
