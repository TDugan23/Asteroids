Spaceship player;
Star[] stars = new Star[(int)random(30,40)];
ArrayList<Integer> highScores= new ArrayList<Integer>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int lives;
int gameMode;
int score;
boolean movingW = false;
boolean movingA = false;
boolean movingD = false;
boolean instructions=false;
int level;




public void setup() 
{
  color(255,255,255);
  highScores.add(-1);
  score=0;
  gameMode=0;
  size(1000, 1000);
  player = new Spaceship();
  makeStars();
  lives=10;
  level=0;
 
}

public void draw() 
{
 
  if(gameMode==0 && !instructions)
  {
    background(23,0,50);
    showStars();
    
    textSize(143);
    float w=textWidth("ASTEROIDS");
    text("ASTEROIDS",(width/2)-(w/2),300);
    
    textSize(35);
    float t=textWidth("Press Q to Start");
    text("Press Q to Start",(width/2)-(t/2),400);
   
    textSize(35);
    float f=textWidth("Press I For Instructions");
    text("Press I For Instructions",(width/2)-(f/2),700);
   
   
    
    reset();
    
  }
  if(instructions)
  {

    background(23,0,50);
    showStars();
 
    float y=textWidth("The goal of this game is to shoot as many ");
    text("The goal of this game is to shoot as many",(width/2)-(y/2),100);
    
    y=textWidth("asteroids as you can. Once you shoot all the visible");
    text("asteroids as you can. Once you shoot all the visible",(width/2)-(y/2),150);
    
    y=textWidth("asteroids on the screen, you advance to the next level.");
    text("asteroids on the screen, you advance to the next level.",(width/2)-(y/2),200);
   
    y=textWidth("One asteroid counts for one point.");
    text("One asteroid counts for one point.",(width/2)-(y/2),250);
   
    y=textWidth("You have ten lives, but you lose a life whenever");
    text("You have ten lives, but you lose a life whenever",(width/2)-(y/2),300);
   
    y=textWidth("an asteroid hits you.");
    text("an asteroid hits you.",(width/2)-(y/2),350);
    
    
    textSize(35);
    float m=textWidth("Press W to accelerate.");
    text("Press W to accelerate.",(width/2)-(m/2),500);
    
    float n=textWidth("Press A&D to turn.");
    text("Press A&D to turn.",(width/2)-(n/2),550);
   
    float t=textWidth("Press S for hyperspace.");
    text("Press S for hyperspace",(width/2)-(t/2),600);
    
    float j=textWidth("Press SPACE to shoot.");
    text("Press SPACE to shoot",(width/2)-(j/2),650);
    
    j=textWidth("Press o to return.");
    text("Press o to return.",(width/2)-(j/2),750);
    
  }
  if(gameMode==1)
  {
    
    
  background(23,0,50);
  player.show();
  showStars();
  if(movingW)
  {
    player.accelerate(.23);
  }
  if(movingD)
  {
    player.turn(10);
  }
  if(movingA)
  {
    player.turn(-10);
  }
  player.move();
  player.show();
  showAsteroids();
  showBullet();
  textSize(40);
  fill(255,255,255);
  text(lives,75,100);
  fill(255,255,255);
  text(score,75,150);

  
  checkGameOver();
  }
  if (gameMode==2)
  {

    background(10);
    textSize(143);
    float l=textWidth("GAMEOVER");
    text("GAMEOVER",(width/2)-(l/2),400);
     
    textSize(50);
    float p=textWidth("Score is " + score);
    text("Score is " + score,(width/2)-(p/2),550); 
    
    
    
    float m=textWidth("Highscores:");
    text("Highscores:",(width/2)-(m/2),650);
    int u=700;
    for(int i=0; i<3 && i<highScores.size(); i++)
    {
      if (highScores.get(i)==-1)
      {
      }
      else{
      m=textWidth(""+highScores.get(i));
      text(""+highScores.get(i),(width/2)-(m/2),u);
      u+=50;
      }
      
    }
    textSize(35);
    m=textWidth("Press Y");
    
    text("Press Y",(width/2)-(m/2),u+50);
 
    
    
//    for(int g=0; g<highscores.size(); g++)
//    {
      
//    }
    
    
    
    
  }
}

public void keyPressed()
{
   if (key == 'i'&& gameMode==0)
  {
    instructions=true;
    //player.accelerate(.5);
  }
  
  if (key == 'o' && gameMode==0)
  {
    instructions=false;
    //player.accelerate(.5);
  }
  
  if (key == 'w')
  {
    movingW = true;
    //player.accelerate(.23);
  }
  if (key == 'd')
  {
    movingD = true;
    //player.turn(10);
  } 
  if (key == 'a')
  {
    movingA = true;
    //player.turn(-10);
  }
  if (key == 's')
  {
    hyperspace();
  }
  if (key == ' ')
  {
    makeBullet();
  }
  if (key == 'q' && gameMode==0)
  {
    gameMode=1;
    
  }
  if (key == 'y')
  {
    gameMode=0;
    lives=10;
    score=0;
  }
}
public void keyReleased()
{
  if (key == 'w')
  {
    movingW = false;
   // player.accelerate(.5);
  }
  if (key == 'd')
  {
    movingD = false;
    //player.turn(10);
  } 
  if (key == 'a')
  {
    movingA = false;
    //player.turn(-10);
  }
}
void makeBullet() {
  bullets.add(new Bullet(player));
  
}
void showBullet(){
    for(int i = bullets.size()-1; i > 0; i--) {
      bullets.get(i).move();
      bullets.get(i).show();
      int x = bullets.get(i).getX();
      int y = bullets.get(i).getY();
      if(x>width || x<0 || y>height || y<0)
      {
        bullets.remove(i);
        break;
      }
       for (int j= asteroids.size()-1;j>=0;j--)
      {
        boolean collided = bullets.get(i).checkCollision(asteroids.get(j).getX(),asteroids.get(j).getY());
        if (collided)
        {
          asteroids.remove(j);
          bullets.remove(i);
          score++;
          break;
        }
      }
  }
}

void hyperspace(){
    player.setX((int)random(width));
    player.setY((int)random(height));
    player.setPointDirection((int)random(360));
    player.setDirectionX(0);
    player.setDirectionY(0);
}
void makeStars() {
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(); 
  }
}
void showStars() {
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
}

void makeAsteroid() {
  asteroids.add(new Asteroid());
}
void reset()
{
    player.setX(width/2);
    player.setY(height/2);
    player.setPointDirection(0);
    player.setDirectionX(0);
    player.setDirectionY(0);
    for(int i = asteroids.size()-1; i>=0; i--)
    {
      asteroids.remove(i);
    }
    for (int j=0; j<10; j++)
    {
      makeAsteroid();
    }
}
void showAsteroids() {
  for(int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).move();
    asteroids.get(i).show();
    boolean collided = asteroids.get(i).checkCollision(player.getX(),player.getY());
    if (collided)
    {
      lives--;
      hyperspace();
    }
    
    
  }
  if(asteroids.size()==0)
    {
      level++;
      print(asteroids.size());
      for(int e=0; e<5+2*level; e++)
      {
        makeAsteroid();
      }
    }
}
void checkGameOver(){
 
  if (lives<=0 || key == 'm'){
    gameMode=2;
    
      
    int highScoreSize = highScores.size();
    if (highScores.size()>0)
    {
       for (int i=0; i<highScoreSize;i++)
      {
        if (score>highScores.get(i))
        {
          highScores.add(i, score);
          break;
        }
      }   
     }
     else
     {
       highScores.add(score);
     }
     print(highScores);
  }
}
