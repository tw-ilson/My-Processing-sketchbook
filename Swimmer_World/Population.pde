class Population {
  ArrayList<School> schools;
  Fish f;

  Population(int nschools) {
    schools = new ArrayList<School>();
    for(int i = 0; i< nschools; i++){
      schools.add(new School(round(random(3,6)), pickColor() ));
    }
  }
  
  color pickColor(){
    //picks one of the possible pure combinations of the 3 main hues.
    return color(255,0,0);
  }
  
  void display() {
    for(int i = 0; i < schools.size(); i++){
      schools.get(i).display();
    }
  }

  void update() {
    for(int i = 0; i < schools.size(); i++){
      schools.get(i).update();
    }
  }
}
