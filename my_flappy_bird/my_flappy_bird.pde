// this game is going to be my last without arrays and objects and datatypes;
//

// loading minim
import ddf.minim.*;
Minim minim;
AudioPlayer player;

// the size and local of hudles
float hur1X, hur1Y, hur2X, hur2Y, hur1Width, hur1Height, hur2Width, hur2Height; // for the hurdles

/// the size of the opening screen button
float button1X, button1Y, button2X, button2Y,button3X,button3Y;
float button1W,button1H,button2W,button2H,button3W,button3H;

// stuff for sound and the state var and other misc, stuff
int audioPlayerNumber, state,counter,timer,r,g,b,r1,b1,g1,r2,g2,b2,musicNum;


// this is for opening logo
PImage openingCircle, openingM, openingCopy, openingLinux;
int  mX,mY;
int pX,pY,cX,cY;

// for by buttons
boolean isOnStartButton, isOnHowButton,isOnBackButton;

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
  
  // for button 3
  button3X = width/2;
  button3Y = height/2 + height/3;
  button3W = 300;
  button3H = 100;
  
  // for sound
  minim = new Minim(this);
  player = minim.loadFile("cleaned-expo.mp3");
  musicNum = 0;
  
  // for the opening menu
  openingCircle = loadImage("opeining circle.png");
  openingM = loadImage("opeining circle middle m.png");
  
  openingCopy = loadImage("c.png");
  openingLinux = loadImage("copyright.png");
 
 // the various stuff needed for the oxymoronic statement of copyright linux
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
  // for button 3 (back button) color
  r2 = 255;
  g2 = 118;
  b2 = 13;
}

void draw() {
  if (state == 1) { // the state for the opening splash
   openingSplash();
   dropingInM();
   MProductions();
  }
  
  if (state == 2) {// the game menu
    drawButtons();
    isOnButtonStart();
    isOnHowButton();
    startGameViaMouseClick();
  }
  
  if (state == 3) { // THE MAIN GAME LOOP
    //  
}
  if (state == 4) { // the how to play section
    displayBackButton();
    isOnBackButton();
    timeTostartGame();
    
  }
  
  musicHandler();// genereic functiont that will run forever regardeless of the state kept here for efficeny. 
}


////////////////////// this section is for the main menu code.
void openingSplash() {
  background(0); 
  
  if (counter <= 799) {// replace counter later on with a good var name
     counter += 50;
   }
    
   imageMode(CENTER);
   image(openingCircle,width/2,height/2-25,counter,counter+50);// draw the circle 
}

void dropingInM() {
   if ((counter >= 799) && (mY < height/2))  {// when circle is in place
     mY += 60;// drop the m
   }
   
   if (mY >= height/2-25) {// once the m in place
     player.play();// play the explosion
   }
   
   image(openingM,width/2,mY,700,700);// drawing the M where needed 
}
void MProductions(){
  if ((mY >= height/2) && (cY > height - height/3 + 200)) {// once m in place
   cY -= 50; // move the copy right
   pY -= 55; // move the linux in place
  }
  imageMode(CENTER);
  image(openingCopy, width/4,cY,400,400);   // draw copyright sign
  
  image(openingLinux, width/2 + width/8, pY,400,400);// draw the linux logo
  
  if ((cY <= height - height/3 + 200) &&  (millis() >= 2800)) {// once all steps above are done
    state = 2;// change the state 
    musicNum = 2;// and the music num to trigger the next song
  }
}
//////////////////////// code for the menu selections thing

void drawButtons() {
  
  player.play();// starting the background music
  background(0);
  
  noStroke();
  fill(r,g,b);
  //rectMode(CENTER);

  rect(button1X,button1Y,button1W,button1H);// drawing the start button
  
  fill(r1,g1,b1);
  rect(button2X,button2Y,button2W,button2H);// drawing the how to play button
  
  // stuff for the texxt
  fill(255);
  textSize(45);
  text("START",button1X+ button1W/4,  button1Y+button1H/2 + button1H/8);
  text("Instructions",button2X + button2W/12,  button2Y + button2H/2 + button2H/8);


}
void isOnButtonStart() { // if the mouse is over the start button then yes trigger the boolean key to move the state
  if ((mouseY > button1Y) && (mouseY < button1Y + button1H) && (mouseX < button1X + button1W) && (mouseX > button1X)) {
    r = 242;
    g = 207;
    b = 181;
    isOnStartButton = true;
  }
  else {
    r = 255;
    g = 118;
    b = 13;
  }

}

void isOnHowButton() {
  if ((mouseY > button2Y) && (mouseY < button2Y + button2H) && (mouseX < button2X + button2W) && (mouseX > button2X)) {
    r1 = 242;
    g1 = 207;
    b1 = 181;
    isOnHowButton = true;
  }
  else {
    r1 = 255;
    g1 = 118;
    b1 = 13;
  }

}


void startGameViaMouseClick() {
  if (mousePressed) {
    if (isOnStartButton == true){
      state = 3;
      isOnStartButton = false;
      player.pause();
    }
    else if (isOnHowButton == true) {
      state = 4;
      isOnHowButton = false;
    }
  }
}


////////////////// for the how to play section
void displayBackButton() {
  background(0);
  fill(r2,g2,b2);
  rect(button3X,button3Y,button3W,button3H);// drawing the how to back button
}

void timeTostartGame() {
  if (isOnBackButton == true) {
  state = 3;
  player.pause();
  }
}

void isOnBackButton() {
  if ((mouseY > button3Y) && (mouseY < button3Y + button3H) && (mouseX < button3X + button3W) && (mouseX > button3X)) {
    r1 = 242;
    g1 = 207;
    b1 = 181;
    isOnBackButton = true;
  }
  else {
    r1 = 255;
    g1 = 118;
    b1 = 13;
  }

}





void musicHandler() { // a little work around to manage all the background music in the app credits for songs in the skecth folder.
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