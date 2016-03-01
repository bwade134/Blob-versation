// STUDENT: You must update class GeometricDealy in its own tab.
// Some variable fields can be self-initializing like some
// you see here, and at least one must initialize from a constructor parameter.
// CSC220 STUDENT: This must go to a 3D sketch.
class GeometricDealy {
  float x ;
  float speedx =  (random(-10.0, 10.1));
  float y ;
  float z ;
  float speedy = (random(-10.0, 10.1));
  float w ;
  float speedw = 1 ;
  float h ;
  float speedh = -1 ;
  float rotation = 0.0 ;
  float delta = random(-90.0, 90.0);
  float s = .5 ;
  float speedscale = ceil(random(-.01, .01));
  float radius ;
  int rr ;
  int gg ;
  int bb ;
  int aa = 255 ;
  // Constructs the dealy with these initial parameters.
  GeometricDealy(int initialx, int initialy, float initialz, int initialwidth, int initialheight,
      int r, int g, int b, float rad) {
    x = initialx;
    y = initialy;
    z = initialz;
    w = initialwidth ;
    h = initialheight ;
    rr = r ;
    gg = g;
    bb = b ;
    aa = (int) random(0,256);
    radius = rad;
  }
  // STUDENT You MUST use 3D translate() to move plotting around the
  // display and also around your dealy's "body", along with pushMatrix()
  // and popMatrix() as outlined below. You must use 2 to 4 geometric
  // forms (I use 3 -- ellipse, rectangle, and my own "dandelion seed head").
  // You must use 3D rotate() and scale(). You must use Processing's shearX()
  // and/or shearY() functions; I recommend using these 2D functions
  // before any rotation or sclaing in the 3rd dimension.
  void display() {
    // I recommend using CENTER mode to simplify thinking about the cumulative
    // effects of the transforms. You are not required to do so. The visual
    // structure of your GeometricDealy objects is up to you, subject to the
    // constraints listed in my STUDENT comments in my handout sketch.
    rectMode(CENTER);
    ellipseMode(CENTER);
    fill(rr, gg, bb, 25);
    stroke(rr/4, gg/4, bb/4, 255);
    strokeWeight(1);
    
    // STUDENT: You MUST use pushMatrix() to save the current state of the visual
    // world before plotting your object, and you MUST use translate to position the
    // center point of your object on the screen. You MUST use rotate and scale one or
    // more times.
    pushMatrix();
    translate(x,y,z);
    scale(s);
    sphere(radius);
    
    // STUDENT: You MUST use at least one "nested" pushMatrix() (meaning it is
    // nested inside your previous pushMatrix()), and you MUST use translate()
    // to translate and plot A BODY PART within the general visual area of the dealy.
    // Use pushMatrix() and popMatrix() around each body part. My code here plots
    // a rotated rectangle at the exact left side (-w/2) of the main ellipse, and plots
    // a rectangle with a different rotation at the right side (w/2) of the ellipse.
    // Note the use of translate() to position the body part relative to the center of
    // the ellipse. Also, since the main ellipse itself is already rotated, "left" and
    // "right" in this comment are relative terms. The body part placements and other
    // geometric transforms are all relative to the transforms already applied to the
    // main object; transforms "stack up" until the code hits a matching popMatrix().
    pushMatrix();
    rotateX(radians(rotation)*.5);
    rotateZ(radians(rotation)*.5);
    translate(z*4,x*4,y*4);
    scale(s);
    box(w,h,z);

    if(w < 100 && h <100)
    {
    pushMatrix();
    rotateX(radians(rotation)*.5);
    rotateY(radians(rotation)*.5);
    rotateZ(radians(rotation)*.5);
    shearX(radians(rotation*.2));
    translate(z*1.2,x*1.2,y*1.2);
    scale(s);
    box(w*4,h*4,z*4);
    popMatrix();
    }
    
    popMatrix();
    
    pushMatrix();
    translate(w,h,z);
    rotate(radians(rotation)*.5);
    rotateZ(radians(rotation)*.5);
    scale(s);
    shearY(radians(rotation*.2));
    box(w*.5,h*.5,z*.5);
    popMatrix();
    

    pushMatrix();
    rotateX(radians(rotation/2));
    rotateY(radians(rotation/2));
    rotateZ(radians(rotation/2));
    translate(w*.8,h*.8,z*.8);
    scale(s);
    translate(x*.8,y*.8,z*.8);
    box(w*1.5,h*1.5,z*1.5);
    
    popMatrix();
    
    popMatrix();
    // STUDENT: After all display is completed, implement the move
    // functionality right here within display():
    if (mousePressed) {
      if (mouseX < x) {
        x = x - 1 ;
      } else if (mouseX > x) {
        x = x + 1 ;
      }
      if (mouseY < y) {
        y = y - 1 ;
      } else if (mouseY > y) {
        y = y + 1 ;
      }
      if (mouseY < z) {
        z = z - 1 ;
      } else if (mouseY > z) {
        z = z + 1 ;
      }
    } else {
      x = (x + speedx + width) % width ;
      if (x <= 0 || x >= width-1) {
        speedy = (int) floor(random(-10.0, 10.1));
      }
      y = (y + speedy) ;
      if (y > height) {
        y = height ;
        speedy = - speedy ;
        speedx = (int) floor(random(-10.0, 10.1));
      } else if (y < 0) {
        y = 0 ;
        speedy = - speedy ;
        speedx = (int) floor(random(-10.0, 10.1));
      }
    }
    w += speedw ;
    h += speedh ;
    if (h <= 0) {
      h = 1;
      speedh = abs(speedh);
    } else if (h > height) {
      h = height;
      speedh = - abs(speedh);
    }
    if (w <= 0) {
      w = 1 ;
      speedw = abs(speedw);
    } else if (w > width) {
      w = width;
      speedw = -abs(speedw);
    }
    s += speedscale ;
    if (s <= -2.0 || s >= 2.0) {
      s = 0.5;
      speedscale = ceil(random(-.01, .01));
      if (speedscale == 0.0) {
          speedscale = 1.0;
      } else if (speedscale >= -.05 && speedscale <= .05) {
        speedscale = .01;
      }
    }
    rotation += delta ;
    if (rotation >= 360.0 || rotation < 0.0) {
      delta = random(-90.0, 90.0);
      while (rotation < 0.0) {
        rotation += 360.0;
      }
      while (rotation >= 360.0) {
        rotation -= 360.0;
      }
    }
    rr = abs(rr + 16) % 256;
    gg = abs(gg + 8) % 256;
    bb = abs(bb + 4) % 256;
    aa = abs(aa + 7) % 256;
  }
  // STUDENT: You must implement a second display function called
  // displayDemo that centers your demo object on the screen, and
  // sets variable fields to their default, predictable values if
  // possible, so we can demo your geometric forms and their relative
  // positions without animation or clutter. Call the regular display()
  // function within displayDemo after setting the variable fields to
  // default values.
  void displayDemo() {
    if (isdemo) {
      aa = 255 ;
      speedx = 0 ;
      speedy = 0 ;
      speedh = 0 ;
      speedw = 0 ;
      delta = 0 ;
      x=width/2;
      y=height/2;
      z=-100;
      w=200;
      h=200;
 
    }
    display();
  }
}