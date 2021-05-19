PImage img;
PImage[] sorted;

void setup(){
  size(180, 180);
  imageMode(CENTER);
  img = loadImage("moon.png");
  sorted = new PImage[1];
  sorted[0] = loadImage("moon.png");
  //sorted[1] = loadImage("moon_inner1.png");
  img.loadPixels();
  
  int i, j, k, l;
  for(i = 0; i< sorted.length;i++){
    sorted[i].loadPixels();
    for(j= 0; j<sorted[i].height; j++){
      int firstpixindex = -1;
      k = j*sorted[i].width;
      while(firstpixindex == -1 && k<(j+1)*sorted[i].width){
        if(alpha(sorted[i].pixels[k]) == 255){
          firstpixindex = k;
        }
        k++;
      }
      if(firstpixindex == -1){
        firstpixindex = j*sorted[i].width;
      }
      int lastpixindex = -1;
      l = (j+1)*sorted[i].width-1;
      while(lastpixindex == -1 && l>(j)*sorted[i].width){
        if(alpha(sorted[i].pixels[l]) == 255){
          lastpixindex = l;
        }
        l--;
      }
      if(lastpixindex == -1){
        lastpixindex = (j+1)*sorted[i].width-1;
      }
      sorted[i].pixels = selectionSort(sorted[i].pixels, firstpixindex, lastpixindex);
    }
    
    //println();
    sorted[i].updatePixels();
  }
}

color[] selectionSort(color arr[], int lb, int ub){
  for(int i = lb; i<ub; i++){
    float record = -1;
    int selectedPixel = i; 
    for (int j = i; j<ub; j++){
      color pix = arr[j];
      float b = brightness(pix);
      if (b>record){
        selectedPixel = j;
        record = b;
      }
    }
      color temp = arr[i];
      arr[i] = arr[selectedPixel];
      arr[selectedPixel] = temp;
  }
  return arr;
}

color[] bubbleSort(color arr[], int lb,int ub)  
{  
    int i, j;  
    for (i = lb; i < ub-1; i++){   
      
    // Last i elements are already in place  
    for (j = lb; j < ub-i-1; j++){ 
        if (arr[j] > arr[j+1]){
            //swap(&arr[j], &arr[j+1]);
             color temp = arr[j];
             arr[j] = arr[j+1];
             arr[j+1] = temp;
        }
            
    }
    }
    return arr;
}  

void draw(){
  translate(width/2, height/2);
  
  background(0);
  image(img,0,0);
  for(int i =0; i< sorted.length; i++){
    image(sorted[i],0,0);
  }
}
