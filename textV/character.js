function Character(){
  this.charString = 'b'
  this.pos = {x: 0, y: 0}
  this.funcList = {}
  this.relX = 0
  this.relY = 0

  this.setPos = (position) => {
    this.pos = position
  }
  this.setRel = (x, y) => {
    this.relX = x
    this.relY = y
  }

  this.setChar = (character) => {
    this.charString = character
  }

  this.getCharFunc = () => {
    if(this.charString == ' ')this.funcList['space']();
    else if(this.charString == '.')this.funcList['dot']();
    else if(this.charString == ',')this.funcList['comma']();
    else {this.funcList[this.charString]()}
    strokeWeight(0)
    rect(this.pos.x, this.pos.y, this.relX, this.relY)
  }

  this.setPos = (x, y) => {
    this.pos.x = x
    this.pos.y = y
  }

  //EACH CHARACTER REP
  this.funcList.a = () => {
    fill('blue')
  }
  this.funcList.b = () => {
    fill('red')
  }
  this.funcList.c = () => {
    fill("orange")
  }
  this.funcList.d = () => {
    fill("purple")
  }
  this.funcList.e = () => {
    fill('yellow')
  }
  this.funcList.f = () => {
    fill("magenta")
  }
  this.funcList.g = () => {
    fill("green")
  }
  this.funcList.h = () => {
    fill("cyan")
  }
  this.funcList.i = () => {
    fill(230,170,30)
  }
  this.funcList.j = () => {
    fill("black")
  }
  this.funcList.k = () => {
    fill(134,23,234)
  }
  this.funcList.l = () => {
    fill(34,123,234)
  }
  this.funcList.m = () => {
    fill(34,123,34)
  }
  this.funcList.n = () => {
    fill(212,123,34)
  }
  this.funcList.o = () => {
    fill(2,123,34)
  }
  this.funcList.p = () => {
    fill(2,223,234)
  }
  this.funcList.q = () => {
    fill(66,166,255)
  }
  this.funcList.r = () => {
    fill(66,166,255)
  }
  this.funcList.s = () => {
    fill(30,240,70)
  }
  this.funcList.t = () => {
    fill(227, 165, 56)
  }
  this.funcList.u = () => {
    fill(69,42,096)
  }
  this.funcList.v = () => {
    fill(100,255,255)
  }
  this.funcList.w = () => {
    fill(204, 197, 144)
  }
  this.funcList.x = () => {
    console.log("x")
  }
  this.funcList.y = () => {
    fill(57, 204, 184)
  }
  this.funcList.z = () => {
    console.log("a")
  }
  this.funcList.space = () => {
    fill(143,166,255)
  }
  this.funcList.dot = () => {
    console.log(".")
  }
  this.funcList.comma = () => {
    console.log(",")
  }
}