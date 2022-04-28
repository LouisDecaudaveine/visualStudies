int bs = 50;
float speed = PI/256;
float pos;

void setup(){
  size(800,800,P3D);
  background(0);
  pos = speed;
}

void draw(){
  background(0);
  translate(-width/4,0,-800);
  translate(0,height/4,-800+map(sin(pos),-1,1,600,1600));
  rotateY(PI/6);
  rotateX(PI/8);

  pos += speed;
  
  beginShape();
  for(int z = 0; z<800/bs;z++){
     for(int y = 0; y<height/bs;y++){
       for(int x = 0; x<width/bs;x++){
         noFill();
         stroke(255);
         //println("x: ", x*bs, "y: ", y*bs, "z: ", z*bs);
         //translate(x*bs,y*bs,z*bs);
         strokeWeight(3);
         stroke(map(x,0,width/bs,0,255),map(y,0,height/bs,0,255),map(z,0,800/bs,0,255));
         point(x*bs,y*bs,z*bs);
       }
     }
  }
  endShape();

    

}
