class Bullet extends Floater
{
  //private float dirX;
  public Bullet(Spaceship player)
  {
    corners = 4;    
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 4;
    yCorners[0] = -1;
    xCorners[1] = 4;
    yCorners[1] = 1;
    xCorners[2] = -4;
    yCorners[2] = 1;
    xCorners[3] = -4;
    yCorners[3] = -1;
    //for (int i = 0; i < xCorners.length; i++) {
    //  xCorners[i] = (int)random(3,20);
    //  yCorners[i] = (int)random(3,20);
    //}
    
    myColor = color((int)random(255),(int)random(255),(int)random(255));   
   
      //bullet starts from spaceship location
    myCenterX = player.getX();
    myCenterY = player.getY();
    //holds center coordinates 
    myPointDirection=player.getPointDirection();
    myDirectionX = 10*Math.cos(myPointDirection*Math.PI/180);
    myDirectionY = 10*Math.sin(myPointDirection*Math.PI/180); //holds x and y coordinates of the vector for direction of travel   
   
  
  }

  public void setX(int x)
  {
    myCenterX = x;
  }

  public int getX()
  {
    return (int)myCenterX;
    
  }

  public void setY(int y)
  {
    myCenterY = y;
  }

  public int getY()
  {
    return (int)myCenterY;
  }

  public void setDirectionX(double x)
  {
  }

  public double getDirectionX()
  {
    return (double)myDirectionX;
  }

  public void setDirectionY(double y)
  {

  }

  public double getDirectionY()
  {
    return (double)myDirectionY;
  }

  public void setPointDirection(int degrees)
  {
    myPointDirection = degrees;
  }

  public double getPointDirection()
  {
    return (double)myPointDirection;
  }
  public boolean checkCollision(double x, double y)
  {
    float distance = dist((float)x,(float)y,(float)getX(),(float) getY());
    float collisionThreshold =15+16;
    return (collisionThreshold>distance);
   
  }
  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;}
}
