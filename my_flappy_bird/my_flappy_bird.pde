// this game is going to be my last without arrays and objects and datatypes;
//

// loading minim
import ddf.minim.*;
Minim minim;

// the size and local of hudles
float hur1X, hur1Y, hur2X, hur2Y, hur1Width, hur1Height, hur2Width, hur2Height; // for the hurdles

/// the size of the opening screen button
float button1X, button1Y, button2X, button2Y;
float button1W,button1H,button2W,button2H;

// stuff for sound and the state var
int audioPlayerNumber, state;

// this is for opening logo
PImage openingCircle, openingM;


void setup() {
  size(800,800);
  
  // button 1
  button1X = width/4;
  button1Y = height - height/2;
  button1W = 100;
  button1H = 100;
  // button 2
  //
  
  // for sound
  minim = new Minim(this);
  
  // for the opening menu
  openingCircle = loadImage("opeining circle.png");
  openingM = loadImage("opeining circle middle m.png");
  
  
}




void draw() {


}


////////////////////// this section is for the main menu code.
void opeingSplash() {

}