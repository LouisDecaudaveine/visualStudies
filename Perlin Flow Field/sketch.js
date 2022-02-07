
const inc = 0.1
const scl = 20
let col 
let row
let zoff = 0
let particles = []
let flowfield;
let maxLoop = 0

function setup() {
  createCanvas(windowWidth, windowHeight);
  // createCanvas(200,200)
  background(0)
  col = floor(width/scl)
  row = floor(height/scl)
  fr = createP('')

  for(let i=0; i<1000; i++){
    particles[i] = new Particle() 
  }
  flowfield = new Array(col*row)
}

function draw() {

  if (frameCount === 1){
    capturer.start()
  }

  // background(255)
  let yoff = 0
  for(let y = 0; y<row; y++){

    let coY = scl*y
    yoff += inc
    let xoff = 0

    for(let x = 0; x<col; x++){

      xoff += inc
      r = noise(xoff,yoff, zoff)
      let angle = r * TWO_PI
      let coX = scl*x 
      let v = p5.Vector.fromAngle(angle)
      v.setMag(0.9)
      let index = x + y * col
      flowfield[index] = v
      //drawing the vectors of each section of the image

      // push()
      // strokeWeight(3)
      // stroke(0,0,0,100)
      // translate(coX, coY)
      // rotate(v.heading())
      // line(0,0,scl, 0)
      // pop()

      // strokeWeight(1)
      // fill(r*255)
      // rect(coX,coY,col,row)

    }
  }
  zoff += inc*0.1
  strokeWeight(1)
  for(let i=0; i<particles.length;i++){
    particles[i].follow(flowfield)
    particles[i].update()
    // particles[i].upHistory()
    particles[i].show()
    particles[i].edges()

  }

  if (frameCount < 60*10){
    capturer.capture(canvas)
  }else if(frameCount === 60*10){
    capturer.save()
    capturer.stop()
  }


  fr.html(floor(frameRate()))
  // maxLoop++
  // if(maxLoop > 10){
  //   noLoop()
  // }
}


