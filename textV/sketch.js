//PROJECT IDEA:
//take a given text and generate a visual representation
//each character will have a different visual queue, there should be no randomness
//should be able to take image produceed and turn it back into text


//CHARACTER REPRESENTATION IDEAS:
//first split the image as equally as possible for each charater to be represented
//then certain characters can add effects, or certain characters at a certain point in the text(ex: the characters which are prime numbers add effects)

let char = new Character()
let keyy = ''
let charCount = 0

function setup() {
  createCanvas(400, 400);
}

function keyTyped(){
  keyy = key
  charCount++
}


function draw() {
  background(220);
  char.setChar(key)
  if (charCount>0)char.getCharFunc();
}
