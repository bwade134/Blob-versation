
float growth=40;                   // initial size of ellipse
float increment=1;                 // larger increment faster pulsating-speed
float r;
void setup()
{
  size(1000, 700); 
  background(100);
  stroke(100);
  smooth();
}



void draw()
{
  
    

for (int i = 0; i < 100; i++) {
   r = random(0,1.7);
  stroke(r*2);
  //line(50, i, 50+r, i);

}
  fill(0,200,200); 

      ellipse(width/2, height/2, growth, growth);
     growth=growth+increment;
  if(growth>40) {increment=increment*-1;}  //max ellipse size
  if(growth<30) {increment=+r;}            //min ellipse size

}