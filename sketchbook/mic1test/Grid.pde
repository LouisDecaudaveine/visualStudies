
class Grid {
  Box[] world;
  //amount of boxes on x axis
  int boxX;
  int boxSize;
  
  Grid(int boxS){
    this.boxSize = boxS;
    boxX = width/boxS;
    world = new Box[boxX*boxX];
  }
  
  //sets up a list of boxes
  void init(){
     for(int i = 0; i < boxX; i++){
       for(int j = 0; j < boxX; j++){
          int index = i*boxX + j;
          world[index] = new Box(i*boxSize, j*boxSize, boxSize);
       }
     }
  }
  
  //returns the box object
  Box getVal(int index){
    return world[index];
  }
  
  void setVal(Box m, int x, int y){
    world[x*boxX + y] = m;
  }
  
  //updates the colours of each box
  void updateAll(float[][] newData){
    for(int i = 0; i < world.length; i++){
      int [] colours = {(int)newData[i][0], (int)newData[i][1], (int)newData[i][2]};
      world[i].setCol(colours);  
    }
  }
  
  //updates it for grayscale values
  void updateAll(float[] newData){
    for(int i = 0; i < world.length; i++){
      int [] colours = {(int)newData[i], (int)newData[i], (int)newData[i]};
      world[i].setCol(colours);  
    }
  }
  
  //display the grid
  void show(){
    for(int i = 0; i < boxX*boxX; i++){
       this.getVal(i).show();
    }
  }
}
