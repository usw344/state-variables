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
int audioPlayerNumber, state,counter;


// this is for opening logo
PImage openingCircle, openingM, openingCopy, openingLinux;
int  mX,mY;
int pX,pY,cX,cY;


void setup() {
  size(800,800);
  // the opening screen state
  state = 1;
  
  // button 1
  button1X = width/4;
  button1Y = height - height/2;
  button1W = 100;
  button1H = 100;
  // button 2
  //
  counter = 0;
  // for sound
  minim = new Minim(this);
  player = minim.loadFile("cleaned-expo.mp3");
  
  // for the opening menu
  
  openingCircle = loadImage("opeining circle.png");
  openingM = loadImage("opeining circle middle m.png");
  
  openingCopy = loadImage("c.png");
  openingLinux = loadImage("copyright.png");
 
  mY = -500;// for m
  cY = 1000;// for copyright sign
  pY = 1000;// for the prodoctions
  
  
}

void draw() {
  if (state == 1) {
   openingSplash();
   dropingInM();
   MProductions();
  }
  
  if (state == 2) {
    background(255);
  }
 
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
   pY -= 70;
  }
  imageMode(CENTER);
  image(openingCopy, width/4,cY,400,400);   
  image(openingLinux, width/2, pY,400,400);
}