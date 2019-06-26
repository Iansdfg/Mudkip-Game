import ddf.minim.*;
import ddf.minim.analysis.*;
float timer = 0;
float min, max;
PShape s;
PShape s1;
PShape s2;
waterGun W;
surf Su;
ArrayList<enemy1> enemies1 = new ArrayList<enemy1>();
ArrayList<enemy2> enemies2 = new ArrayList<enemy2>();
ArrayList<enemy3> enemies3 = new ArrayList<enemy3>();
int speed;
int speedSU;
int level=1;
PFont font;
int life=300;
boolean gameStart;
boolean endPage;
int SufNum = 3;
Minim minim;
AudioPlayer player;
AudioSample evo;
AudioSample hit;
AudioSample wall;

void setup() {
  size(displayWidth, 800);
  minim = new Minim(this);
  player = minim.loadFile("wild.mp3", 1024);
  evo = minim.loadSample("evolev.mp3", 512);
  wall = minim.loadSample("RICOCHET.WAV", 512);
  hit = minim.loadSample("punch_or_whack_-Vladimir-403040765.mp3", 512);
  player.loop();
  s = loadShape("RIGHT.svg");
  s1 = loadShape("Marshtomp.svg");
  s2 = loadShape("Marshtomp3.svg");
  W = new waterGun(50);
  Su = new surf();
  font = createFont("Track Italic.ttf", 25,true);
  textFont(font);
  enemies2 = new ArrayList<enemy2>();
  
  gameStart = true;
  endPage = false;
}


void draw() {
  
  if(gameStart == true){
    background(#ffffff);
    //text
    smooth();
    textSize(25);
    text("Level: ", 30, 50);
    text( level , 150, 50);
    text( "HP: " , 220, 50);
    text( "Surf: " , width-250, 50);
    text( SufNum  , width-150, 50);
    
    
  if(millis()/1000-timer >= 0.5){
    timer = millis()/1000;
    println(timer);
    if(level>15)enemies2.add(new enemy2());
    if(level>35)enemies3.add(new enemy3());
    enemies1.add(new enemy1());
  }
    
    
    //waterGun  
    W.active=false;
    W.display();
    W.move(speed);
    if(W.x>width){
        W.reset();
        speed=0;
        W.active=false;
    }
    Su.active=false;
    Su.display();
    Su.move(speedSU);
    if(Su.x>width){
        Su.reset();
        speedSU=0;
        Su.active=false;
    }

    
    //gostly show up
    for (int i = enemies1.size()-1; i>=0; i--){
        enemy1 e = enemies1.get(i);
        e.display();
        e.move();
         //gostly hit wall
         if(e.x<0){
           wall.trigger();
           enemies1.remove(i);
           life-=50;
         }
         //water ball hit gostaly 
         if(W.intersect(e)||Su.intersect(e)){
           hit.trigger();
           enemies1.remove(i);
           if(e.EnemySpeed<=0.3){
             e.EnemySpeed+=0.01;
           }
           speed=0;
           W.reset();
           level++;
        }
    }
  
    //haunted show up
    for (int i = enemies2.size()-1; i>=0; i--){
        enemy2 e = enemies2.get(i);
          e.display();
          e.move();
         //haunted hit wall
         if(e.x<0){
           wall.trigger();
           enemies2.remove(i);
           life-=100;
         }
         //water ball hit haunted 
         if(W.intersect(e)||Su.intersect(e)){
           hit.trigger();
           enemies2.remove(i);
           speed=0;
           W.reset();
           level++;
        }
    }
    
    //gango show up
    for (int i = enemies3.size()-1; i>=0; i--){
        enemy3 e = enemies3.get(i);
          e.display();
          e.move();
         //haunted hit wall
         if(e.x<0){
           wall.trigger();
           enemies3.remove(i);
           life-=150;
         }
         //water ball hit haunted 
         if(W.intersect(e) ||Su.intersect(e)){
           hit.trigger();
           enemies3.remove(i);
           speed=0;
           W.reset();
           level++;
        }
    }

     //show mudkip in first layer
     if(level==35){
       evo.trigger();
       SufNum=7;
     }
     if(level==15){
       evo.trigger();
       SufNum=5;
     }
     if(level>=36){
         shape(s2, -40,mouseY-80,300,250 );
         rect(280,30,life+200,20);
     }
     else if(level>=16){
         shape(s1, 10,mouseY,110,150 ); 
         rect(280,30,life+200,20);
     }else{
         shape(s, 10,mouseY,80,110 );
         rect(280,30,life,20);
     }
     
     //life
     if(life>=0){
       rect(280,30,life,20);
     }else{
       rect(280,30,0,20);
     }

  }
  
  //end page
    if(endPage == true){
        background(#ffffff);
        textSize(50);
        text("GAME OVER",width/2-100,height/2);
        text("PRESS ENTER TO RESTART",width/2-250,height/2+100);
        enemies2.clear();
        enemies3.clear();
        enemies1.clear();
        life=300;
    }

     
   //page and game star control
   if (life<0){
     gameStart = false;
     endPage = true;
     life = 500;
    }
}
  
void mousePressed() {
   speed = 100;
}


void keyPressed(){
  if (keyCode == ENTER){
   gameStart = true; 
   endPage = false;
   level = 0;
  }
  
 if ( key == ' ' && SufNum >0 ){
   speedSU=80;
   SufNum--;
   }
     
  }
