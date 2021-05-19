class Particle{
  int size = 2;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan = 200;
  
  Particle(PVector startPos){
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-1,1));
    position = startPos;
  }
  
  void applyForce(PVector force){
     acceleration.add(force);
  }
  
  void applyRepellor(Repellor r){
    PVector distance = PVector.sub(r.position, this.position);
    PVector force = new PVector(1,0);
    force.rotate(distance.heading());
    force.setMag(r.strength/distance.magSq());
    //if (1/distance.mag() < r.strength){
      applyForce(force);
      lifespan +=3;
    //}
  }
  
  boolean isDead(){
   if (lifespan<=0){
     return true;
   }else{
      return false;
   }
  }
  
  void update(){
    velocity.add(acceleration);
    if(position.x > width || position.x <0){
      velocity = new PVector(-velocity.x, velocity.y);
    }else if (position.y >height || position.y <0){
      velocity = new PVector(velocity.x, -velocity.y);
    }
    position.add(velocity);
    
    acceleration.mult(0);
    lifespan -=2;
  }
  
  void display(){
    noStroke();
    fill(255, lifespan);
    ellipse(position.x,position.y, size, size);
  }
}


class SquareParticle extends Particle{
  SquareParticle(PVector startPos){
    super(startPos);
  }
  void display(){
    noStroke();
    fill(255, lifespan);
    rectMode(CENTER);
    rect(position.x,position.y, size, size);
  }
}


class ColorParticle extends Particle{
  color c;
  ColorParticle(PVector startPos, color startColor){
    super(startPos);
    c = startColor;
  }
   void display(){
    //noStroke();
    stroke(c, lifespan);
    point(position.x,position.y);
    //ellipse(position.x,position.y, size, size);
  }
}
