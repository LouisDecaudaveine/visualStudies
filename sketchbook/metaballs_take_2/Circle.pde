class Circle{
  PVector position;
  PVector velocity;
  int r;
  
  Circle(){
    position = new PVector(floor(random(0,width)),floor(random(0, height)));
    velocity = PVector.random2D();
    velocity.mult(3);
    r = floor(random(30, 70));
  }
  
  void update(){
    position.add(velocity);
  }
  
  void boundaryCheck(){
     if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -1;
    } else if (position.x < r) {
      position.x = r;
      velocity.x *= -1;
    } else if (position.y > height-r) {
      position.y = height-r;
      velocity.y *= -1;
    } else if (position.y < r) {
      position.y = r;
      velocity.y *= -1;
    }
  }
  
  void show(){
    noFill();
    stroke(255,0,0);
    ellipse(position.x, position.y, r*2,r*2);
    stroke(0);
  }
}
