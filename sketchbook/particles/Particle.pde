class Particle {
  int revsAlive;
  int[] coords = new int[4];
  Boolean state;
  int duration = 3000;
  
  Particle(int[]crds){
    for(int i=0;i<crds.length;i++){
      coords[i] = crds[i];
    }
    revsAlive = 0;
    state = true;
  }
  
  void update(){
    revsAlive++;
    state = calcState();
  }
  void show(){
    noFill();
    strokeWeight(3);
    stroke(map(coords[0],0,width,0,255),map(coords[1],0,height,0,255),map(coords[2],5,30,0,255));
    rect(coords[0],coords[1],coords[2],coords[3]);
  }
  
  Boolean calcState(){
    int probVal = floor(random(0,1)*(duration-revsAlive));
    
    if(probVal<1) return false;
    else return true;
  }
}
