Box enemy, player;

boolean up, down, left, right, spinleft, spinright;

void setup() {
  size(1000, 1000);
  up = down = left = right = false;
  rectMode(CENTER);
  enemy = new Box(width/2, height/2, 85, 125);
  player = new Box(width/4, height*3/4, 40, 100);
}

void draw() {
  background(51);
  enemy.display();
  player.display();

  if (up) player.pos.y -= 2;
  if (down) player.pos.y += 2;
  if (left) player.pos.x -= 2;
  if (right) player.pos.x += 2;
  if (spinleft) player.angle -= 0.1;
  if (spinright) player.angle += 0.1;
}

void keyPressed() {
  if (key == 'w' || key == 'W') up = true;
  if (key == 's' || key == 'S') down = true;
  if (key == 'a' || key == 'A') left = true;
  if (key == 'd' || key == 'D') right = true;
  if (keyCode == LEFT) spinleft = true;
  if (keyCode == RIGHT) spinright = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') up = false;
  if (key == 's' || key == 'S') down = false;
  if (key == 'a' || key == 'A') left = false;
  if (key == 'd' || key == 'D') right = false;
  if (keyCode == LEFT) spinleft = false;
  if (keyCode == RIGHT) spinright = false;
}

class Box {
  PVector pos;
  float w, h;
  float angle;
  boolean over = false;

  PVector[] points = new PVector[4];

  Box(float x, float y, float w, float h) {
    this.pos = new PVector(x, y);
    this.w = w;
    this.h = h;
  }

  void update() {
    strokeWeight(4);
    points[0] = new PVector(-w/2, -h/2);
    points[1] = new PVector(w/2, -h/2);
    points[2] = new PVector(w/2, h/2);
    points[3] = new PVector(-w/2, h/2);
    for (int i = 0; i < points.length; i++) {
      points[i].rotate(angle);
      points[i].add(this.pos);
      point(points[i].x, points[i].y);
    }
  }

  void display() {    
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(angle);
    noFill();
    if (over) stroke(255, 0, 0);
    else stroke(255, 255, 0);
    strokeWeight(1);
    rect(0, 0, w, h);
    popMatrix();
  }
}
