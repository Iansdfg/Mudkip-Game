class waterGun{
  float x,y,speed;
  boolean active;
  int num=0;
  
  waterGun(float _x){
    x = _x;
    speed = 10;
    active = false;
  }

  void display(){
    fill(#6094a8);
    noStroke();
    y = mouseY+70;
    ellipse(x,y,30,30);
  }
  
  void move(int v){
    if(this.active = true){
       x = x+v;
    }
  }
  
  void reset(){
    x = 50;
    this.speed=0;
    //num+=1;
  }
  
  
  boolean intersect (enemy1 e){
    float distance = dist(this.x, this.y, e.x+80, e.y+50);
    if(distance < 80){
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean intersect (enemy2 e){
    float distance = dist(this.x, this.y, e.x+80, e.y+50);
    if(distance < 80){
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean intersect (enemy3 e){
    float distance = dist(this.x, this.y, e.x+80, e.y+50);
    if(distance < 80){
      return true;
    }
    else {
      return false;
    }
  }
}
