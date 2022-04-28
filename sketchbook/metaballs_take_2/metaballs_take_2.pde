Grid world;
Circles cir;

void setup(){
  size(800,800);
  background(0);
  world = new Grid(10);
  cir = new Circles();
}


void draw(){
  frameRate(60);
  background(0);
  
  //world.showBalls();
  world.update(); 
  //world.show();
  world.showLines();
  //noLoop();
}
