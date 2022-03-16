int boxSize = 20;
int[] world;
int row;
float[] colSec = {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1};
String[] chara = {" ",".",":","-","=","+","*","#","%","@"};
float xoff = 0;
float detail = 0.01;
float inc = 0.1;
float speed = 0.01;
  

void setup(){
  noiseDetail(8,detail);
  size(800,800);
  background(0);
  row = width/boxSize;
  world = new int[row*row];
  grid();
}

void draw(){
  background(0);
  noiseCol();
  grid();
}

void grid(){
  for(int boxX = 0; boxX < row; boxX++){
    for (int boxY = 0; boxY < row; boxY++){
      int x = boxX*boxSize;
      int y = boxY*boxSize;
      stroke(120);
      //fill(world[boxX+boxY*row]);
      //rect(x,y,boxSize,boxSize);
      textSize(boxSize);
      text(chara[world[boxX+boxY*row]], x+5,y+15);
    }
  }
}

float segment(float col){
  float coll = 0;
   for(int c = 0; c<colSec.length;c++){
        if (col<= colSec[c]) return coll = colSec[c];
      }
      return coll;
}

void noiseCol(){
  xoff = 0;
  for (int x = 0; x< row; x++){
    xoff += inc;
    float yoff = 0;
    for (int y = 0; y<row;y++){
      yoff += inc;
      //this is where the noise value is taken for each pixel
      //float coef = segment(noise(xoff,yoff, frameCount*speed))*255;
      float coef = segment(noise(xoff,yoff, frameCount*speed))*10;
      world[y+x*row] = (int)coef;
      //world[x+y*width] = color(coef);
    }
  }
}
