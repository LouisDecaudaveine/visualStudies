class Grid{
  int boxSize;
  int boxCountX;
  int boxCountY;
  float opac = 0;
  int[][] boxColVal;
  int[][] boxBinVal;
  Boolean[][] inBlob;
  Circles balls;
  
  Grid(int bs){
    boxSize = bs;
    boxCountY = height/boxSize;
    boxCountX = width/boxSize;
    boxColVal = new int[boxCountY][boxCountX];
    boxBinVal = new int[boxCountY][boxCountX];
    inBlob = new Boolean[boxCountY][boxCountX];
    balls = new Circles();
  }
  
  void show(){
    for(int y = 0; y<boxCountY; y++){
     for (int x = 0; x<boxCountX; x++){
       noStroke();
       fill(boxColVal[y][x]);
       rect(x*boxSize, y*boxSize, boxSize,boxSize);
     }
    }
  }
  void showBalls(){
    balls.showAll();
  }
  
  void resetIn(){
    for(int y = 0; y<boxCountY;y++){
      for(int x = 0; x<boxCountX;x++){
        inBlob[y][x] = false;
      }
    }
  }
  
  void update(){
    resetIn();
    balls.updateAll();
    balls.checkAll();
    boxColVal = updateCol();
    boxBinVal = binVals();
    opac += PI/128;
  }
  
  int[][] updateCol(){
    int[][] updated = new int[boxCountY][boxCountX];
    for(int y = 0; y<boxCountY; y++){
      for(int x = 0; x<boxCountX; x++){
        updated[y][x] = colVal(x*boxSize,y*boxSize);
      }
    }
    return updated;
  }
  
  int colVal(int x, int y){
    float col = 0;
    for(Circle ball : balls.circles){
      col += (ball.r*ball.r)/( pow(x - ball.position.x,2) + pow(y - ball.position.y,2));
    }
    if(col>2) col = 2;
    if(col<0.7) col = 0;
    int ret = floor(map(col,0,2,0,255));
    return ret;
  } 
  
  //i know this is rly bad practice but whatever
  int[][] binVals(){
    int[][] binValues = new int[boxCountY][boxCountX];
    for(int y = 0; y<boxCountY; y++){
      for(int x = 0; x<boxCountX; x++){
        int binVal = 0;
        if(boxColVal[y][x] > 0) binVal += 8;
        if(x+1<boxCountX)if(boxColVal[y][x+1] > 0) binVal += 4;
        if(y+1<boxCountY)if(boxColVal[y+1][x] > 0) binVal += 1;
        if(y+1<boxCountY && x+1<boxCountX)if(boxColVal[y+1][x+1] > 0) binVal += 2;
        if(binVal == 15) {
          binVal = floor(random(1,15));
          inBlob[y][x] = true;
        }
        binValues[y][x] = binVal;
      }
    }
    return binValues;
  }
  
  
  int[] lineFinder(int binVal, int x, int y){
    /* do function here which takes box and turns it into an array of bin values,
    goes through values and spits out decimal val*/
    switch(binVal){
      case 0:
        return new int[] {0};
      case 1:
        return new int[] {x, y+floor(boxSize/2), x+floor(boxSize/2), y+boxSize};
      case 2:
        return new int[] {x+floor(boxSize/2),y+boxSize,x+boxSize,y+floor(boxSize/2)};
      case 3:
        return new int[] {x,y+floor(boxSize/2),x+boxSize,y+floor(boxSize/2)};
      case 4:
        return new int[] {x+floor(boxSize/2), y,x+boxSize,y+floor(boxSize/2)};
      case 5:
        int[] middle = {x, y+floor(boxSize/2),x+floor(boxSize/2),y,
                        x+floor(boxSize/2),y+boxSize,x+boxSize,y+floor(boxSize/2)};
        return middle;
      case 6:
        return new int[] {x+floor(boxSize/2),y,x+floor(boxSize/2),y+boxSize};
      case 7:
        return new int[] {x, y+floor(boxSize/2),x+floor(boxSize/2), y};
      case 8:
        return new int[] {x, y+floor(boxSize/2),x+floor(boxSize/2), y};
      case 9:
        return new int[] {x+floor(boxSize/2),y,x+floor(boxSize/2),y+boxSize};
      case 10:
        int[] mid = {x, y+floor(boxSize/2),x+floor(boxSize/2),y+boxSize,
                     x+floor(boxSize/2),y,x+boxSize, y+floor(boxSize/2)};
        return mid;
      case 11:
        return new int[] {x+floor(boxSize/2), y,x+boxSize,y+floor(boxSize/2)};
      case 12:
        return new int[] {x,y+floor(boxSize/2),x+boxSize,y+floor(boxSize/2)};
      case 13:
        return new int[] {x+floor(boxSize/2),y+boxSize,x+boxSize,y+floor(boxSize/2)};
      case 14:
        return new int[] {x, y+floor(boxSize/2), x+floor(boxSize/2), y+boxSize};
      case 15:
        return new int[] {0,0};
      default:
        int[] def = {0,0,0,0};
        return def;
    }
  }
  
  void showLines(){
    //sin between -1 and 1 if you make 2nd and 3rd wider then less opacity variation
    int strokeCol = floor(map(sin(opac),-1.5,1.7,0,255));;
    for(int y = 0; y<boxCountY;y++){
      for(int x = 0; x<boxCountX; x++){
        if(!inBlob[y][x])stroke(255,0,0);
        else stroke(strokeCol,0,0);
        strokeWeight(3);
        //stroke(255,0,0);
        int[] coords = lineFinder(boxBinVal[y][x],x*boxSize, y*boxSize);
        if(coords.length==4){
          line(coords[0],coords[1],coords[2],coords[3]);
        }else if(coords.length==8){
          line(coords[0],coords[1],coords[2],coords[3]);
          line(coords[4],coords[5],coords[6],coords[7]);
        } 
      }
    }
  }
  
  
}
