int boxSize = 10;
int[][] world;
String brightness = " .:-=+*#%@";
PImage img;
//0.299R + 0.587G + 0.114B

void setup(){
  size(800,800);
  background(0);
  world = grid();
  img = loadImage("Toade.png");
  
}

void draw(){
  background(0);
  image(img,0,0);
  loadPixels();
  strokeWeight(1);
  stroke(0);
  int[][] updatedWorld = grid();
  background(0);
  showGrid(updatedWorld);
  noLoop();
  saveFrame("asciiFrog.png");
}

void showGrid(int[][] grid){
  for(int x = 0; x< grid.length; x++){
    for(int y = 0; y< grid[x].length; y++){
      fill(grid[x][y]);
      if(grid[x][y]>10){
        String text = String.valueOf(ascii(grid[x][y]));
        textSize(10);
        text(text, x*boxSize, y*boxSize+boxSize);
      }
    }
  }
}

//gets the associated ascii character to brightness
char ascii(int col){
  int brDis = floor(255/brightness.length());
  for(int x = 1; x< brightness.length(); x++){
    //print(brightness.length()-x);
    if(col>255-brDis*x) return(brightness.charAt(brightness.length()-x));
  }
  return brightness.charAt(0);
}

int avrB(int x, int y){
  loadPixels();
  int avrB = 0;
  for(int xX = x; xX<x+boxSize;xX++){
    for(int yY = y; yY<y+boxSize;yY++){
      avrB+=red(color(pixels[xX+width*yY]))*0.299;
      avrB+=green(color(pixels[xX+width*yY]))*0.587;
      avrB+=blue(color(pixels[xX+width*yY]))*0.11;
    }
  }
  avrB = avrB/(boxSize*boxSize);
  //if(avrB>10)println(avrB);
  return avrB;
} 

int[][] grid(){
  int[][] world = new int[width/boxSize][height/boxSize];
  for(int boxX = 0; boxX < width/boxSize; boxX++){
    for (int boxY = 0; boxY < height/boxSize; boxY++){
      // place the average colour brightness val into box
      int x = boxX*boxSize;
      int y = boxY*boxSize;
      world[boxX][boxY] = avrB(x, y);
    }
  }
  return world;
}
