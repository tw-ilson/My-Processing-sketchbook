void setup(){
size(640, 640, P3D); 
background(0);
lights();
noFill();
stroke(1);
}

void draw(){
pushMatrix();
background(0);
stroke(255);
translate(width/2, height/2, 0);
rotateX(PI/4);
rotateY(PI/4);

box(100 + 100*sin(frameCount/100));
popMatrix();
}
