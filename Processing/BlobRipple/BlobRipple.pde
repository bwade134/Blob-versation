
    //The Wave Class
    class Wave {
      //Location
      PVector loc;
      float increment=1;
      

      //In case you are not familiar with PVectors, you can
      //think of it as a point; it holds an x and a y position
     
      //The distance from the wave origin
      int farOut;
     
      //Color
      color strokeColor;
     
      Wave() {
        //Initialize the Location PVector
        loc = new PVector(200,200);
       
        //Set location to the Mouse Position
        

       
        //Set the distance out to 1
        farOut = 1;
       
        //Randomize the Stroke Color
        // int neon = int(random(5));
  //if (neon == 0) { strokeColor = color (0,250,126); //green
 // } else if (neon == 1) { strokeColor = color (2,0,223); //purple
  //} else if (neon == 2) { strokeColor = color (225,238,136); //yellow
  //} else if (neon == 3) { strokeColor = color (250,66,94); //red
  //} else if (neon == 4) { strokeColor = color (157,188,252); //blue
 // }
        strokeColor = color(random(255), random(255), random(255));
      }
     
      void update() {
        //Increase the distance out
        farOut += 1;
      }
     
      void display() {
        //Set the Stroke Color
        stroke(strokeColor);
        
        float r = random(-.75, .75);
        float t = random(-.75, .75);
        loc.x = loc.x+r;
        loc.y = loc.y+t;


         //Draw the ellipse
        strokeWeight(8);
        ellipse(loc.x, loc.y, farOut, farOut);
      }
     
      boolean dead() {
        //Check to see if this is all the way out
        if(farOut > 50) {
          //If so, return true
          return true;
        }
        //If not, return false
        return false;
      }
    }
    //Create the ArrayList of Waves
    ArrayList<Wave> waves = new ArrayList<Wave>();
    void setup() {
      size(400, 400);
     
      //Set all ellipses to draw from the Center
      ellipseMode(CENTER);
    }
    void draw() {
      //Clear the background with 21 opacity
      background(255, 255, 255, 21);
     
      //If the mouse is pressed
      
        //Create a new Wave
        Wave w = new Wave();
        //and Add it to the ArrayList
        waves.add(w);
      
     
      //Run through all the waves
      for(int i = 0; i < waves.size(); i ++) {
        //Run the Wave methods
        waves.get(i).update();
        waves.get(i).display();
       
        //Check to see if the current wave has gone all the way out
        if(waves.get(i).dead()) {
          //If so, delete it
          waves.remove(i);
        }
      }
    }