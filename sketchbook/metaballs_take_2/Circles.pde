class Circles{
  ArrayList<Circle> circles;
  Circles(){
    circles = new ArrayList<>();
    for(int i=0; i<10; i++){
      circles.add(new Circle());
    }
  }

  void showAll(){
    for(Circle cir : circles){
      cir.show();
    }
  }
  
  void updateAll(){
    for(Circle cir: circles){
      cir.update();
    }
  }
  
  void checkAll(){
    for(Circle cir: circles){
      cir.boundaryCheck();
    }
  }
  
}
