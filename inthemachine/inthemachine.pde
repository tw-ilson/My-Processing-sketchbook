 import gifAnimation.*;
 import com.hamoid.*;
 
 VideoExport ve;
 boolean vidplaying;
 int vidstartframe;
 int vidlength = 720;
 
 gearSystem g;
 Gif eye;
 
 color[] lastPixels = new color[width*height];
 int[] rands;
 int glitchlength;
 
void setup(){
 size(400,400);
 background(0);
 strokeWeight(1.5);
 imageMode(CENTER);
 eye = new Gif(this, "eye.gif");
 eye.play();
 
 ve = new VideoExport(this);
 ve.setFrameRate(20);
 vidplaying = false;
    
 g = new gearSystem(500);
 
rands = new int[100];
loadPixels();
for(int i = 0; i<rands.length;i++){
      int rand = (int)random(pixels.length);
      rands[i] =  rand;
 }
}


void draw(){
  
  background(0);
  translate(width/2, height/2);
  colorMode(RGB);
  push();
  rotate(frameCount*.005);
  g.run();
  if(frameCount%1 == 0){
   g.addGear(); 
  }
  pop();
  image(eye,0,0);
  pixelShifter(); 
  //PImage[] gifcuts = stripeVertical(eye,10);
  
  if(vidplaying){
    ve.saveFrame();
    if(frameCount> vidstartframe + vidlength){
      vidplaying = false;
      ve.endMovie();
    }
    
  }
  
}


void keyPressed() {
  if (key == 'q') {
    saveFrame("save.png");
    //vidplaying = true;
    //vidstartframe = frameCount;
    //ve.startMovie();
  }
}


void pixelShifter()
{
  loadPixels();
  for(int i = 0; i<rands.length;i++){
      int rand = (int)random(pixels.length);
      rands[i] =  rand;
    }
    for(int i = 0; i<rands.length-1;i++){
      glitchlength = round(random(10,100));
      for(int j = rands[i]; j<rands[i] + glitchlength; j++){
        pixels[j%pixels.length] = color(random(255), random(255), random(255));
      }
    }
    
  for(int i = 0; i < pixels.length; i++){
    
    if(random(1000)<5)
    {
      pixels[i] =  color(random(255), random(255), random(255));
    }
  }
  updatePixels();
}

PImage[] stripeVertical(PImage p, int divisions,int x,int y){
  
    int spacing = p.width/divisions;
    PImage[] newimages = new PImage[divisions];
    for(int i = 0; i<divisions; i++){
        newimages[i] = new PImage(p.width/divisions,p.height);
    }
    for(int i = 0; i<divisions; i++){
        newimages[i].set(i*spacing,0,p.get(i*spacing,0,spacing,p.height));
    }
    return newimages;
  }
  
