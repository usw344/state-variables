float[] x;
float[] y;
float[] dy;
int numberOfStarts;



void setup() {
  size(800,800);
  numberOfStarts = 200;
  x = new float[numberOfStarts];
  y = new float[numberOfStarts];
  dy = new float[numberOfStarts];
  setRandomValues();
}

void draw() {
  background(0);
  moveStar();
  displayStars();
}


void setRandomValues() {
  for (int i = 0; i < numberOfStarts; i ++) {
    x[i] = random(width);
    y[1] = random(height);
    dy[1] = random(1,10);
  }
}

void displayStars() {
  fill(255);
  for (int i = 0; i < numberOfStarts; i ++) {
    ellipse(x[i],y[i],5,5);
  }
}

void moveStar() {
  for (int i = 0; i < numberOfStarts; i++) {
    y[i] += dy[i];
    
  }
}