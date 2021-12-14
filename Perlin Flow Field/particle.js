function Particle(){
  this.pos = createVector(random(0,windowWidth),random(0,windowHeight))
  this.vel = createVector(0,0)
  this.acc = createVector(0,0)
  this.prevPos = createVector(0,0)
  this.maxVel = 10
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
    stroke(255,0,0,150)
    noFill()
    for(let p = 0 ; p < this.history.length; p++){
      beginShape();
      let segment = this.history[p]
      for(let i = 0; i < segment.length; i++){
        let pos = segment[i]
        vertex(pos[0],pos[1])
      }
      endShape();
    }
  }

  this.follow = (flowfield) => {
    let x = floor(this.pos.x / scl)
    let y = floor(this.pos.y / scl)
    let index = x + y * col
    let force = flowfield[index]
    this.appyForce(force)
  }

  this.upHistory = () => {

    //Adding section to history
    let coord = [this.pos.x, this.pos.y]
    if(coord[0] < 0 || coord[0] > windowWidth  || coord[1] < 0 || coord[1] > windowHeight){
      this.history.push([])
      this.edges()
      coord = [this.pos.x, this.pos.y]
    }
    this.history[this.history.length-1].push(coord)
    
    //removing section from history
    let len = this.hisLen()
      if(len > 500){
        this.history[0] = this.history[0].slice(1)
      }
      if(this.history[0].length == 0) this.history = this.history.slice(1);

  }

  this.hisLen = () => {
    let histLen = 0
    for(let i = 0; i< this.history.length; i++){
      let section = this.history[i]
      histLen += section.length
    }
    return histLen
  }

  this.edges = () => {
    if(this.pos.x > windowWidth){this.pos.x = 0} 
    if(this.pos.x < 0){this.pos.x = windowWidth} 
    if(this.pos.y > windowHeight){this.pos.y = 0} 
    if(this.pos.y < 0){this.pos.y = windowHeight} 
  }
}