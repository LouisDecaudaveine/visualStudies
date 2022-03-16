float x;
//float prevX;
float y;
//float prevY;
float inc = TWO_PI/width*2;
float pos = 0;

void setup(){
  size(800, 800);
  background(0);
}

void draw(){
  background(0);  
  pos += inc;
  //if (pos*50 > width){
  //  pos = 0;
  //
  //}
  //changing ratio of pos changes the speed the smaller the slower
  //basically making the incrament smaller
  y = sin(pos/2)*height/4 + height/2;
  
  
  
  stroke(255);
  line(0,y,width,y);
  fill(0);
  rect(0,0,width,y);
  fill(145);
  rect(0,y,width,height-y);
  //ellipse(pos*50,y, 15,15);
}
