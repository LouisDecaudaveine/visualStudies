
Particle p;

void setup(){
  size(600, 600);
  background (100,100, 0);
  p = new Particle();
}

void draw(){
  background (100,100, 0);
  p.show();
  p.update();
}
