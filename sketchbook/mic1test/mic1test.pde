import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[256];
int boxSize = 16;
//Grid world;

void setup() {
  size(512, 512);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
  //world = new Grid(boxSize);
  //world.init();
}      

void draw() {    
  background(60,0,0);
  fft.analyze(spectrum);
  //noLoop();
  //world.updateAll(spectrum);
  //world.show();

  

  for(int i = 0; i < bands/2; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  strokeWeight(2);
  stroke(255);
  line( width/2-i*2, height/2, width/2-i*2, height/2 - spectrum[i]*height*10 );
  line( width/2-i*2, height/2, width/2-i*2, height/2 + spectrum[i]*height*10 );
  line( width/2+i*2, height/2, width/2+i*2, height/2 - spectrum[i]*height*10 );
  line( width/2+i*2, height/2, width/2+i*2, height/2 + spectrum[i]*height*10 );
  } 
}
