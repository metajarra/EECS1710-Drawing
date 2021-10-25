PImage _player; PImage _player2;
PImage _net;
PImage _ball;
PImage _background;
PImage _goal;
PImage _defense;

player player;
ballSpawner spawner;
net net;
ball ball;
scoreManager manager;

void setup() {
  _player = loadImage("player1.png");
  _player2 = loadImage("player2.png");
  _net = loadImage("net1.png");
  _ball = loadImage("ball1.png");
  _background = loadImage("background.png");
  _goal = loadImage("goal.png");
  _defense = loadImage("defense.png");
  
  ball = new ball(new PVector(0, 4000), new PVector(), new PVector(0, 0.49), _ball);
  manager = new scoreManager(_goal, _defense);
  player = new player(new PVector(300, 700), new PVector(0, 0), new PVector(0, 0), _player, _player2, ball, manager);
  spawner = new ballSpawner(ball, manager);
  net = new net(_net, new PVector(30, 540), new PVector(246, 0), ball, manager);
  
  size(1536, 1024, P3D);
  background(_background);
}

void draw() {
  background(_background);
  
  spawner.ball = ball;
  net.ball = ball;
  
  manager.show();
  
  player.sim();
  net.sim();
  spawner.sim();
  ball.sim();
}
