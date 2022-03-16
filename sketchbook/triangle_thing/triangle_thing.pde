import processing.sound.*;


SoundFile file;
FFT fft;
AudioIn in;
int totalFrames;
int frameIndex = 0;
int recIndex = 0;
float[][] volumes;
ArrayList<float[]> refVolumes = new ArrayList<float[]>();

Boolean dataCheck = true;
int bands = 16;
float[] spectrum = new float[bands];
int ps = 50; //point spacing
float rot = 0;
float speed = PI/(256*2);
float xoff = 0;
int col = 0;

void setup(){
  size(800,800,P3D);
  background(0);
  fft = new FFT(this, bands);
  //in = new AudioIn(this, 0);
  file = new SoundFile(this, "./WTCHCRFT short.mp3");
   // start the Audio Input
  //in.start();
  totalFrames = floor(file.duration()*30);
  volumes = new float[totalFrames][bands];
  fft.input(file);
  file.play();
  
  // patch the AudioIn
  
}

void draw(){
  frameRate(30);
  //fft.analyze(spectrum);
  if(frameIndex < totalFrames && dataCheck){
    fft.analyze(spectrum);
    float[] inter = new float[bands];
    for(int i= 0; i<bands;i++){inter[i] = spectrum[i];}
    volumes[frameIndex] = inter;
    //for(float num : refVolumes.get(frameIndex)){print(num);}
    //print("\n");
    frameIndex++;
  } else {
    //for(float[] nums : volumes){print("\n");for(float num : nums)print(num);}
    //noLoop();
    print("\n");
    background(0);
    noFill();
    stroke(255,255-col,255-col);
    translate(width/2,height/2);
    rotateX(PI/3.4);
    rotateZ(PI/2);
    //rotateZ(rot);
    translate(-9*width/16, -height/2,0);
    
    rot+= speed;
    plane(volumes[recIndex]);
    //for(float[] volume : volumes){print("\n");for(float num : volume){print(num);}}
  
    if(recIndex < totalFrames) {
      saveFrame("output/tan_####.png");
     }
    recIndex++;
  }
}

void plane(float[] spectrum){
  col = 0;
  int index = 0;
  for(int y = 0; y<width; y+=ps){
    beginShape(TRIANGLE_STRIP);
    xoff = 0;
    for(int x = 0; x<height+ps; x+=ps){
      if(index == 0) xoff = spectrum[index]*300*1/7;
      else  xoff = spectrum[index]*300*(index+1)/4;
      if(xoff>100) {
        xoff = 100;
        col = 255;
      }
      
      //vertex(x,y,random(-15,15));
      //vertex(x,y+ps,random(-15,15));
      vertex(x,y,xoff+random(-10,10));
      vertex(x,y+ps,xoff+random(-10,10));
    }
     endShape();
     index+=1;
  }
}
