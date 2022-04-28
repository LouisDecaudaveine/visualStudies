//You need to make the boxSize in grid be: width % boxSize == 0 and height % boxSize == 0

Grid world;
Particles parts;
void setup(){
  size(800,800);
  background(0);
  world = new Grid();
  parts = new Particles(world);
  
}

void draw(){
  background(0);
  stroke(0);
  ArrayList<Integer> inBlob = parts.inBlob();
  world.updateAll(inBlob);
  // world.showGrid();
  world.showLines();
  //parts.show();
  parts.update();
  // noLoop();
  
  if(frameCount < 900){
    saveFrame("output/tan_####.png");
  }
}
