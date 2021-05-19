 class Prism{
  float h;
  PVector[] base;
  PVector[] points;
  float rotAngleX, rotAngleY, rotAngleZ;
  float[][] rotationX, rotationY, rotationZ;
  
  Prism(PVector[] shape, float prismHeight){
    h = prismHeight;
    base = shape;
    points = new PVector[base.length*2];
    for(int i = 0; i<base.length; i++){
      points[i] = new PVector(base[i].x, base[i].y, base[i].z +h/2);
    }
    for(int i = 0; i<base.length; i++){
      points[i+base.length] = new PVector(base[i].x, base[i].y, base[i].z -h/2);
    }
  }
  
  void rotation(float x, float y, float z){
    rotAngleX += x;
    rotAngleY += y;
    rotAngleZ += z;
    
    float[][] rotationZ = {
       {cos(rotAngleZ), -sin(rotAngleZ),   0},
       {sin(rotAngleZ), cos(rotAngleZ),    0},
       {0,          0,             1}
    };
 
    float[][] rotationX = {
       {1,          0,               0},
       {0, cos(rotAngleX),    -sin(rotAngleX)},
       {0, sin(rotAngleX),    cos(rotAngleX) },
       
    };
 
    float[][] rotationY = {
       {cos(rotAngleY), 0,    -sin(rotAngleY)},
       {0,          1,               0},
       {sin(rotAngleY), 0,    cos(rotAngleY)},
    };
    
    for(PVector v: points){
      PVector rotated = matrixToVec(matmul(rotationY, v));
      rotated = matrixToVec(matmul(rotationX, rotated));
      rotated = matrixToVec(matmul(rotationZ, rotated));
    }
    
  }
  
  void update(){};

}
