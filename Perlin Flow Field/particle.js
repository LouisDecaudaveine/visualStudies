function Particle(){
  this.pos = createVector(random(0,200),random(0,200))
  this.vel = createVector(0,0)
  this.acc = createVector(0,0)
  this.prevPos = createVector(0,0)
  this.maxVel = 4
  this.history = [[]]
  this.r = 0
  this.g = 0
  this.b = 0

  this.rInc = 1
  this.gInc = 1
  this.bInc = 1

  

  this.update = () => {
    this.prevPos = this.pos.copy()
    this.pos.add(this.vel)
    this.vel.limit(this.maxVel)
    this.vel.add(this.acc)
    this.acc.mult(0)
    this.r += 2 * this.rInc
    this.g += 0 * this.gInc
    this.b += 0 * this.bInc

    if(this.r > 255 || this.r < 0)  this.rInc  *=  -1;
    if(this.g > 255 || this.g < 0) this.gInc *= -1;
    if(this.b > 255 || this.b < 100) this.bInc *= -1;
  }

  this.appyForce = (force) => {
    this.acc.add(force)
  }

  this.show = () => {
    stroke(this.r,this.g,this.b,50)
    // stroke(0, 50)
    // noFill()
    beginShape()
    
    for(let p = 0 ; p < this.history.length; p++){
      let segment = this.history[p]
      for(let i = 0; i < segment.length; i++){
        let pos = segment[i]
        vertex(pos[0],pos[1])
      }
      
      
    }
    endShape()
    // }
    // line(this.prevPos.x,this.prevPos.y,this.pos.x,this.pos.y)
    
  }

  this.follow = (flowfield) => {
    let x = floor(this.pos.x / scl)
    let y = floor(this.pos.y / scl)
    let index = x + y * col
    let force = flowfield[index]
    this.appyForce(force)
  }

  this.upHistory = () => {
    let coord = [this.pos.x, this.pos.y]
    this.history[0].push(coord)
    // console.log(coord)
  }

  this.edges = () => {
    if(this.pos.x > width){this.pos.x = 0} 
    if(this.pos.x < 0){this.pos.x = width} 
    if(this.pos.y > height){this.pos.y = 0} 
    if(this.pos.y < 0){this.pos.y = height} 
  }
}