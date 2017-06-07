class Asteroid extends Floater
{
  public Asteroid()
  {

    corners = 9;
    float radius=20;
    float angle =TWO_PI/corners;
    float r=10;
    xCorners = new int[corners];
    yCorners = new int[corners];
  
    for (int i = 0; i < xCorners.length; i++) {
      xCorners[i] = (int)((radius+random(-r,r))*sin(angle*i));
      yCorners[i] = (int)((radius+random(-r,r))*cos(angle*i));
    }
    
    myColor = 255;   
   
    if (random(1) < .5) {
     myCenterX = (int)random(width);
     myCenterY = 0;
    }
    else {
      myCenterX = 0;
      myCenterY = (int)random(height);
    }//holds center coordinates   
    myDirectionX = random(-5,5);
    if (abs((float)myDirectionX) <.7)
    {
      myDirectionX=.7;
    }
    myDirectionY = random(-5,5); //holds x and y coordinates of the vector for direction of travel   
    myPointDirection = 0; //holds current direction the ship is pointing in degrees
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
    myDirectionX = x;
  }

  public double getDirectionX()
  {
    return (double)myDirectionX;
  }

  public void setDirectionY(double y)
  {
    myDirectionY = y;
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
}