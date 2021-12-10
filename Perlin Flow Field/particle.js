function Particle(){
  this.pos = createVector(random(0,windowWidth),random(0,windowHeight))
  this.vel = createVector(0,0)
  this.acc = createVector(0,0)
  this.prevPos = createVector(0,0)
  this.maxVel = 4
  // this.history = []
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
    this.r += 3 * this.rInc
    this.g += 0 * this.gInc
    this.b += 2 * this.bInc

    if(this.r > 255 || this.r < 0)  this.rInc  *=  -1;
    if(this.g > 100 || this.g < 0) this.gInc *= -1;
    if(this.b > 100 || this.b < 100) this.bInc *= -1;
  }

  this.appyForce = (force) => {
    this.acc.add(force)
  }

  this.show = () => {
    stroke(this.r,this.g,this.b,100)
    // stroke(0, 50)
    // noFill()
    
    // for(let i=0; i<this.history.length;i++){
    //   console.log(this.history)

    //   beginShape()
    //   for(let p; p< this.history[i].length; p++){
    //     let pos = this.history[i][p]
    //     vertex(pos.x, pos.y)
    //   }
    //   endShape()
    // }
    line(this.prevPos.x,this.prevPos.y,this.pos.x,this.pos.y)
    
  }

  this.follow = (flowfield) => {
    let x = floor(this.pos.x / scl)
    let y = floor(this.pos.y / scl)
    let index = x + y * col
    let force = flowfield[index]
    this.appyForce(force)
  }

  // this.upHistory = () => {
  //   let size = 0
  //   let v = createVector(this.pos.x, this.pos.y)
  //   if(this.pos.x <= 0 || this.pos.Y <= 0 ||this.pos.x >= width || this.pos.y >= height) this.history.push([])
  //   this.history.push(v)
  //   for (let i; i<this.history.length; i++){
  //     size += this.history[i].length
  //   }
  //   if (size > 50){
  //     this.history[0].splice(0,1)
  //     if(this.history[0].length == 0)
  //     this.history.splice(0,1)
  //   }
  // }

  this.edges = () => {
    if(this.pos.x > width){this.pos.x = 0} 
    if(this.pos.x < 0){this.pos.x = width} 
    if(this.pos.y > height){this.pos.y = 0} 
    if(this.pos.y < 0){this.pos.y = height} 
  }

}