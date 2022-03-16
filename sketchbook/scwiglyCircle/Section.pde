class Section{
  float x;
  float y;
  float size;
  
  Section(int x, int y, float size){
     this.x = x;
     this.y = y;
     this.size = size;
  }
  
  void show(){
    ellipse(x,y,size,size);
  }
  
  void update(float x, float y){
    this.x = x;
    this.y = y;
  }
}
