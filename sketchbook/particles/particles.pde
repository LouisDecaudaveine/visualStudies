

ArrayList<Particle> particles = new ArrayList<Particle>();

void setup(){
  size(1920,1080);
  background(40);
  
  
  for(int i=0;i<1000;i++){
     initParticle();
  }
}

void draw(){
  background(0);
  for(int i=0;i<particles.size();i++){
    Particle cur = particles.get(i);
    if(!cur.state) particles.remove(i);
    cur.update();
    cur.show();
  }
  if(frameCount%3==0)initParticle();
}

void initParticle(){
   int[] coords = new int[4];
    coords[0] = floor(random(0,width));
    coords[1] = floor(random(0,height));
    coords[2] = floor(random(5,30));
    coords[3] = floor(random(5,30));
    Particle temp = new Particle(coords);
    particles.add(temp);
}
