////MAKES THE POLYGONES takes the pixel placement and the list of pixel
////and returns a list of all vertex points of a polygone
//int[][] polyMaker(int position, int[] pixx, int[] edgePix){
  
//  int x = position;
//  //each neighbouring pixel in pixel index
//  int tl = x-width-1;
//  int tm = x-width;
//  int tr = x-width+1;
//  int ml = x-1;
//  int mr = x+1;
//  int bl = x+width-1;
//  int bm = x+width;
//  int br = x+width+1;
  
//  IntList updatedEdges = convIntList(edgePix);
//  println(updatedEdges.get(2));
//  int[] nei = {tl,tm,tr,ml,mr,bl,bm,br};
  
//  ArrayList<int[]> poly = new ArrayList<int[]>();
//  IntList buffer = new IntList();
//  buffer.append(x);
  
//  while(buffer.size()>=1){
//    int cur = buffer.get(0);
//    buffer.remove(0);
//    for(int n : nei){
//      for(int m = 0; m < updatedEdges.size(); m++){
//        int val = updatedEdges.get(m);
//        if(n == val){
//          int xX = floor(val/width);
//          int yY = val % width;
//          poly.add(new int[] {xX,yY});
//          buffer.append(updatedEdges.get(m));
//          updatedEdges.remove(m);
//        }
//      }
//    }
//  }
//  return poly;
//}

////converts int[] into IntList
//IntList convIntList(int[] y){
//  IntList z = new IntList();
//  for(int x : y){
//    z.append(x);
//  }
//  return z;
//}
