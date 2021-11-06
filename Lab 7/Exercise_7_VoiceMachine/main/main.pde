import processing.sound.*;

bird bird; PImage birdSprite;
drawPipes pipes; PImage pipedown; PImage pipeup;
scoreManager score;

void setup() {
  size(1024, 1024);
  background(0, 0, 0);
  setupSound();  
  
  birdSprite = loadImage("flappybird.png");
  pipedown = loadImage("pipedown.png");
  pipeup = loadImage("pipeup.png");
  
  bird = new bird(new PVector(width / 2, height / 2), new PVector(0, 0), new PVector (0, 0.75), birdSprite);
  pipes = new drawPipes(pipedown, pipeup); pipes.reset();
  score = new scoreManager(0);
}

void draw() {
  clear();
  
  updateSound();  
  
  bird.sim();
  pipes.sim();
  
  if(int(pipes.position.x) == 514) {
    println("passing pipe");
    if(bird.position.y < (pipes.position.y + 150) && bird.position.y > (pipes.position.y - 150)) {
      score.score++;
    } else {
      score.score--;
    }
  }
  
  score.show();
}
