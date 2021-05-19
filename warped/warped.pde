PImage img, img2, img3, img4;

void settings(){
  img = loadImage("img.jpg");
  img2 = loadImage("img.jpg");
  size(img.width,img.height);
  
}

void setup(){
 //image(img,0,0);
 img2.filter(INVERT);
 img3 = stripeVertical(img,img2,10);
 image(img3,0,0);
 
}

PImage grayscale(PImage p){
  //PImage newImage = new PImage(p.width,p.height);
  p.loadPixels();
  color[] newPixArray = new color[p.pixels.length];
  int index = 0;
  for(color c: p.pixels){
    int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
    int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
    int b = c & 0xFF;          // Faster way of getting blue(argb)
    color newColor = color((r + g + b)/3);
    newPixArray[index] = newColor;
    index++;
  }
  for(int i =0; i<p.pixels.length; i++){
    p.pixels[i] = newPixArray[i];
  }
  p.updatePixels();
  return p;
}

PImage stripeVertical(PImage p1, PImage p2, int divisions){
  if(!(p1.width == p2.width && p1.height == p2.height)){
    return null;
  }
  else{
    int spacing = p1.width/divisions;
    PImage newimage = new PImage(width, height);
    for(int i = 0; i<divisions; i++){
      if(i%2 == 0){
        newimage.set(i*spacing,0,p1.get(i*spacing,0,spacing,p1.height));
      }else{
        newimage.set(i*spacing,0,p2.get(i*spacing,0,spacing,p2.height));
      }
    }
    return newimage;
  }
}
PImage stripeHorizontal(PImage p1, PImage p2, int divisions){
  if(!(p1.width == p2.width && p1.height == p2.height)){
    return null;
  }
  else{
    int spacing = p1.height/divisions;
    PImage newimage = new PImage(width, height);
    for(int i = 0; i<divisions; i++){
      if(i%2 == 0){
        newimage.set(0,i*spacing,p1.get(0,i*spacing,p1.width,spacing));
      }else{
        newimage.set(0,i*spacing,p2.get(0,i*spacing,p2.width,spacing));
      }
    }
    return newimage;
  }
}
