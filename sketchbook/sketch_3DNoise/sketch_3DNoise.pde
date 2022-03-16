import processing.sound.*;
Amplitude amp; 
SoundFile file;
float volume;
int totalFrames;
int frameIndex = 0;
int recIndex = 0;
float[] volumes;


Polygones world;
float speed = PI/128*0.7;
float ror = 0;
void setup(){
  size(800,800,P3D);
  background(0);
  //file = new SoundFile(this, "./The intro mixed.mp3");
  //file = new SoundFile(this, "./Breaka - We Move - 08 Solaria.mp3");
  file = new SoundFile(this, "./tanhai_short.mp3");
  world = new Polygones();
  camera(width/2, -height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, 1, 0);
    
  file.play();
  amp = new Amplitude(this);
  amp.input(file);
  totalFrames = int(file.duration() * 30);
  volumes = new float[totalFrames];
}

void draw(){
  frameRate(30);
  if(frameIndex < volumes.length){
    volumes[frameIndex] = amp.analyze();
    frameIndex++;
  } else {
    background(0);
    float vol = world.segment(volumes[recIndex])*255;
    //println(volume);
    ror += speed;
    rotateX(PI/2);
    
    //translate(width/2,height/2,-200);
    rotateZ(ror);
    translate(-width/2,-height/2,0);
    
    //noFill();
    //stroke(255);
    //box(400,400,400);
    
    beginShape();
    for(int i = 0; i<world.polygones.size();i++){
      float z = -world.zVals.get(i);
      ArrayList<int[]>poly = world.polygones.get(i);
      float depth = z+vol/5+30;
      //float depth = z;
  
      world.showPoly(poly,depth,recIndex);
    }
    endShape();
    if(recIndex < totalFrames) {
      saveFrame("output/tan_####.png");
    }
    recIndex++;
  }
  
}
