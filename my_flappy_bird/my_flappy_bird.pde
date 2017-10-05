// this game is going to be my last without arrays and objects and datatypes;
//

// loading minim
import ddf.minim.*;
Minim minim;
AudioPlayer player;

// the size and local of hudles
float hur1X, hur1Y, hur2X, hur2Y, hur1Width, hur1Height, hur2Width, hur2Height; // for the hurdles

/// the size of the opening screen button
float button1X, button1Y, button2X, button2Y;
float button1W,button1H,button2W,button2H;

// stuff for sound and the state var and other misc, stuff
int audioPlayerNumber, state,counter,timer,r,g,b,r1,b1,g1,musicNum;


// this is for opening logo
PImage openingCircle, openingM, openingCopy, openingLinux;
int  mX,mY;
int pX,pY,cX,cY;


void setup() {
  size(800,800);
  // the opening screen state
  state = 1;
  
  // for the timer
  timer = millis();
  
  // button 1
  button1X = width/12;
  button1Y = height - height/2 - height/3;
  button1W = 300;
  button1H = 100;
  
  // button 2
  button2X = button1X * 6;
  button2Y = height - height/2 - height/3;
  button2W = 300;
  button2H = 100;
  counter = 0;
  
  // for sound
  minim = new Minim(this);
  player = minim.loadFile("cleaned-expo.mp3");
  musicNum = 0;
  
  // for the opening menu
  
  openingCircle = loadImage("opeining circle.png");
  openingM = loadImage("opeining circle middle m.png");
  
  openingCopy = loadImage("c.png");
  openingLinux = loadImage("copyright.png");
 
  mY = -500;// for m
  cY = 1000;// for copyright sign
  pY = 1000;// for the prodoctions
 // for the button 1 (start) color
  r = 255;
  g = 118;
  b = 13;
  // for button 2 (how to play) color
  r1 = 255;
  g1 = 118;
  b1 = 13;
}

void draw() {
  if (state == 1) {
   openingSplash();
   dropingInM();
   MProductions();
  }
  
  if (state == 2) {
    drawButtons();
    isOnButtonStart();
  }
  musicHandler();
}


////////////////////// this section is for the main menu code.
void openingSplash() {
  background(0); 
  
  if (counter <= 799) {
     counter += 50;
   }
    
   imageMode(CENTER);
   image(openingCircle,width/2,height/2-25,counter,counter+50);
}

void dropingInM() {
   if ((counter >= 799) && (mY < height/2))  {
     mY += 60;
   }
   
   if (mY >= height/2-25) {
     player.play();
   }
   
   image(openingM,width/2,mY,700,700);
}
void MProductions(){
  if ((mY >= height/2) && (cY > height - height/3 + 200)) {
   cY -= 50; 
   pY -= 55;
  }
  imageMode(CENTER);
  image(openingCopy, width/4,cY,400,400);   
  image(openingLinux, width/2 + width/8, pY,400,400);
  if ((cY <= height - height/3 + 200) &&  (millis() >= 2800)) {
    state = 2;
    musicNum = 2;
  }
}
//////////////////////// code for the menu selections thing
void drawButtons() {
  
  player.play();
  background(0);
  
  noStroke();
  fill(r,g,b);
  //rectMode(CENTER);

  rect(button1X,button1Y,button1W,button1H);
  
  fill(r1,g1,b1);
  rect(button2X,button2Y,button2W,button2H);
  
  fill(255);
  textSize(45);
  text("START",button1X+ button1W/4,  button1Y+button1H/2 + button1H/8);
  text("Instructions",button2X + button2W/12,  button2Y + button2H/2 + button2H/8);


}
void isOnButtonStart() {
  if ((mouseY > button1Y) && (mouseY < button1Y + button1H) && (mouseX < button1X + button1W) && (mouseX > button1X)) {
    r = 242;
    g = 207;
    b = 181;
  }
  else {
    r = 255;
    g = 118;
    b = 13;
  }

}





void musicHandler() {
  if (state == 2 && musicNum == 2) {
    player = minim.loadFile("acid jazz.mp3");
    musicNum = -1;
  }

}
void keyPressed() {
  if (key == 'w') {
    state = 2;
  }
}