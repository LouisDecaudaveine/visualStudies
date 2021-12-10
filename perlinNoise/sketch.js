//CODE MESSING WITH 2D PERLIN NOISE
let inc = 0.003
let xoff = 0
let yoff = 0
let startY = 0
let startX = 0
function setup() {
  createCanvas(720, 420);
  pixelDensity(1);
}

function draw() {

  loadPixels();
  startY += inc*10;
  startX += inc*0.1;
  yoff = startY;
  for(let y = 0; y < height; y++){
     xoff = startX;
    for(let x = 0; x < width; x++){
      let r =  noise(yoff,xoff)*255
      let pixPos = (x + y * width)*4
      pixels[pixPos] = r;
      pixels[pixPos+1] = r;
      pixels[pixPos+2] = r;
      pixels[pixPos+3] = 255;
      xoff += inc;
    }
    yoff += inc;
  }
  updatePixels();

}
