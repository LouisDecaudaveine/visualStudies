function Character(){
  this.charString = 'b'
  this.pos = 0
  this.funcList = {}

  this.setPos = (position) => {
    this.pos = position
  }

  this.setChar = (character) => {
    this.charString = character
  }

  this.getCharFunc = () => {
    this.funcList[this.charString]()
  }

  //EACH CHARACTER REP
  this.funcList.a = () => {
    ellipse(200,200,100,100)
  }
  this.funcList.b = () => {
    console.log("b")
  }
  this.funcList.c = () => {
    console.log("c")
  }
  this.funcList.d = () => {
    console.log("d")
  }
  this.funcList.e = () => {
    console.log("e")
  }
  this.funcList.f = () => {
    console.log("f")
  }
  this.funcList.g = () => {
    console.log("g")
  }
  this.funcList.h = () => {
    console.log("h")
  }
  this.funcList.i = () => {
    console.log("i")
  }
  this.funcList.j = () => {
    console.log("j")
  }
  this.funcList.k = () => {
    console.log("k")
  }
  this.funcList.l = () => {
    console.log("l")
  }
  this.funcList.m = () => {
    console.log("m")
  }
  this.funcList.n = () => {
    console.log("n")
  }
  this.funcList.o = () => {
    console.log("o")
  }
  this.funcList.p = () => {
    console.log("p")
  }
  this.funcList.q = () => {
    console.log("q")
  }
  this.funcList.r = () => {
    console.log("r")
  }
  this.funcList.s = () => {
    console.log("s")
  }
  this.funcList.t = () => {
    console.log("t")
  }
  this.funcList.u = () => {
    console.log("u")
  }
  this.funcList.v = () => {
    console.log("v")
  }
  this.funcList.w = () => {
    console.log("w")
  }
  this.funcList.x = () => {
    console.log("x")
  }
  this.funcList.y = () => {
    console.log("y")
  }
  this.funcList.z = () => {
    console.log("a")
  }
}