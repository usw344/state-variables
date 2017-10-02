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
int audioPlayerNumber, state,counter, mX,mY;


// this is for opening logo
PImage openingCircle, openingM;



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
  mY = -500;
  
  
}




void draw() {
  if (state == 1) {
   openingSplash();
   dropingInM();
  }
  
 
}


////////////////////// this section is for the main menu code.
void openingSplash() {
  background(255); 
  if (counter <= 799) {
     counter += 50;
   }
    
   imageMode(CENTER);
   image(openingCircle,width/2,height/2-25,counter,counter+50);
}

void dropingInM() {
   if ((counter >= 799) && (mY < height/2))  {
     mY += 60;
     image(openingM,width/2,mY,700,700);
   }
   if (mY >= height/2-30) {
     player.play();
   }
   image(openingM,width/2,mY,700,700);
}
void copyWriteText(){
  
}