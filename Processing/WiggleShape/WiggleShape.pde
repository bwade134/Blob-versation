/**
 * WigglePShape. 
 * 
 * How to move the individual vertices of a PShape
 */


// A "Wiggler" object
Wiggler w;

void setup() {
  size(800, 600);
  w = new Wiggler();
  ellipseMode(CENTER);
}

void draw() {
  //Stage 1
  
  //if audio inputs are shit or you have just begun execute stage 1
  //w.display(w,h) raise or lower depending on audio inputs
  //w.wiggle(wiggliness) raise or lower depending on audio inputs
  boolean stage1 = true;
  background(255);
  
  if (stage1 == true){
  
  w.display(25,25);
  w.wiggle(2);
  
  Wave wvs = new Wave();
  waves.add(wvs);
  
        //Run through all the waves
      for(int i = 0; i < waves.size(); i ++) {
        //Run the Wave methods
        waves.get(i).update();
        waves.get(i).display(-.75,.75,-.75,.75,20,20,20,40);
       
        //Check to see if the current wave has gone all the way out
        if(waves.get(i).dead(10)) {
          //If so, delete it
          waves.remove(i);
        }
      }
  }
      
      
    //stage 2
      
      
}