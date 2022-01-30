let moosic
let pause = 2
let amp
let vol 
let y 
let x = 0
let inc = 0
function preload(){
  y = 100
  soundFormats("mp3")
  moosic = loadSound("./Breaka - We Move - 08 Solaria.mp3")
}

function setup() {
  let can = createCanvas(400, 4000);
  can.mousePressed(canvasPressed)
  amp = new p5.Amplitude()
  background(200)
}

function draw() {
  fill(100,255,100)
  strokeWeight(3)
  vol = amp.getLevel()

  let prevX = x
  x++
  let prevY = y 
  y = map(vol, 0,1, 0+inc,100+inc)
  
  // point(x, height-y) 
  line(prevX,prevY, x,y)
  if (x>400){
    x=0
    inc+= 50
  }
}

function canvasPressed(){
  pause++
  if (pause%2 == 0){
    moosic.play()
  }else{
    moosic.pause()
  }
  

}