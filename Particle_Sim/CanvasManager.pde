import com.hamoid.*;

ParticleSystem ps;
Repellor r;
VideoExport ve;
PImage img;
void settings(){
  size(400,400);
}
void setup(){
  img = loadImage("img.jpg");
  ps = new ParticleSystem(width/2, height/2);
  //ve = new VideoExport(this);
  //ve.startMovie();
   r = new Repellor(width/2, height/2);
  
}

void draw(){
  if(frameCount > 10){
    background(0);
    //image(img,0, 0);
    PVector gravity = new PVector(0,0.05);
    r.update(mouseX, mouseY);
    
    ps.applyForce(gravity);
    ps.applyRepellor(r);
    ps.addParticle();
    ps.run();
  }
  //ve.saveFrame();
  //if(ps.a.size()<2){
  //  noLoop();
  //  ve.endMovie();
  //}
 }
