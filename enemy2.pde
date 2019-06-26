class enemy2{
  float x, y;
  float EnemySpeed;
  PShape s;
  
  enemy2(){
    x = 1270;
    y = random(50,height);
    EnemySpeed=10;
    s = loadShape("haunted.svg");
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
  

