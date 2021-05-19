class ParticleSystem{
 ArrayList<Particle> a;
 PVector origin;
 
 ParticleSystem(int x, int y){
   a = new ArrayList<Particle>();
   origin = new PVector(x,y);
 }
 void applyForce(PVector force){
   for(Particle p : a){
     p.applyForce(force);
   }
 }
 void applyRepellor(Repellor repellor){
   for(Particle p : a){
     p.applyRepellor(repellor);
   }
 }
 void addParticle(){
   //float r = random(1);
   PVector p = new PVector(origin.x, origin.y);
   a.add(new Particle(p));
 }
 void addParticle(float x, float y, color c){
   //float r = random(1);
   PVector p = new PVector(x, y);
   a.add(new ColorParticle(p,c));
 }
 
 void run(){
   for(int i = a.size()-1; i>=0; i--){
     Particle p = a.get(i);
     p.update();
     p.display();
     if(p.isDead()){
       a.remove(i);
     }
   }
}
}
