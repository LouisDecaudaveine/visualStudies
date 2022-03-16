class Letter{
  int x;
  int y;
  int desX;
  int desY;
  int desCol;
  String chara;
  Boolean state = false; //where false is in transition and true is at destination
  int colState = 2; //0 : kill the letter, 1 : reducing intensity, 2 : color dont change, 3 : increase the color 
  String alpha = " .:-=+*#%@";
  int alphaI;
  int m;
  int c;
  
  Letter(int xX, int yY, int col){
    x = xX;
    y = yY;
    alphaI = ascii(col);
    chara = String.valueOf(alpha.charAt(alphaI));
  }
  
  //sets the destination and direction
  // intensity is value between 0  and size-1 of alpha
  void setDes(int xX,int yY, int intensity){
    state = false;
    desX = xX;
    desY = yY;
    desCol = intensity;
    m = desY-y/abs(desX-x);
    c = y-m*x;
  }
  
  //display the letter
  void show(){
    stroke(255);
    textSize(boxSize);
    text(chara, x, y+boxSize);
  }
  

 
  void update(){
    //check if letter has finished transforming
    if(x == desX && y == desY && alphaI == desCol) state = true;
    //moves the letter around
    if (desX-x<0)x -= boxSize;
    else x += boxSize;
    y = x*m + c;
    //changes the colour
    if(colState == 0) {
      desCol = 0;
      colState = 1;
    }
    else if(colState == 1) alphaI-=1;
    else if(colState == 3) alphaI+=1;
  }
  
  //gets the associated ascii character to brightness
  int ascii(int col){
    int brDis = floor(255/alpha.length());
    for(int x = 0; x< brightness.length(); x++){
      if(col>255-brDis*x) return(alpha.length()-x);
    }
    return 0;
  }
  
  void setColState(int state){
    colState = state;
  }
}
