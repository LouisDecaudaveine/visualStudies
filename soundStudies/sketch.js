let moosic
let pause = 2
let amp
let vol 
function preload(){
  soundFormats("mp3")
  moosic = loadSound("./Breaka - We Move - 08 Solaria.mp3")
}

function setup() {
  let can = createCanvas(400, 400);
  can.mousePressed(canvasPressed)
  amp = new p5.Amplitude()
}

function draw() {
  
  background(50);
  vol = amp.getLevel()
  let diag = map(vol, 0,1, 0,200)
  fill(100,255,100)
  ellipse(width/2, height/2 , diag, diag)

}

function canvasPressed(){
  pause++
  if (pause%2 == 0){
    moosic.play()
  }else{
    moosic.pause()
  }
  

}