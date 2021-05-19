class School {
  ArrayList<Fish> fishes;
  color schoolColor;

  School(int startsize, color c) {
    fishes = new ArrayList<Fish>();
    schoolColor = c;
    for (int i = 0; i< startsize; i++) {
      /* FOR NOW: picks random location for fish to start
       FOR THE FUTURE: Fishes of the same school should gravitate to each other.
       */
      fishes.add(new Fish(random(width), random(height), 0, ""));
    }
  }

  void update() {
    for (int i = 0 ; i < fishes.size(); i++) {
      fishes.get(i).update();
    }
  }

  void display() {
    for (int i = 0 ; i < fishes.size(); i++) {
      fishes.get(i).display();
    }
  }
}
