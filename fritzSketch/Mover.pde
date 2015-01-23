class Mover
{
  public ArrayList<Mover> listMovers;
  ArrayList<PImage> images;

  public PImage startImage;
  public PImage endImage;
  private int index;

  public PVector position;
  public PVector delta;

  public float rotation;

  boolean isAnim;
  boolean isDead;
  boolean isKiller;

  Mover(ArrayList<Mover> listMovers, ArrayList<PImage> images, PVector position, float rotation)
  {
    this.listMovers = listMovers;
    this.images = images;
    this.position = position;
    this.rotation = rotation;
    
    index = 0;
    startImage = images.get(0);
    endImage = images.get(images.size()-1);
    
    delta = new PVector();
    
    isKiller = false;
    isDead = false;
  }

  void draw()
  {
    if (isAnim && index < images.size()-1 && frameCount % 3 == 0) {
      index++;
    }

    pushMatrix();
    translate(position.x, position.y);
    rotateZ(rotation);
    image(images.get(index), 0, 0);
    popMatrix();
  }

  void update()
  {
    position.add(delta);
    checkCollision();
  } 

  void checkCollision()
  {
    if (!isKiller) return;
    for (Mover m : listMovers)
    {
      if (m == this || m.isDead || this.isDead ) continue;

      float distance = PVector.dist(this.position, m.position);

      if ( distance < startImage.width)
      {
        // collision
        println("Collision");
        delta = new PVector();
        m.explode();
      }
    }
  }

  void explode()
  {
    isDead = true;
    isAnim = true;
  }

  void moveToPosition(PVector destination, float duration)
  {
    isKiller = true;

    PVector directionVector = PVector.sub(destination, position);  
    float velocity = directionVector.mag() / (duration * 60);
    directionVector.normalize();
    delta = PVector.mult(directionVector, velocity);
  }
}
