class Particle {
  float x;
  float y;
  
  Particle(){
    x = random(width);
    y = random(height);
  }
  
  void show(){
      ellipse(x, y, width/2, height/2);
  }
  
  void update(){
    x += random(-5,5);
    y += random(-5,5);
  }

}
