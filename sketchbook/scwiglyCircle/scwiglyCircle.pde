int depth = 100;
Section[] sections = new Section[depth];
float dx = 0.1;
float dy = 0.05;
float Xmovement = 0;
float Ymovement = 0;


void setup(){
  size(800,800);
  background(0);
  for(int i = 0; i<depth; i++){
    float size = i*15;
    sections[i] = new Section(width/2,height/2, size);
  }
}

void draw(){
  float Xdisplace = Xmovement;
  float Ydisplace = Ymovement;
  background(0);
  noFill();
  stroke(255);
  for(int i = 0; i<depth; i++){
    Xdisplace += dx;
    Ydisplace += dy;
    sections[i].update(sin(Xdisplace)*100+width/2,sin(Ydisplace)*100 + height/2);
    sections[i].show();
  }
  Xmovement += 0.05;
  Ymovement += 0.025;
}

//* pow(1.185,i);
