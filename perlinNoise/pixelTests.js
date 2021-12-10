//CODE MESSING WITH MANUAL PIXEL VALUES
let xoff = 0
let noo = 0.005
function setup() {
  createCanvas(1080, 720);
  pixelDensity(1);
}

function draw() {
  background(51);
  xoff += noo
  nono = noise(xoff)
  let colour = nono * 255

  loadPixels();
  for (let y=0;y<height;y++){
    for(let x=0; x<width;x++){
      let pixelNum = (x + y * width)*4
      pixels[pixelNum] = colour;
      pixels[pixelNum+1] = map(y+colour,0,975,0,255);
      pixels[pixelNum+2] = map(x+colour,0,1335,0,255);
      pixels[pixelNum+3] = 255;
    }
  }
  updatePixels();
}
