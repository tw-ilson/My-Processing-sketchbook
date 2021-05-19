class gearSystem{
  ArrayList<gear> gears;
  float size;
  float regchance = .5;
  int curHue = 0;
  
  gearSystem(int s){
    gears = new ArrayList<gear>();
    size = s;
  }
  void addGear(){
    colorMode(HSB,1000);
    color curColor = color(curHue%1000,1000,1000);
    float random = random(1);
    float newradius = random(size - 100,size);
    if(random<.25){
      if(random(1)>regchance){
        gears.add(new flatGear(random(-width/2-newradius,width/2+newradius),-height/2 - size, newradius, round(random(5,30)),curColor));
      }else{
        gears.add(new gear(random(-width/2-newradius,width/2+newradius),-height/2 - size, newradius, round(random(5,50)),curColor));
      }
    }else if(random<.5){
      if(random(1)>regchance){
        gears.add(new flatGear(width/2 + size,random(-height/2-newradius,height/2+newradius), newradius, round(random(5,30)),curColor));
      }else{
        gears.add(new gear(width/2 + size,random(-height/2-newradius,height/2+newradius), newradius, round(random(5,50)),curColor));
      }
    }else if(random<.75){
      if(random(1)>regchance){
        gears.add(new flatGear(random(-width/2-newradius,width/2+newradius),height/2 + size, newradius, round(random(5,30)),curColor));
      }else{
        gears.add(new gear(random(-width/2-newradius,width/2+newradius),height/2 + size, newradius, round(random(5,50)),curColor));
      }
    }else{
      if(random(1)>regchance){
        gears.add(new flatGear(-height/2 - size,random(-height/2-newradius,height/2+newradius),newradius, round(random(5,30)),curColor));
      }else{
        gears.add(new gear(-height/2 - size,random(-height/2-newradius,height/2+newradius),newradius, round(random(5,50)),curColor));
      }
    }
    curHue+=2;
  }
  
  
  void updateGears(){
   for(int i = gears.size()-1; i>=0; i--){
     gear g = gears.get(i);
     g.update();
     if(g.isDead){
       gears.remove(i);
     }
   }
  }
  
  void drawGears(){
    for(gear g: gears){
      g.display();
    }
  }
  
  void run(){
    updateGears();
    drawGears();
  }
}
