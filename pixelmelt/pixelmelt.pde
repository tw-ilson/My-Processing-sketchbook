
meltedImage leader;
PImage sourceimage;
PImage background;
int leaderhue = 0;
ArrayList<meltedImage> skulls = new ArrayList<meltedImage>();

void setup(){
 size(600,200); 
 frameRate(30);
 //sourceimage = loadImage("skull.png");
 background = loadImage("background.jpg");
 colorMode(HSB,360,100,100);
 leader = new meltedImage("skull.png", new PVector(50,50), color(leaderhue,100,100));
 leader.display();
}

void draw(){
  background(background);
 //stroke(255);
 fill(0);
 noStroke();
 leader = new meltedImage("skull.png", new PVector(100,100 + round(30*sin(frameCount*TWO_PI/100))), color(leaderhue%360,100,100));
 rect(0,50, 600, 100);
 for(meltedImage m: skulls){
   m.update();
   m.display();
 }
 
 
 leader.display();
 if(frameCount%20 == 0){
   skulls.add(new meltedImage("skull.png", leader.position, color(leaderhue%360,100,100)));
 }
 if(skulls.size()>30){
   skulls.remove(0);
 }
 leaderhue++;
 
 if(frameCount < 900){
   saveFrame("frames/img###.png");
 }
}
