/* please implement your assign1 code in this file. */

PImage bgImg, bgImg2, appearanceImg, treasureImg, enemyImg, fighterImg;
int treasureX, treasureY, enemyX=0, hpX, bgX=640, bgX2=0;

void setup () {
  size(640,480) ;  // must use this size.
  // my code
  bgImg = loadImage("assign1/img/bg1.png");
  bgImg2 = loadImage("assign1/img/bg2.png");
  appearanceImg = loadImage("assign1/img/hp.png");
  treasureImg = loadImage("assign1/img/treasure.png");
  enemyImg = loadImage("assign1/img/enemy.png");
  fighterImg = loadImage("assign1/img/fighter.png");
  treasureX = floor(random(640));
  treasureY = floor(random(300));
  hpX = int(random(201));
}

void draw() {
  // my code
  bgX++;
  bgX2++;
  image(bgImg,640-(bgX%1280),0);
  image(bgImg2,640-(bgX2%1280),0);
  image(treasureImg,treasureX,treasureY);
  image(enemyImg,(enemyX++)%640,210);
  //frame
  strokeWeight(0);
  stroke(0);
  fill(255,90);
  rect(0, 0, 640, 480);
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
  fill(150, 255, 0);
  ellipse(160, 450, 150, 150);
  stroke(0);
  fill(150);
  ellipse(480, 450, 150, 150);
  textSize(50);
  fill(0, 102, 153);
  text("HP", 290, 370); 
  line(160, 450, 310, 450);
  stroke(0);
  fill(30, 255, 0);
  rect(223, 370, hpX, 25);
  image(appearanceImg,215, 370);
  image(fighterImg,290,420);
  stroke(0);
  fill(255);
  strokeWeight(0.5); 
  stroke(0);
  fill(255,1);
  ellipse(320, 230, 150, 150);
  stroke(0);
  fill(255,2);
  ellipse(320, 230, 100, 100);
  line(340, 230, 410, 230);
  line(230, 230, 300, 230);
  line(320, 210, 320, 140);
  line(320, 250, 320, 320);
  //end appearance
}
