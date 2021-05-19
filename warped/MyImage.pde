public class MyImage{
  PImage source;
  color[][] Pixels;
  
  MyImage(PImage src){
    source = src;
    Pixels = new color[source.width][source.height];
    for(int i = 0; i < source.width; i++){
      for(int j =0; j<source.height; j++){
        
      }
    }
  }
  
  
  void bubbleSort(int[] arr) {  
        int n = arr.length;  
        int temp = 0;  
         for(int i=0; i < n; i++){  
                 for(int j=1; j < (n-i); j++){  
                          if(arr[j-1] > arr[j]){  
                                 //swap elements  
                                 temp = arr[j-1];  
                                 arr[j-1] = arr[j];  
                                 arr[j] = temp;  
                         }  
                          
                 }  
         }  
}
}
