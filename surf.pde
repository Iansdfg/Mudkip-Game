class surf{
  float x,y,speed;
  boolean active;
  int num=0;
  
  surf(){
    speed = 10;
  }

  void display(){
    fill(#6094a8);
    noStroke();
    rect(x-30,y,30,height);
  }
  
  void move(int v){
    if(this.active = true){
       x = x+v;
    }
  }
  
  void reset(){
    x = -30;
    this.speed=0;
    //num+=1;
  }
  
  
  boolean intersect (enemy1 e){
    if(this.x>e.x+80){
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean intersect (enemy2 e){
    if(this.x>e.x+80){
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean intersect (enemy3 e){
    if(this.x>e.x+80){
      return true;
    }
    else {
      return false;
    }
  }
  
}
