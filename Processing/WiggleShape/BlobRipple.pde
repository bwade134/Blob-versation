
    //The Wave Class
    class Wave {
      //Location
      PVector loc;
      
      //This variable will dictate the blobs stage
      float stage;
      
      //The distance from the wave origin
      int farOut;
     
      //Color
      color strokeColor;
     
      Wave() {
        //Initialize the Location PVector
        loc = new PVector(width/2, height/2);        
 
        //Set the distance out to 1
        farOut = 1;
     
        
      }
     
      void update() {
        //Increase the distance out
        farOut += 1;
      }
     
     
     //Paramters: should be a negative to a positive Example -1,1 Controls the rippling location of the circles
      void display(float lowerX, float upperX, float lowerY, float upperY, int r, int g, int b, int alpha) {
        //Set the Stroke Color
        strokeColor = color(random(r), random(g), random(b), random(alpha));
        stroke(strokeColor);
        
        float xvar = random(lowerX, upperX); //Controls X axis location of rippling circles
        float yvar = random(lowerY, upperY); //Controls Y axis location of rippling circles
        loc.x = loc.x+xvar;             //Keep the difference between upper/lower bnounds even for even rippling circles
        loc.y = loc.y+yvar;


         //Draw the ellipse
        strokeWeight(8); //Sets the thickness of the circles outlines
        ellipse(loc.x, loc.y, farOut, farOut);  //ellipse(x,y,Width,Height) Loc.x/loc.y randomly incrememt/decrement for a rippling effect
                                                //farOut increases the width/height of the circles until a dead condition
      }
     
      boolean dead(float growth) {
        //Check to see if this is all the way out
        if(farOut > growth) {
          //If so, return true
          return true;
        }
        //If not, return false
        return false;
      }
      
    }
    
    //Create the ArrayList of Waves
    ArrayList<Wave> waves = new ArrayList<Wave>();

    
    
 