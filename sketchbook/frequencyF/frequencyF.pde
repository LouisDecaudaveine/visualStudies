import processing.sound.*;

SoundFile moosic;
FFT fft;
int w = 512;
int boxSize = 16;
int bands = w/boxSize; //<>//
int bandsc = bands;
float[] spectrum = new float[bands];
float lev;


void setup(){
  frameRate(30);
  
  moosic = new SoundFile(this, "./Oyubi_Earnin It_short.mp3");
  fft = new FFT(this, bands);
  moosic.play();
  fft.input(moosic);
  
  size(512,512);
  background(0);
}

void draw(){
  fft.analyze(spectrum);
  for(int x = 0; x<bands; x++){  //<>//
    for (int y = 0; y<bands; y++){ //<>//
      lev = map(spectrum[x]+spectrum[y], 0,3,0,255);
      fill(lev,0,0);
      rect(x*boxSize,y*boxSize, boxSize, boxSize);
      rect(width - (x+1)*boxSize,height- (y+1)*boxSize, boxSize, boxSize);
    }
  }
  saveFrame("output/tan_####.png");
  print(frameRate);
}
