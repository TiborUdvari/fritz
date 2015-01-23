Mover m1, m2;

ArrayList<Mover> listMovers;

void setup()
{
  size(displayWidth, displayHeight, P3D);
  imageMode(CENTER);
  
  frameRate(60);
  
  listMovers = new ArrayList<Mover>();
  
  ArrayList<PImage> t1 = new ArrayList();
  for (int i = 0; i < 9; i++) {
     t1.add(loadImage("t1/t" + nf(i, 1) + ".png"));
  }
  
  m1 = new Mover(listMovers, t1, new PVector(width * 0.2, height * 0.5), 0);
  m2 = new Mover (listMovers, t1, new PVector(width * 0.8, height * 0.5), PI);  
}

void mouseClicked()
{
  m1.moveToPosition(m2.position, 0.3); 
}

void draw()
{
  background(255);   
  
  for (Mover m: listMovers)
  {
    m.update();
    m.draw();
  }
}
