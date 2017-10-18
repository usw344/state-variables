// this game is going to be my last without arrays and objects and datatypes;

//extra for experts includes, a much better solution to the audio than last time. Also the addition of a splash screen to open is a fist for me. and the end of magic numbers yaaa!!!!

// loading minim
import ddf.minim.*;
Minim minim;
AudioPlayer player;

// player stuff
float playerX, playerWidth,playerHeight;


// the size and local of hudles
float hur1X, hur1Y, hur2X, hur2Y;
float hur1Width, hur1Height, hur2Width, hur2Height;
float spaceBetweenHurdles,speedOfHurdles;


/// the size of the opening screen button and the play again button
float button1X, button1Y, button2X, button2Y,button3X,button3Y;
float button1W,button1H,button2W,button2H,button3W,button3H;

float button4X,button4Y,button4H,button4W;

// stuff for sound and the state var and other misc, stuff
int audioPlayerNumber, state,counter,timer,musicNum, points;
float r,g,b,r1,b1,g1,r2,g2,b2;


// this is for opening logo
PImage openingCircle, openingM, openingCopy, openingLinux;
int  mX,mY;
int pX,pY,cX,cY;


// for by buttons
boolean isOnStartButton, isOnHowButton,isOnBackButton, isOnPlayAgainButton;

// for the end screen
String endText;
boolean endOfGame;

void setup() {
  size(800,800);
  // the opening screen state
  state = 1;
  
  // for the timer
  timer = millis();
  
  // button 1 start 
  button1X = width/2- width/4;
  button1Y = height/2- height/6;
  
  button1W = 400;
  button1H = 100;
  
  // button 2 how to play
  button2X = button1X * 6;
  button2Y = height - height/2 - height/3;
  
  button2W = 300;
  button2H = 100;
  
  counter = 0;
  
  // for button 3 back button
  button3W = 300;
  button3H = 100;
 
  button3X = width/4+button3W/6;
  button3Y = height-height/4;

  // for button 4 play again
  button4W = 550;
  button4H = 100;
  
  button4X = width/6;
  button4Y = height - height/3;
  
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
  
  

  
  // how much of a gap there is between the hur1 and hur 2 and there speed
  spaceBetweenHurdles = 100;
  speedOfHurdles = 5;
  
  
  /// for the hurdles, these get changed after wards
  hur1X = 400;
  hur1Y= 0;
  
  hur1Width = 85;
  hur1Height = height/2;
  
  hur2Width = 85;
  hur2Height = height/2;
  
  hur2X = 400; 
  hur2Y = height- playerWidth;

  
  
  
  // player var
  playerX = width/12;
  
  playerWidth = 50;
  playerHeight = 50;
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
    //isOnHowButton();
    startGameViaMouseClick();
  }
  
  if (state == 3) { // THE MAIN GAME LOOP
    
    displayHurdles();
    moveHurdle();
    isPlayerHittingHurs();
    displayPlayer();
    showPoints();
    speedUp();
}
  //if (state == 4) { // the how to play section
    //displayBackButton();
    //isOnBackButton();
    //timeTostartGame();

    
  //}
  if (state == 5) {
    displayEndResult();
    displayPlayAgainButton();
    isOnPlayAgainButton();
    startGameAgain();
    
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
  background(0);
  
  player.play();// starting the background music

  noStroke();
  fill(r,g,b);
  
  rect(button1X,button1Y,button1W,button1H);// drawing the start button

  // stuff for the texxt
  fill(255);
  textSize(45);
  
  text("START",button1X+ button1W/4,  button1Y+button1H/2 + button1H/8);
  
  
  //text("Instructions",button2X + button2W/12,  button2Y + button2H/2 + button2H/8);
    
  //fill(r1,g1,b1);
  //rect(button2X,button2Y,button2W,button2H);// drawing the how to play button
  


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

//void isOnHowButton() {
  //if ((mouseY > button2Y) && (mouseY < button2Y + button2H) && (mouseX < button2X + button2W) && (mouseX > button2X)) {
    //r1 = 242;
    //g1 = 207;
    //b1 = 181;
    //isOnHowButton = true;
  //}
  //else {
    //r1 = 255;
    //g1 = 118;
    //b1 = 13;
  //}

//}


void startGameViaMouseClick() { // checks which button user has selected how to play or start
  if (mousePressed) {
    
    
    if (isOnStartButton == true){
      state = 3;
      isOnStartButton = false;
      
      player.pause();// this stop the current music and plays the next one
      musicNum = 3;
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
  
  
  fill(255);
  textSize(45);
  text("Back",button3X + button3W/4,  button3Y + button3H/2 + button3H/8);
}

void timeTostartGame() { // if the player click the button start the game
  if (isOnBackButton && mousePressed) {
  state = 2;
  isOnBackButton = false;
  
  player.pause();
  

  }
}

//void isOnBackButton() {
  //if ((mouseY > button3Y) && (mouseY < button3Y + button3H) && (mouseX < button3X + button3W) && (mouseX > button3X)) {
    //r2 = 242;
    //g2 = 207;
    //b2 = 181;
    //isOnBackButton = true;
  //}
  //else {
    //r2 = 255;
    //g2 = 118;
    //b2 = 13;
 // }

}





void musicHandler() { // a little work around to manage all the background music in the app credits for songs in the skecth folder.
  if (state == 2 && musicNum == 2) {
    player = minim.loadFile("acid jazz.mp3");
    
    musicNum = -1;// this stop minim from crashing by not making the file load again and again
  }
  if (state == 3 && musicNum == 3) {
    player = minim.loadFile("Spring_In_My_Step.mp3");
    player.play();
    
    musicNum = -1;
  }
  
  if (state == 3 && musicNum == 4) {
    player = minim.loadFile("Chee_Zee_Cave_Video_Classica.mp3");
    player.play();
    
    musicNum = -1;
  }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///// for the game code. divided into logical sections.

// all that has to do with hurdle action

void displayHurdles() {
  background(255);
  r = (25);
  g = (193);
  b = (71);
  
  fill(r,g,b);
  noStroke();
  rect(hur1X,hur1Y,hur1Width,hur1Height);
  
  // defining the hur2Y here.
  hur2Y = hur1Height + spaceBetweenHurdles;
  
  
  if (hur2Y >= height) { // makes sure you can actually make it by
    hur2Y = height-50;
    hur1Y = 0;

  }
  
  
  if (hur2Height > 700 && hur1Height > 700) { // make sures you do not get a wall
    hur1Height = height/2 - 60;
    hur2Height = height/2 + 60;

  }
  rect(hur2X,hur2Y,hur2Width,hur2Height);

}

void moveHurdle() {
  hur1X -= speedOfHurdles;
  hur2X -= speedOfHurdles;
  
  resetHurdles();
}

void resetHurdles() {
  if (hur1X < 0 - hur1Width && hur2X < 0 -hur2Width) { // if the hur are past the edge of the screen
    hur1X = width;
    hur2X = width;
    
    spaceBetweenHurdles = random(150,200);// resets the space between the the hur
    hur1Height = random(0,height-playerHeight);
    
    
   
    if (endOfGame == false) {// and if the player hasnt been hit add a point
      points += 1;
    }
 
    
    
    if (hur2Y <= height) { // this makes sures that the hur2 is floating in air
      hur2Height += height - hur2Height;
      }
  

}
}



/////// the section for playerMovement 
void displayPlayer() {// drawing the player square
  fill(0);
  rect(playerX,mouseY,playerWidth,playerHeight); // also moves the player 
}

void isPlayerHittingHurs() { // cllision detection
  if ((playerX + playerWidth >= hur1X && mouseY <= hur1Y + hur1Height) || (playerX + playerWidth >= hur2X && mouseY >= hur2Y) || (playerX + playerWidth >= hur2X && mouseY + playerHeight>= hur2Y)) {
    state = 5;
    endOfGame = true;
  }
}


//// this is misc stuff
void showPoints() {
  fill(25,103,56,120);
  
  textAlign(CENTER);
  
  textSize(200);
  
  text(points,width/2,height/2);
}

///// lvl handler
void speedUp() {
  if (points == 5) {
    points += 1;
    speedOfHurdles *= 4;// speed up after 5 points
    
    player.pause();
    musicNum = 4;

  }
  
  
  if (points == 20) {
    points += 1;
    speedOfHurdles *= 2;
    
    player.pause();
    musicNum = 4;

  }
}


//////////////////////////////////////////////////////////////  this is the end screen text 

void displayEndResult() {
  background(0);
   textSize(29);
  fill(255);
  textAlign(CENTER);
  
  endText = "thanks for playing, see you later. Your score is:   " + points; // prints the final score
  text(endText, width/2,height/2);

}
 
 
void displayPlayAgainButton() {
  fill(r,g,b);
  rect(button4X,button4Y,button4W,button4H);
  
  
  fill(0);
  textSize(90);
  text("PLAY AGAIN", button4W-button4W/4 ,button4Y + button4H/2 + button4H/5);
}
 
void isOnPlayAgainButton() { // if the mouse is over the play again button. 
  if ((mouseY > button4Y) && (mouseY < button4Y + button4H) && (mouseX < button4X + button4W) && (mouseX > button4X)) {
    r = 242;
    g = 207;
    b = 181;
    
    isOnPlayAgainButton = true;
  }
  
  
  else {
    r = 255;
    g = 118;
    b = 13;
  }

}
void startGameAgain() { // if the user wants to play again
  if (mousePressed) {
    if (isOnPlayAgainButton == true){
      state = 3;
      isOnPlayAgainButton = false;
      
      //resting the game
      player.pause();
      musicNum = 3;
      reset();

    }
  }
}
void reset() {
  points = 0; //setting the points to 0 for a restart
  speedOfHurdles = 5; // putting the hurdles down to human speed
  
  hur1X = 400;//  making sure that the player doesnt hit the hur on restart
  hur2X = 400;
  
  endOfGame = false;// to start the point counter again
}


//void keyPressed() { // a cheat if you want to skip to game right away.
//if (key == 'w') {
//  state = 3;
//}
//}