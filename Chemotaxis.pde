//player vars
P P1;
boolean gameover = false;
int px,py,score,highest;
int H = 10;

//bacteria vars
B B1;
B [] B2;
int size = 10;
float xpos;
float ypos;
int RBspawnX = (int)(Math.random()*500);
int RBspawnY = (int)(Math.random()*500);
//float speed = 4;
float angle;

//food vars
F F1;
int RFspawnX = (int)(Math.random()*500);
int RFspawnY = (int)(Math.random()*500);



void setup()
{
  size(500,500);
  textAlign(CENTER);
  rectMode(CENTER);
  cursor(CROSS);
  xpos = RBspawnX;
  ypos = RBspawnY;
}
void draw()
{
  background(0);
  Food();
  player();
  Bacteria();
  collision();
  Game();
  //int mouseX1 = mouseX;
  //int mouseY1 = mouseY;
}
void collision(){
    float bx = B1.mx;
    float by = B1.my;
    int fx = F1.mx;
    int fy = F1.my;
    if(dist(mouseX,mouseY,bx,by)<(size/2+10))
    {
        H = H - 1;      
    }
    if(dist(mouseX,mouseY,fx,fy)<17.5)
    {
        score = score + 1;
        RFspawnX = (int)(Math.random()*500);
        RFspawnY = (int)(Math.random()*500);
    }
}
void Game()
{
  textSize(15);
  fill(255,255,255);
  text("Health = "+H, 50,15);
  text("Score = "+score, 150,15);
  text("highest = "+highest, 250, 15);
    if (H<=0)
    {
      gameover = true;
    }
    else
    {
      gameover = false;
    }
    if(gameover == true)
    {
        text("GAME OVER", 250,250);
        noLoop();
    }
    if (highest <= score)
    {
      highest = score;
    } 
}
void keyPressed()
{
  if(key =='r' || key == 'R')
    {      
      loop();
      gameover = false;
      H = 10;
      score = 0;
      RBspawnX = (int)(Math.random()*500);
      RBspawnY = (int)(Math.random()*500);
      RFspawnX = (int)(Math.random()*500);
      RFspawnY = (int)(Math.random()*500);
    }
}


class B{
  float mx, my, speed;
  int rand = ((int)(Math.random()*1000)-500);
  boolean Btf = false;
  B(int x, int y, int s)
  {
    speed = s;
    mx = x;
    my = y;    
  }
  void show()
  {       
    if (abs(xpos - mouseX+rand) > 2 || abs(ypos - mouseY+rand) > 2) {
      angle = atan2(mouseY+rand - ypos, mouseX+rand- xpos);
      xpos = xpos + round(speed * cos(angle));
      ypos = ypos + round(speed * sin(angle));
    }    
    fill(255,0,0);    
    rect(xpos,ypos,size,size);
    mx = xpos;
    my = ypos;
  }
  
}
void Bacteria()
{
  size = score/2+10;
  B1 = new B (RBspawnX,RBspawnY, 1);
  B1.show();
  B2 = new B[10];
  int i = 0;
  while(i < B2.length)
  {
    B2[i] = new B(RBspawnX,RBspawnY, 1);
    i++;
  }
  for(int x = 0; x < B2.length; x++)
  {    
    B2[x].show();
  }
}


class F{
  int mx, my, mF;
  boolean Ftf = false;
  F(int x, int y)
  {
    mx = x;
    my = y;
  }
  void show()
  {
    fill(0,255,0);
    ellipse(mx,my,15,15);
  }
}
void Food()
{  
  F1 = new F(RFspawnX,RFspawnY);
  F1.show();
}


class P{
  int mx, my, mF;
  boolean Ptf = false;
  P(int x, int y)
  {
    mx = x;
    my = y;
  }
  void show()
  {
    //fill(0,255,0);
    //ellipse(mx,my,15,15);
  }
  void player()
  {  
  px = mouseX;
  py = mouseY;
  fill(255,255,255);
  ellipse(px,py,20,20);
  }  
}
void player(){
  P1 = new P(px,py);
  P1.show();
  P1.player();
}
