import com.hamoid.*;
VideoExport videoExport;

int n = 32;
float r = 105;
int h = 0;
 
void setup(){
  size(600, 600);
  strokeWeight(2);
  ellipseMode(CENTER);
  rectMode(CENTER);
  colorMode(GRAY);
  background(0);
  noFill();
  frameRate(25);
  
  videoExport = new VideoExport(this);
  //videoExport.startMovie();
}
void draw(){
  //if (frameCount > 800){
  //  noLoop();
  //}
  translate(width/2, height/2);
  fill(40,10);
  noStroke();
  //rotate(0.0005*millis());
  rect(0,0,width, height);
  float radius = r + r*sin(millis()/(PI*1000));
  int num = round(n+ n*sin(millis()/(PI*1000)));
  h++;
  //stroke(h%255,255,255);
  
  noFill();
  for(int i = 0; i<num; i++){
    rotate((TWO_PI)/num);
    stroke(0);
    ellipse(0, radius,(TWO_PI*radius)/num, radius + radius/4 * sin(i - num));
    
  }
  for(int i = 0; i<num; i++){
    rotate((TWO_PI)/num);
  
    stroke(160);
    ellipse(0, radius,2*radius,(TWO_PI*radius)/num);
  }
   
  //videoExport.saveFrame();
}
