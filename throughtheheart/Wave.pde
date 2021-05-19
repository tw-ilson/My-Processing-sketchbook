class Wave{
  public int subwaves;
  float m1,m2,m3;
  float offset = 0;
  int waveHeight = 250;
  
  Wave(float mult1){
    subwaves = 1;
    m1 = mult1;
  }
  Wave(float mult1, float mult2){
    subwaves = 2;
    m1 = mult1;
    m2 = mult2;
  }
  Wave(float mult1, float mult2, float mult3){
    subwaves = 3;
    m1 = mult1;
    m2 = mult2;
    m3 = mult3;
  }
  void update(){
    offset += .01;
  }
  float outputAt(float xpos){
    float output = 0;
    if (subwaves == 1){
      output = sin(m1*xpos - offset);
    }
    else if (subwaves == 2){
      output = sin(m1*xpos - offset) +sin(m2*xpos - offset);
    }
    else if (subwaves == 3){
      output = sin(m1*xpos - offset) +sin(m2*xpos - offset) +sin(m3*xpos - offset);
    }
    return waveHeight/2 * (output/subwaves);
  }
}
