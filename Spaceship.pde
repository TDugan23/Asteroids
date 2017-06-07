class Spaceship extends Floater  
{   
  public Spaceship()
  {
    corners = 3;  //the number of corners, a triangular floater has 3   
    xCorners = new int[] {-8, 16, -8}; 
    yCorners = new int[] {-8, 0, 8};
    myColor = 255;   
    myCenterX = width / 2;
    myCenterY = height / 2; //holds center coordinates   
    myDirectionX = 0;
    myDirectionY = 0; //holds x and y coordinates of the vector for direction of travel   
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
}
