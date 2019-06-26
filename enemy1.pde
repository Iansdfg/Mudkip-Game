class enemy1{
  float x, y;
  float EnemySpeed;
  PShape s;
  
  enemy1(){
    x = 1270;
    y = random(50,height);
    EnemySpeed=7;
    s = loadShape("Gost.svg");
  }
  
  void display(){
    shape(s, x, y,120,90);
  }
  void move(){
    x = x - EnemySpeed;
  }
  
  void reset(){
    x = width;
  }
  
}
  

