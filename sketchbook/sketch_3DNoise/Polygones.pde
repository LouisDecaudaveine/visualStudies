class Polygones{

float inc = 0.013;
float speed = 0.005;
float[] colSec = {0.025, 0.05, 0.075, 0.1, 0.125, 0.15, 0.175, 0.2, 0.225, 0.25, 0.275, 0.3, 0.325, 0.35, 0.375, 0.4, 0.425, 0.45, 0.475, 0.5, 0.525, 0.55, 0.575, 0.6, 0.625, 0.65, 0.675, 0.7, 0.725, 0.75, 0.775, 0.8, 0.825, 0.85, 0.875, 0.9, 0.925, 0.95, 0.975};
//float[] colSec = {0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95};

ArrayList<ArrayList<int[]>> polygones = new ArrayList<ArrayList<int[]>>();
FloatList zVals = new FloatList();


Polygones(){
  noiseSeed(354);
  
  //this loads all the pixels into [][]pixels
  loadPixels();
  //to do with Perlin Noise no problem
  float xoff = 0;
  float detail = 0.01;
  noiseDetail(8,detail);
  
  for (int x = 0; x< width; x++){
    xoff += inc;
    float yoff = 0;
    for (int y = 0; y<height;y++){
      yoff += inc;
      //this is where the noise value is taken for each pixel
      float coef = segment(noise(xoff,yoff, frameCount*speed))*255;
      pixels[y+x*width] = color(coef);
      //pixels[x+y*width] = color(coef);
    }
  } 
  int[] edges = edgeFinder(pixels);
  updatePixels();
  
  //displaying the edges
  loadPixels();
  for(int i = 0; i < edges.length; i++){
    pixels[edges[i]] = color(255);
  }
  updatePixels();
  //Takes the edges and makes a list of polygones
  IntList edgeList = convIntList(edges);
  while(edgeList.size() > 0){
     edgeList = polyMaker(edgeList.get(0), edgeList);
     println(edgeList.size());
  }
  
 for(int i = 0; i<polygones.size(); i++){
   zVals.append(red(polyH(polygones.get(i))));
 }
 print(polygones.size());
}




float segment(float col){
  float coll = 0;
   for(int c = 0; c<colSec.length;c++){
        if (col<= colSec[c]) return coll = colSec[c];
      }
      return coll;
}


//EDGE FINDER function that runs through the image 2 times
//once left to right and then top to bottom
int[] edgeFinder(int[] pixx){
 int prevPixel = 0;
 int[] edgePixels = {};
 
 //this is from left to right
 for(int i = 0; i<pixx.length; i++){
   //the modulo width is to ignore the first pixel of each row
   if(prevPixel != pixx[i] && i % width != 0){
      edgePixels = append(edgePixels,i);
   }
 //From top to bottom
   prevPixel = pixx[i];
 }
 prevPixel = 0;
 for(int x = 0; x<width;x++){
   for(int y = 0; y<height;y++){
     //x*y part is to ignore the first element of collumn
     if (prevPixel != pixels[x+y*width] && x*y != 0){
       edgePixels = append(edgePixels, x+y*width);
     }
     prevPixel = pixels[x+y*width];
   }
 }
 
 return edgePixels;
}

////MAKES THE POLYGONES takes the pixel placement and the list of pixel
////and returns a list of all vertex points of a polygone
IntList polyMaker(int position, IntList edgePix){
  
  int x = position;

  
  IntList updatedEdges = edgePix;
  
  
  ArrayList<int[]> poly = new ArrayList<int[]>();
  IntList buffer = new IntList();
  buffer.append(x);
  
  while(buffer.size()>=1){
    //each neighbouring pixel in pixel index
    int b = buffer.get(0);
    int tl = b-width-1;
    int tm = b-width;
    int tr = b-width+1;
    int ml = b-1;
    int mr = b+1;
    int bl = b+width-1;
    int bm = b+width;
    int br = b+width+1;
    int[] nei = {tl,tm,tr,ml,mr,bl,bm,br};
    
    buffer.remove(0);
    for(int n : nei){
      for(int m = 0; m < updatedEdges.size(); m++){
        int val = updatedEdges.get(m);
        
        if(n == val){
          int xX = floor(val/width);
          int yY = val % width;
          poly.add(new int[] {xX,yY});
          buffer.append(val);
          updatedEdges.remove(m);
          //println(buffer.get(0));
        }
      }
    }
  }
  if(poly.size()>10){
    polygones.add(poly);
  }
  
  //println(poly.size());
  return updatedEdges;
}

//converts int[] into IntList
IntList convIntList(int[] y){
  IntList z = new IntList();
  for(int x : y){
    z.append(x);
  }
  return z;
}

//ok making a shape didnt work instead, thinking instead of 
//displaying the polygone as a series of points
//where the last element of the list will be its colour of the shape
//which when turned to 3d can be its z value

void showPoly(ArrayList<int[]> polygone, float z, int recIndex){
  float vol = map(volumes[recIndex],0,1,1,1.4);
  float depth = z + pow(z/7,vol);
  beginShape();
  stroke(255,0,0);
  for(int[] ver : polygone){
    point(ver[1],ver[0], depth);
  }
  endShape();
}

//z value finder
//for some reason having a point is not at 255 in color so if can fix yey
//instead need to run through whole poly to check if there... each time
int polyH(ArrayList<int[]> polygone){
  int[] first = polygone.get(0);
  int minX = first[1];
  for(int[] edge : polygone){
    minX = min(minX,edge[1]);
  }
  int y = 0;
  //finds an average y value
  for (int i = 0; i<5; i++){
    int[] val = polygone.get(i*(polygone.size()-1)/5);
    y += val[0];
  }
  y = floor(y/5);
  int polyH = 0;
  if(minX<5){
    //line goes from right to left
    for(int cX = width; cX>0; cX--){
      int counter = 0;
      int[] coord = {y,cX};
      for(int[] pair : polygone){
        if(pair[0] == coord[0] && pair[1] == coord[1]) counter++;
      }
      loadPixels();
      
      if(counter >0){
        float col = red(pixels[cX-2+width*y]);
        int vari = 0;
        while(col==255){
          vari++;
          col = red(pixels[cX-2+width*(y+vari)]);
        }
        return pixels[cX-2+width*(y+vari)];
      }
      updatePixels();
    }
  }else{
     //line goes from left to right
    for(int cX = 0; cX<width; cX++){
      int[] coord = {y,cX};
      int counter = 0;
      for(int[] pair : polygone){
        if(pair[0] == coord[0] && pair[1] == coord[1]) counter++;
      }
      loadPixels();
      if(counter > 0){
        float col = red(pixels[cX+2+width*y]);
        int vari = 0;
         while(col==255){
           vari++;
           col = red(pixels[cX+2+width*(y+vari)]);
        }
        return pixels[cX+2+width*(y+vari)];
      }
      updatePixels();
    }  
  }
  return polyH;
}

}
