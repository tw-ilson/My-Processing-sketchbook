class ParticleImage extends ParticleSystem{
  PImage myImage;
  
  ParticleImage(int x, int y,PImage img){
   super(x,y);
   myImage = img;
   
   for (int i = 0; i < myImage.width; i++){
      for (int j = 0; j< myImage.height; j++){
        addParticle(origin.x +i,origin.y +j,color(myImage.get(i,j)));
      }
   }
 }
 
 
  
}
