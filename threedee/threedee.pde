


float noisescale = 0.15;
int vidlength = 360;
int size = 500;
float angle =0;
PVector[] points = new PVector[8];
color[] sidecolors = new color[6];

void setup(){
  size(750,750);
  frameRate(20);
  points[0] = new PVector(-1,-1,-1);
  points[1] = new PVector(1,-1,-1);
  points[2] = new PVector(1,1,-1);
  points[3] = new PVector(-1,1,-1);
  points[4] = new PVector(-1,-1,1);
  points[5] = new PVector(1,-1,1);
  points[6] = new PVector(1,1,1);
  points[7] = new PVector(-1,1,1);
  
  for(int i = 0; i<sidecolors.length; i++){
    sidecolors[i] = color(random(100,200), 0, random(50,150));
  }
  
}

void draw(){
 background(0);
 translate(width/2, height/2);
 stroke(255);
 //noFill();
 
 float[][] rotationZ = {
   {cos(angle), -sin(angle),   0},
   {sin(angle), cos(angle),    0},
   {0,          0,             1}
 };
 
 float[][] rotationX = {
   {1,          0,               0},
   {0, cos(angle),    -sin(angle)},
   {0, sin(angle),    cos(angle) },
   
 };
 
 float[][] rotationY = {
   {cos(angle), 0,    -sin(angle)},
   {0,          1,               0},
   {sin(angle), 0,    cos(angle)},
   
 };
   
 PVector[] projected = new PVector[points.length];  
 
 int index = 0;
 for(PVector v: points){
   PVector rotated = matrixToVec(matmul(rotationY, v));
   rotated = matrixToVec(matmul(rotationX, rotated));
   rotated = matrixToVec(matmul(rotationZ, rotated));
   
   float distance = 3;
   float z = 1/ (distance - rotated.z);
   float[][] projection =  {
      {z,0,0},
      {0,z,0}
    };
    
   PVector projected2d = matrixToVec(matmul(projection, rotated));
   projected2d.mult(size);
   projected[index] = projected2d;
   index++;
 }
 
 
 sides(projected);
 
 
 pixelSort();
 //for(PVector v: projected){
 //  stroke(200,0,200);
 //  strokeWeight(3);
 //  point(v.x, v.y);
 //}
 
 //for (int i =0; i<4; i++){
 //  connect(i, (i+1)%4, projected);
 //  connect(i+4, ((i+1)%4)+4, projected);
 //  connect(i, i+4, projected);
   
 //}
 //connect(0,1, projected);
 pixelShuffle();

 
 //if(frameCount < vidlength){
 //     saveFrame("frames/####.png");
 //}else{
 //     exit();
 //}
 
  angle += .02;
  //noLoop();
}

void pixelSort(){
  int j, k, l;
    loadPixels();
    for(j= 0; j<height; j++){
      int firstpixindex = -1;
      k = j*width;
      while(firstpixindex == -1 && k<(j+1)*width){
        if(pixels[k] != color(0)){
          firstpixindex = k;
        }
        k++;
      }
      if(firstpixindex == -1){
        firstpixindex = j*width;
      }
      int lastpixindex = -1;
      l = (j+1)*width-1;
      while(lastpixindex == -1 && l>(j)*width){
        if(pixels[l] != color(0)){
          lastpixindex = l;
        }
        l--;
      }
      if(lastpixindex == -1){
        lastpixindex = (j+1)*width-1;
      }
      pixels = selectionSort(pixels, firstpixindex, lastpixindex);
    }
    
    //println();
    updatePixels();
    
    
}

void pixelShuffle(){
  loadPixels();
  for(int i = 0; i < height; i++){
    int offset = round(70*(noise(i*noisescale,frameCount*noisescale)-.5));
    offset += round(random(-4,4));
    color[] temp = new color[width];
    //color[] newrow = new color[width];
    
    for(int k = 0; k<width; k++){
      temp[k] = pixels[i*width + k];
    }
    for(int k = 0; k<width; k++){
      pixels[i*width + k] = temp[abs((k+offset)%width)];
    }
  }
  updatePixels();
}

void connect(int i, int j, PVector[] points) {
  PVector a = points[i];
  PVector b = points[j];
  strokeWeight(1);
  stroke(0);
  line(a.x, a.y, b.x, b.y);
  
}

void sides(PVector[] points){
  noStroke();
  //stroke(0);
  //strokeWeight(2);
  fill(sidecolors[0]);
  quad(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y, points[3].x, points[3].y);
  fill(sidecolors[1]);
  quad(points[0].x, points[0].y, points[1].x, points[1].y, points[5].x, points[5].y, points[4].x, points[4].y);
  fill(sidecolors[2]);
  quad(points[2].x, points[2].y, points[3].x, points[3].y, points[7].x, points[7].y, points[6].x, points[6].y);
  fill(sidecolors[3]);
  quad(points[4].x, points[4].y, points[5].x, points[5].y, points[6].x, points[6].y, points[7].x, points[7].y);
  fill(sidecolors[4]);
  quad(points[0].x, points[0].y, points[3].x, points[3].y, points[7].x, points[7].y, points[4].x, points[4].y);
  fill(sidecolors[5]);
  quad(points[1].x, points[1].y, points[2].x, points[2].y, points[6].x, points[6].y, points[5].x, points[5].y);
}
