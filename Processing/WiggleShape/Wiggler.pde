// An object that wraps the PShape

class Wiggler {
  
  // The PShape to be "wiggled"
  PShape s;
  // Its location
  float x, y;
  
  // For 2D Perlin noise
  float yoff = 0;
  
  // We are using an ArrayList to keep a duplicate copy
  // of vertices original locations.
  ArrayList<PVector> original;

  Wiggler() {
    x = width/2;
    y = height/2; 

    // The "original" locations of the vertices make up a circle
    original = new ArrayList<PVector>();
    for (float a = 0; a < TWO_PI; a+=0.3) {
      PVector v = PVector.fromAngle(a);
      v.mult(25);
      original.add(v);
    }
    
    // Now make the PShape with those vertices
    s = createShape();
    s.beginShape();
    s.fill(127); // Lower number means darker color
    s.stroke(0);
    s.strokeWeight(2); //Higher number increases Wiggle outline
    for (PVector v : original) {
      s.vertex(v.x, v.y);
    }
    s.endShape(CLOSE);
  }

  void wiggle(float wiggleness) {
     float xoff = 0;
     
    // Apply an offset to each vertex
    for (int i = 0; i < s.getVertexCount(); i++) {
      // Calculate a new vertex location based on noise around "original" location
      PVector pos = original.get(i);
      float a = TWO_PI*noise(xoff,yoff);
      PVector r = PVector.fromAngle(a);
      r.mult(wiggleness); // Increases Wiggliness
      
      r.add(pos);
      // Set the location of each vertex to the new one
      s.setVertex(i, r.x, r.y);
      // increment perlin noise x value
      xoff+= 0.2; // Increases X axis Wiggliness
    }
    // Increment perlin noise y value
    yoff += 0.01; // Increases Y Axis Wiggliness
  }
  

  void display(float w, float h) {
    pushMatrix();
    //translate(x, y); 
    shape(s,width/2,height/2,w,h);
    popMatrix();
  }
}