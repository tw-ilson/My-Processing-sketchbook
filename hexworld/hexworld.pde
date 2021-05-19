import com.hamoid.*;

HexSystem hexes;

VideoExport ve;

void setup(){
 size(720, 480);
 background(0);
 frameRate(12);
 hexes = new HexSystem();
 
 ve = new VideoExport(this);
 //ve.startMovie();
 
}
void draw(){
   fill(0, 20);
   rect(0,0,width,height);
   hexes.update();
   hexes.drawHexes();
   
   if (frameCount < 120){
     saveFrame("save###.png");
  }
}
