class Particles{
  ArrayList<Particle> parSet = new ArrayList<>();
  int parCount = 5;
  Grid world;
  
  
  Particles(Grid w){
    world = w;
    for(int i = 0; i<parCount;i++){
      parSet.add(new Particle(world.boxSize));
    }
  }
  
  void show(){
    for(Particle par : parSet){
      par.show();
    }
  }
  
  ArrayList<Integer> inBlob(){
    ArrayList<Integer> in = new ArrayList<>();
    for(Particle par : parSet){
      in.addAll(par.getBoxCoords());
    }
    return in;
  }
  
  void update(){
   for(Particle par : parSet){
      par.update();
    }
  }
}
