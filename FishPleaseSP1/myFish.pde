class Fish {
  float size;
  float x, y;

  Fish() {
    size = 20;
    x = mouseX;
    y = mouseY;
  }

  void move(float targetX, float targetY) {
    x = targetX;
    y = targetY;
  }

  void display() {
    // hale
    stroke(100);
    fill(255, 172, 70);
    triangle(x - size * 0.9, y, x - size * 1.5, y - size * 0.5, x - size * 1.5, y + size * 0.5);

    // Krop
    ellipse(x, y, size * 2, size);

    // øjet
    fill(0);
    ellipse(x + size * 0.4, y - size * 0.1, size * 0.2, size * 0.2);
  }

  void grow() {
    size += 1;
  }

  void shrink() {
    size -= 1;
    if (size < 1) {
      size = 1;
    }
  }

  boolean eats(EnemyFish enemy) {
    float d = dist(x, y, enemy.x, enemy.y);
    return d < size && size > enemy.size;
  }

  boolean isEatenBy(EnemyFish enemy) {
    float d = dist(x, y, enemy.x, enemy.y);
    return d < enemy.size && size < enemy.size;
  }
}
