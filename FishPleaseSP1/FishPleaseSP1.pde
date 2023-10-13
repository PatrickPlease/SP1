Fish myFish;
float score = 0;
ArrayList<EnemyFish> enemyFish = new ArrayList<EnemyFish>();
boolean gameOver = false;

void setup() {
  size(400, 500);
  noCursor();

  myFish = new Fish();

  for (int i = 0; i < 5; i++) {
    enemyFish.add(new EnemyFish());
  }
}

void draw() {

  noStroke();
  background(70, 238, 255);


  if (!gameOver) {

    score = (myFish.size * 10) - 200;
    fill(255, 0, 0, 80);
    rect(20, 15, 360, 35);
    fill(255);
    textSize(30);
    text("Score:  " + int(score), 25, 45);

    myFish.move(mouseX, mouseY);
    myFish.display();

    for (int i = enemyFish.size() - 1; i >= 0; i--) {
      EnemyFish enemy = enemyFish.get(i);

      if (myFish.eats(enemy)) {
        myFish.grow();
        enemyFish.remove(i);
      } else if (myFish.isEatenBy(enemy)) {
        gameOver = true;
        break;
      } else {
        enemy.move();
        enemy.display();

        if (enemy.isOffscreen()) {
          enemy.reset();
        }
      }
    }

    if (frameCount % 120 == 0) {
      enemyFish.add(new EnemyFish());
    }
  } else if (myFish.size == 100) {
    
    // Spil gennemført
    rectMode(CENTER);
    fill(0, 0, 0, 100);
    rect(200, 250, 270, 290);
    fill(0);
    rect(200, 310, 250, 100);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("Du vandt!", 200, 200);
    textSize(30);
    fill(255, 0, 0);
    text("Din score var: ", 200, 280);
    fill(255);
    textSize(45);
    text(int(score), 200, 330);

    textSize(15);
    text("FishPlease SP1 - Lavet af Patrick Kjøller", 200, 130);
  } else {
    
    // Game over besked
    rectMode(CENTER);
    fill(0, 0, 0, 100);
    rect(200, 250, 270, 290);
    fill(0);
    rect(200, 310, 250, 100);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("Game Over!", 200, 200);
    textSize(30);
    fill(255, 0, 0);
    text("Din score var: ", 200, 280);
    fill(255);
    textSize(45);
    text(int(score), 200, 330);

    textSize(15);
    text("FishPlease SP1 - Lavet af Patrick Kjøller", 200, 130);
  }
}

// En lille cheat code til at gøre sig større eller mindre
void keyPressed() {
  if (key == '+' && !gameOver) {
    myFish.grow();
  } else if (key == '-' && !gameOver) {
    myFish.shrink();
  }
}

// Et spil der minder om hvor en fisk spiser en mindre fisk og bliver større
// Der skal være forskellige typer "onde fisk" med forskellige hastigheder og størrelser
// Svømmer man ind i en større fisk har man tabt
