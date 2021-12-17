//PROJECT IDEA:
//take a given text and generate a visual representation
//each character will have a different visual queue, there should be no randomness
//should be able to take image produceed and turn it back into text


//CHARACTER REPRESENTATION IDEAS:
//first split the image as equally as possible for each charater to be represented
//then certain characters can add effects, or certain characters at a certain point in the text(ex: the characters which are prime numbers add effects)

let text = "Poopy di scoop Scoop diddy whoop Whoop di coop di poop Poop di scoopty Scoopty whoop Whoopity scoop  whoop poop Poop diddy whoop scoop Poop poop Scoop diddy whoop Whoop diddy scoop Whoop diddy scoop poop"


let char = new Character()
let charCount = 0
text = text.toLocaleLowerCase()
let chara = []

function setup() {
  createCanvas(windowWidth, windowHeight);
  let bestFactors = factorFinder(text.length)
  let relX = Math.floor(width/bestFactors[0])
  let relY = Math.floor(height/bestFactors[1])
  
  for(let i = 0; i<text.length;i++){
    chara[i] = new Character()
    chara[i].setChar(text[i])
    chara[i].setRel(relX, relY)
  }

  for (let x = 0; x < bestFactors[0]; x++){
    for(let y = 0; y < bestFactors[1]; y++){
      let index = x*bestFactors[1] + y
      if(index < text.length){
        chara[index].setPos(x*relX, y*relY)
      }
    }
  }
}

function draw() {
  background(255);
  for(let i = 0; i<text.length;i++){
    chara[i].getCharFunc();
  }
  noLoop()
}

function factorFinder(num) {
  let smallestCouple = []
  let factors = []
  for(let i = 0; i<num; i++){
    if(num%i == 0){
      let otherF = num/i
      factors.push([i,otherF])
    }
  }
  let smallestDif = num
  for(let x=0; x<factors.length;x++){
    let dif = Math.abs(factors[x][0]-factors[x][1])
    if(dif < smallestDif) {
      smallestCouple = factors[x];
      smallestDif = dif
    }
  }
  if (factors.length  == 2) {
    smallestCouple = factorFinder(num+1)
  }
  return smallestCouple
}
 