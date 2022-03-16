import processing.sound.*;

SoundFile moosic;
int pause = 2;
Amplitude amp;
float vol;
float y;
int x = 0;
int inc = 0;
float len;

void setup(){
  size(400,3000);
  background(200,100,0);
  
  moosic = new SoundFile(this, "./Breaka - We Move - 08 Solaria.mp3");
  len = moosic.duration();
  //len being the length of each segment in pixels
  len = (height/len) * 50;
  y = len;
  moosic.play();
  amp = new Amplitude(this);
  amp.input(moosic);
  
}

void draw(){
   fill(100,255,0);
   strokeWeight(2);
   vol = amp.analyze();
   println(vol);
   
   int prevX = x;
   x++;
   float prevY = y;
   y = map(vol, 0.0,1.0, (float)0+inc,(float)50+inc);
   
   line(prevX, prevY, x,y);
   if(x>400){
     x=0;
     inc += len;
     prevY = inc;
   }
}
