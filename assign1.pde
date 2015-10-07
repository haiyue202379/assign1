/* please implement your assign1 code in this file. */

PImage bgImg;

void setup () {
  size(640,480) ;  // must use this size.
  // my code
  bgImg = loadImage("img/bg2.png");
}

void draw() {
  // my code
  image(bgImg,0,0);
  //frame
  strokeWeight(12); 
  stroke(0);
  fill(162,0);
  ellipse(40, 360, 320, 900);
  ellipse(37, 380, 320, 900);
  ellipse(600, 360, 320, 900);
  ellipse(603, 380, 320, 900);
  strokeWeight(2); 
  stroke(0);
  fill(162);
  ellipse(320, 480, 700, 320);
  stroke(0);
  fill(0);
  ellipse(320, 490, 690, 320);
  //end frame
  //appearance
  strokeWeight(2); 
  stroke(0);
  fill(255);
  ellipse(160, 450, 150, 150);
  stroke(0);
  fill(255);
  ellipse(480, 450, 150, 150);
  strokeWeight(0.5); 
  stroke(0);
  fill(255,1);
  ellipse(320, 240, 150, 150);
  stroke(0);
  fill(255,2);
  ellipse(320, 240, 100, 100);
  //end appearance
}
