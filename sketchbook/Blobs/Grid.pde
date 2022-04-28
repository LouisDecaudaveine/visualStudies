class Grid{
  int boxSize = 25;
  int widthRep = floor(width/boxSize);
  int heightRep = floor(height/boxSize);
  ArrayList<Box> world = new ArrayList<Box>();
  ArrayList<int[]> paths;
  
  
  Grid(){
    for(int x = 0;x<widthRep;x++){
      for(int y = 0;y<heightRep;y++){
        world.add(new Box(boxSize,boxSize*x,boxSize*y));
      }
    }
  }
  
  void showGrid(){
    for(int i = 0; i<world.size(); i++){
      world.get(i).show();
    }
  }
  
  void updateAll(ArrayList<Integer> inBlob){
    for(int i = 0; i<world.size(); i++){
      if(contains(inBlob,i))world.get(i).setIntensity(40);
      else world.get(i).setIntensity(255);
    }
    
    binVals();
    
    //console stuff
    // for(int w = 0; w<widthRep;w++){
    //   print("hello");
    //   for(int h =0; h<heightRep;h++){
    //     // print(world.get(w*widthRep+h).binVal);
    //   }
    // }
  }
  
  Boolean contains(ArrayList<Integer> list, int i){
    for(Integer num : list){
      if((int)num == i)return true;
    }
    return false;
  }
  
  //this array takes the grid and adds a halo of boxes around it for edge cases
  ArrayList<Box> paddedGrid(){
    ArrayList<Box> paddedWorld = new ArrayList<>();
    //adding top padding
    for(int r = -1; r<widthRep+1;r++){
      Box padTop = new Box(boxSize,boxSize*r,-boxSize);
      padTop.setIntensity(255);
      paddedWorld.add(padTop);
    }
    
    for(int i = 0; i<heightRep;i++){
      //left padding
      Box leftPad = new Box(boxSize, -boxSize,boxSize*i);
      leftPad.setIntensity(255);
      paddedWorld.add(leftPad);
      //adding the actual world
      for(int p = 0; p<widthRep; p++){
        paddedWorld.add(world.get(i*heightRep+p));
      }
      //right padding
      Box RightPad = new Box(boxSize, width+boxSize,boxSize*i);
      leftPad.setIntensity(255);
      paddedWorld.add(RightPad);
    }
    //adding bottom padding
    for(int r = -1; r<widthRep+1;r++){
      Box padBot = new Box(boxSize,boxSize*r,height+boxSize);
      padBot.setIntensity(255);
      paddedWorld.add(padBot);
    }
    
    return paddedWorld;
  }
  
  //updates the binary values of each box representing a line
  void binVals(){
        ArrayList<Box> padded = paddedGrid();
        for(int i = 0; i<world.size();i++){
          int[] neighVals = new int[4];
          neighVals[0] = colFinder(i,0,padded);
          neighVals[1] = colFinder(i,1,padded);
          neighVals[2] = colFinder(i,2,padded);
          neighVals[3] = colFinder(i,3,padded);
          
          Box b = world.get(i);
          b.setBinVal(binCal(neighVals)-floor(random(0,15)));
          world.set(i,b);
        }

  }


  
  int binCal(int[] bin){
    int res = 0;
    for(int i = 0; i<bin.length;i++){
      res+= bin[i] * pow(2,i);
    }
    return res;
  }
  
  int colFinder(int index, int pos, ArrayList<Box> wor){
    Box b;
    //this finds the index in paddedWorld
    int paddedPos = pos + widthRep+3 + floor(index/widthRep)*2 ;
    switch(paddedPos){
      case 0:
        b = wor.get(index - widthRep+2-1);
      case 1:
        b = wor.get(index - widthRep+2+1);
      case 2:
        b = wor.get(index + widthRep+2+1);
      case 3:
        b = wor.get(index + widthRep+2-1);
      default:
        b = wor.get(index);
    }
    if(b.intensity<255) return 1;
    else return 0;
  }
 
  //exeptions are edges of canvas where each box touching edge has 2 0 values on it
  //going to make a 4 bit binary value groing top left, top right, bottom right, bottom left
  int[] lineFinder(int conner, Box curr){
    /* do function here which takes box and turns it into an array of bin values,
    goes through values and spits out decimal val*/
    int connerVal = conner;
    switch(connerVal){
      case 0:
        return new int[] {0};
      case 1:
        return new int[] {curr.x, curr.y+floor(boxSize/2), curr.x+floor(boxSize/2), curr.y+boxSize};
      case 2:
        return new int[] {curr.x+floor(boxSize/2),curr.y+boxSize,curr.x+boxSize,curr.y+floor(boxSize/2)};
      case 3:
        return new int[] {curr.x,curr.y+floor(boxSize/2),curr.x+boxSize,curr.y+floor(boxSize/2)};
      case 4:
        return new int[] {curr.x+floor(boxSize/2), curr.y,curr.x+boxSize,curr.y+floor(boxSize/2)};
      case 5:
        int[] middle = {curr.x, curr.y+floor(boxSize/2),curr.x+floor(boxSize/2),curr.y,
                        curr.x+floor(boxSize/2),curr.y+boxSize,curr.x+boxSize,curr.y+floor(boxSize/2)};
        return middle;
      case 6:
        return new int[] {curr.x+floor(boxSize/2),curr.y,curr.x+floor(boxSize/2),curr.y+boxSize};
      case 7:
        return new int[] {curr.x, curr.y+floor(boxSize/2),curr.x+floor(boxSize/2), curr.y};
      case 8:
        return new int[] {curr.x, curr.y+floor(boxSize/2),curr.x+floor(boxSize/2), curr.y};
      case 9:
        return new int[] {curr.x+floor(boxSize/2),curr.y,curr.x+floor(boxSize/2),curr.y+boxSize};
      case 10:
        int[] mid = {curr.x, curr.y+floor(boxSize/2),curr.x+floor(boxSize/2),curr.y+boxSize,
                     curr.x+floor(boxSize/2),curr.y,curr.x+boxSize, curr.y+floor(boxSize/2)};
        return mid;
      case 11:
        return new int[] {curr.x+floor(boxSize/2), curr.y,curr.x+boxSize,curr.y+floor(boxSize/2)};
      case 12:
        return new int[] {curr.x,curr.y+floor(boxSize/2),curr.x+boxSize,curr.y+floor(boxSize/2)};
      case 13:
        return new int[] {curr.x+floor(boxSize/2),curr.y+boxSize,curr.x+boxSize,curr.y+floor(boxSize/2)};
      case 14:
        return new int[] {curr.x, curr.y+floor(boxSize/2), curr.x+floor(boxSize/2), curr.y+boxSize};
      case 15:
        return new int[] {0};
      default:
        int[] def = {0,0,0,0};
        return def;
    }
  }
  
  
  //TODO

  void showLines(){
    for(Box b : world){
      strokeWeight(3);
      stroke(255,0,0);
      int[] coords = lineFinder(b.binVal,b);
      if(coords.length==4){
        line(coords[0],coords[1],coords[2],coords[3]);
      }else if(coords.length==8){
        line(coords[0],coords[1],coords[2],coords[3]);
        line(coords[4],coords[5],coords[6],coords[7]);
      }
      
    }
  }
  
  //////
  
  
}
