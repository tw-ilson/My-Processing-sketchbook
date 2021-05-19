
PVector v = new PVector(100,75, 50);

float[][] vecToMatrix(PVector v) {
  float[][] m = new float[3][1];
  m[0][0] = v.x;
  m[1][0] = v.y;
  m[2][0] = v.z;
  return m;
}

PVector matrixToVec(float[][] m) {
  PVector v = new PVector();
  v.x = m[0][0];
  v.y = m[1][0];
  if(m.length>2)
    v.z = m[2][0];
  return v;
}

float[][] projection =  {
  {1,0,0},
  {0,1,0}
};
  

void logMatrix(float[][] m) {
   int cols = m[0]. length;
   int rows = m.length;
   println(rows + "x" + cols);
   println("----------------");
   for (int i = 0; i< rows; i++){
    for (int j = 0; j<cols; j++){
      print(m[i][j] + "  ");
    }
    println();
   }
   println();
}

float[][] matmul(float[][] a, PVector b) {
 float[][] m = vecToMatrix(b);
 return matmul(a, m);
}

float[][] matmul(float[][] a, float[][] b) {
  int colsA = a[0].length;
  int rowsA = a.length;
  int colsB = b[0].length;
  int rowsB = b.length;
  
  if (colsA != rowsB){
    println("matrix multiplication size incompatable");
    return null;
  }
  
  float result[][] = new float[rowsA][colsB];
  
  for (int i = 0; i< rowsA; i++){
    for (int j = 0; j<colsB; j++){
      float sum = 0;
      for(int k = 0; k<colsA; k++){
        sum +=  a[i][k] * b[k][j];
      }
      result[i][j] = sum;
    }
  }
  return result;
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
        if (brightness(arr[j]) > brightness(arr[j+1])){
            //swap(&arr[j], &arr[j+1]);
             color temp = arr[j];
             arr[j] = arr[j+1];
             arr[j+1] = temp;
        }
            
    }
    }
    return arr;
}  
