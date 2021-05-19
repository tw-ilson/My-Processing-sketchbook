import com.hamoid.*;

PImage bg;
PImage top;
VideoExport ve;
int subdivisions;
float gap;

  Wave sine1 = new Wave(random(.1), random(.1), random(.1));
  Wave sine2 = new Wave(random(.1), random(.1), random(.1));
  
  Wave sine3 = new Wave(random(.05), random(.05), random(.05));
  Wave sine4 = new Wave(random(.05), random(.05), random(.05));
  
void setup(){
  size(900,1200);
  bg = loadImage("mewithstars.jpg");
  top =loadImage("top_layer.png");
  ve = new VideoExport(this);
  //ve.startMovie();
  noStroke();
  subdivisions =  900;
  gap = width/((float)subdivisions);
  background(255);
}

void draw(){
  background(bg);
  push();
  translate(0, height/2);
  for(int i = subdivisions-1; i>0; i--){
    //line(i*gap, sine1.outputAt(i),gap * (i-1), sine1.outputAt(i-1));
    //line(i*gap, sine2.outputAt(i),gap * (i-1), sine2.outputAt(i-1));
    if(sine1.outputAt(i)>sine2.outputAt(i)){
      fill(#B631FF,200);
    }
    else{
      fill(#2270AF,200);
    }
    rect(i*gap, sine1.outputAt(i),gap, sine2.outputAt(i) - sine1.outputAt(i));
  }
  for(int i = subdivisions-1; i>0; i--){
    //line(i*gap, sine1.outputAt(i),gap * (i-1), sine1.outputAt(i-1));
    //line(i*gap, sine2.outputAt(i),gap * (i-1), sine2.outputAt(i-1));
    if(sine3.outputAt(i)>sine4.outputAt(i)){
      fill(#FF1226, 128);
    }
    else{
      fill(#FF00B7, 128);
    }
    rect(i*gap, sine3.outputAt(i),gap, sine4.outputAt(i) - sine3.outputAt(i));
  }
  pop();
  image(top,0,0);
  
  //if(frameCount < 600){
  //  ve.saveFrame();
  //}else{
  //  ve.endMovie();
  //  noLoop();
  //}
  sine1.update();
  sine2.update();
  sine3.update();
  sine4.update();
  
  
}
