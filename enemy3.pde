class enemy3{
  float x, y;
  float EnemySpeed;
  PShape s;
  
  enemy3(){
    x = 1270;
    y = random(50,height);
    EnemySpeed=13;
    s = loadShape("gango.svg");
  }
  
  void display(){
    shape(s, x, y,180,160);
  }
  void move(){
    x = x - EnemySpeed;
  }
  
  void reset(){
    x = width;
  }
  
}
  

