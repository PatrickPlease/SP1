class EnemyFish {
  float size;
  float x, y;
  float speed;

  EnemyFish() {
    size = random(5, 80);
    x = width + random(50, 200); 
    y = random(height - 50);
    speed = random(2, 5); 
  }

  void move() {
    x -= speed;
  }

  void display() {
    // Hale
    stroke(100);
    fill(255, 0, 0);
    triangle(x + size * 0.9, y, x + size * 1.5, y - size * 0.5, x + size * 1.5, y + size * 0.5);

    // Krop
    fill(255, 0, 0); 
    ellipse(x, y, size * 2, size);

    // Øje
    fill(0);
    ellipse(x - size * 0.4, y - size * 0.1, size * 0.2, size * 0.2);
  }

  boolean isOffscreen() {
    return x < -size;
  }

  void reset() {
    x = width + random(50, 200);
    y = random(height - 50);
    size = random(5, 80);
    speed = random(2, 5);
  }
}
