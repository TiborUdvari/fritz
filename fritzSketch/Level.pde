class Level {

  JSONArray values;

  ArrayList<Mover> listMovers;

  Level(String levelName)
  {
    ArrayList<PImage> t1 = new ArrayList();
    for (int i = 0; i < 9; i++) {
      t1.add(loadImage("t1/t" + nf(i, 1) + ".png"));
    }

    listMovers = new ArrayList<Mover>();

    values = loadJSONArray(levelName);
    for (int i = 0; i < values.size (); i++)
    {
      JSONObject obj = values.getJSONObject(i); 

      float x = obj.getFloat("x");
      float y = obj.getFloat("y");
      float rotation = obj.getInt("rotation") * PI / 180;

      listMovers.add(new Mover(listMovers, t1, new PVector(width * x, height * y), rotation));
    }
  }

  void update()
  {
    for (Mover m : listMovers)
    {
      m.update();
      m.draw();
    }
  }

  void click()
  {
    listMovers.get(0).moveToPosition(listMovers.get(1).position, 0.3);
  }
}
