class meltedImage{
  PImage original;
  PImage melted;
  PVector position;
  int stage = 0;
  float noiseScale = .1;
  
  int[] rowOffset;
  
  meltedImage(String filename, PVector pos, color colorseed){
    original = loadImage(filename);
    melted = createImage(width, height, ARGB);
    paint(colorseed);
    melted.set(round(pos.x - original.width/2), round(pos.y - original.height/2), original);
    position = pos;
    //melted.filter(ERODE);
    
  }
  
  void paint(color colorseed){
    PImage temp = createImage(original.width, original.height, ARGB);
    temp.loadPixels();
    original.loadPixels();
    for(int i =0; i< original.pixels.length; i++){
      if(alpha(original.pixels[i]) >0){
        temp.pixels[i] = lerpColor(original.pixels[i], colorseed, noise(i*noiseScale, frameCount*noiseScale) + random(.1,.2));
      }
    }
    original = temp;
    original.updatePixels();
  }
  void pixelLoss(){
    melted.loadPixels();
    for(int i = 0; i< melted.pixels.length; i++){
      if(random(1) <.0001){
        melted.pixels[i] = 0;
      }
    }
  }
  void pixelShuffle(){
    melted.loadPixels();
    for(int i = 0; i < melted.height; i++){
      //int offset = round(2*(noise(i*noiseScale,frameCount*noiseScale)-.5));
      int offset = round(random(5));
      color[] temp = new color[melted.width];
      //color[] newrow = new color[width];
      
      for(int k = 0; k<melted.width; k++){
        temp[k] = melted.pixels[i*melted.width + k];
      }
      if(random(1)<(.0005*stage)){
        for(int k = 0; k<melted.width; k++){
          melted.pixels[i*melted.width + k] = temp[abs((k-offset)%melted.width)];
        }
      }
    }
    
    melted.updatePixels();
  }
  
  void update(){
    //pixelLoss();
    pixelShuffle();
    
    stage++;
  }
  void display(){
    image(melted, stage, 0);
  }
  
  
}
