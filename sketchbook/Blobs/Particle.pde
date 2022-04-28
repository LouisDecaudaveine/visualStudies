class Particle {
  int x;
  int y;
  float noiseSeed = random(0,1000);
  int radi = floor(random(50,200));
  float speed = 0.01;
  float posX = noiseSeed;
  float posY = noiseSeed+50;
  
  
  //section to do with grid
  ArrayList<int[]> approx;
  int boxS;
  int widthRep;
  int heightRep;
  
  
  Particle(int boxSize){
    boxS = boxSize;
    widthRep = floor(width/boxS);
    heightRep = floor(height/boxS);
    x = floor(map(noise(posX),0,1,0,width));
    y = floor(map(noise(posY),0,1,0,height));
  }
  
  void show(){
    beginShape();
    fill(255,0,0);
    ellipse(x,y,5,5);
    noFill();
    stroke(255,0,0);
    ellipse(x,y,radi,radi);
    endShape();
  }
  
  void update(){
    posX+= speed;
    posY+= speed;
    x = floor(map(noise(posX),0,1,0,width));
    y = floor(map(noise(posY),0,1,0,height));
  }
  
  ArrayList<Integer> getBoxCoords(){
      ArrayList<Integer> approx = new ArrayList<>();
      for(int xX = 0; xX<widthRep;xX++){
        for(int yY = 0; yY<heightRep;yY++){
          float distFromR = (radi*radi);
          distFromR = distFromR/((xX*boxS-x)*(xX*boxS-x)+(yY*boxS-y)*(yY*boxS-y));
          //checking wherether the box is withing the range of the circle
          if(distFromR>0.7){
            approx.add(yY+xX*widthRep);
          }
        }
      }
      
      return approx;
  }
}
