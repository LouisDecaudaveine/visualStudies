class Box{
  int size;
  int x;
  int y;
  int intensity = 255;
  int binVal;
  
  Box(int s,int xX,int yY){
    size = s;
    x = xX;
    y = yY;
  }
  
  void update(int intens){
    intensity = intens;
  }
  
  void show(){
    fill(intensity);
    rect(x,y,size,size);
  }
  
  void setIntensity(int val){
    intensity = val;
  }
  
  void setBinVal(int b){
    binVal = b;
  }
  
}
