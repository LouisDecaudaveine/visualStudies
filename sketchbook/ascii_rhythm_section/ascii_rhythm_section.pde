int boxSize = 10;
int[][] world;
String brightness = " .:-=+*#%@";
String[] picAddress = {"src/ellipse.png","src/man.png","src/group.png"};
ArrayList<Letter> active;
ArrayList<ArrayList<int[]>> queue;
int x;
int y;
PImage img;

void setup(){
  size(800,800);
  background(10);
  //load first pic
  img = loadImage(picAddress[0]);
  active = new ArrayList<Letter>();
  initActive();
  queue = new ArrayList<ArrayList<int[]>>();
  initQueue();
  setDests();
}

void draw(){
  //image(img,0,0);
  background(30);
  showGrid();
  if(!checkAll())updateAll();
  else noLoop();
  
}

void initActive(){
  for(int boxX = 0; boxX < width/boxSize; boxX++){
    for (int boxY = 0; boxY < height/boxSize; boxY++){
      int x = boxX*boxSize;
      int y = boxY*boxSize;
      int col = avrB(x, y);
      if(col > 0) active.add(new Letter(x, y, col));
    }
  }
}

//average Brightness within a box
int avrB(int x, int y){
  int avrB = 0;
  for(int xX = x; xX<x+boxSize;xX++){
    for(int yY = y; yY<y+boxSize;yY++){
      avrB+=red(color(img.pixels[xX+img.width*yY]));
    }
  }
  avrB = avrB/(boxSize*boxSize);
  return avrB;
} 

void initQueue(){
  for(int i = 1; i<picAddress.length; i++){
    img = loadImage(picAddress[i]);
    ArrayList<int[]> nextImg = new ArrayList<int[]>();
    for(int boxX = 0; boxX < width/boxSize; boxX++){
      for (int boxY = 0; boxY < height/boxSize; boxY++){
        int x = boxX*boxSize;
        int y = boxY*boxSize;
        int col = avrB(x, y);
        int[] arr = {x,y,col};
        if(col > 0) nextImg.add(arr);
      }
    }
    queue.add(nextImg);
  }
  img = loadImage(picAddress[0]);
}

void showGrid(){
  for(int i = 0; i<active.size();i++){
    Letter cur = active.get(i);
    cur.show();
  }
}

void setDests(){
  /////////
  //whole section on different amount of characters in drawing
  /////////
  int dif = queue.get(0).size() - active.size();//if negative some pixels will go kapoot and if positive some will have to be made
  if(dif>0){
    for(int i = 0; i<dif; i++){
      int[] info = queue.get(0).get(queue.get(0).size()-i);
      Letter newL = new Letter(info[0],info[1],0);
      //update state to growing
      newL.setColState(3);
      active.add(newL);//adds the last elements of queue
    }
  }
  else if(dif>0){
    for(int i = 0; i<dif; i++){
      //may have to add -1 to get statement
      active.get(active.size()-i).setColState(0);
    }
  }
  ////////
  //for the common areas
  ////////
  for(int i = 0; i<queue.get(0).size(); i++){
    int[] info = queue.get(0).get(i);
    active.get(i).setDes(info[0],info[1],info[2]);
  }
  print("all set!");
}

Boolean checkAll(){
  for(Letter let : active){
    if(!let.state) return false;
  }
  return true;
}

void updateAll(){
  for(Letter let : active){
    let.update();
  }
}
