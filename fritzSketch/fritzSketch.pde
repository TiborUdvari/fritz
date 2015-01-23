Level level;

void setup()
{
  size(1024, 768, P3D);
  imageMode(CENTER);
  
  frameRate(60);
  
  level = new Level("l1.json");
}

void mouseClicked()
{
  level.click();
}

void draw()
{
  background(255);   
  level.update();
}
