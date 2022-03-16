class Box{
  int x; 
  int y;
  float size;
  int[] colour = new int[3];
  
  Box(int i, int j, float m){
    x = i;
    y = j;
    size = m;
    colour[0] = 50;
    colour[1] = 50;
    colour[2] = 50;
  }
  
  Box(int i, int j, float m, int r, int g, int b){
    x = i;
    y = j;
    size = m;
    colour[0] = r;
    colour[1] = g;
    colour[2] = b;
  }
  
  void setCol(int[] cols){
    colour[0] = cols[0];
    colour[1] = cols[1];
    colour[2] = cols[2];
  }
  
  void show(){
    fill(colour[0],colour[1],colour[2]);
    rect(x,y,size,size);
  }
}
