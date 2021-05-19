
class Fish {
  final static float FISH_SIZE = 8;

  PVector position;//cartesian coords on the xy-plane, represents fish location
  PVector velocity;
  PVector acceleration;//number 0-2, scales the velocity of the fish.
  PVector direction;//amount in radians, represents fish direction

  FishBody body;
  color c;

  String type;//the color of the fish
  Boolean isMale;
  float size;//size of the fish(number 1-2), will vary with chance and with age
  float age;//age of the fish (number 0-100), relates to time of death and affects size
  float hunger;//number 0-1, how hungry this fish is
  float foodsEaten;//counts the number of foods eaten

  Fish(float x, float y, float d, String type) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(1, 0);
    this.acceleration = 1;
    this.direction = new PVector(0, 1);
    this.type = type;
    this.isMale = random(2) > 1;
    this.size = 1 + random (0, 0.1);
    this.age = 0;
    this.hunger = 0.1;
    this.foodsEaten = 0;
    
    this.c = color(255,0,0);
    this.body = new FishBody(this.position, this.c);
  }

  // what to do with this fish each frame
  void update() {
   
  }

  //when the scene is displayed, determines how this fish is displayed
  void display() {
    
  }


  void mover() {
  }

  Boolean isAlive() {
    return (age>100) && (hunger>1);
  }
}

class FishBody {
  color hue;
  float size;
  int spineLength;
  
  FishBody(color c){
    this.size = 10;
    this.hue = c;
  }
  
 
  
  void update(PVector posn){
    
  }
  
  void display(){
    
  }
}
