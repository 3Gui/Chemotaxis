int temp=300;
square[] sqa;
void setup(){
  textSize(15);
  frameRate(60);
  size(500,600);
 rectMode(CENTER); 
 sqa = new square[20];
 for(int i = 0; i < sqa.length; i++){
   sqa[i]= new square((int)(Math.random()*300) +100,(int)(Math.random()*300) +100, (int)(Math.random()*50) +25);
   
 }
}

void draw(){
  stroke(0);
   background(175+temp/10,175-temp/100,175-temp/100);
   fill(0);
   text("Temperature = "+(temp)+" Kelvin",150,570);
   while (temp <= 0){
   
   nLoop();
 }
for(int i = 0; i < sqa.length; i++){
   sqa[i].show();
   sqa[i].move();
 }
 loop();
}

public class square {
  
  private int mSize, mX, mY,mCol, cout = 0, cout1 = 0;
  private int pulse = (int)(Math.random()*2)+4;
  private float rot = 1;
  private float rc = 0.1;
  square(int x, int y, int s){
    mSize = s;
    mY = y;
    mX = x;
    mCol = color((int)(Math.random()*155 )+100,(int)(Math.random()*155) +100,(int)(Math.random()*155) +100);
  }
  
  void show(){
    
    fill(mCol);
    pushMatrix();
    translate(mX , mY); 
    rotate(rot);
    rect(0, 0, mSize + pulse, mSize+pulse,mSize/2.5);
    popMatrix();
    rot+=rc;
    cout++;
    cout1++;
    if (cout>100){
      rc = (float)(Math.random()*0.4)-0.2;
      cout = 0;
      
    }
    if (cout1>(int)(Math.random()*10)+5){
      pulse = -pulse ;
      cout1 = 0;
   
    }
  }
  void move(){
    mX += (int)(Math.random()*(4+temp/50)-(2+temp/100));
    if(mX > 500 || mX < 0){
     mX = 100; 
    }
    mY += (int)(Math.random()*(4+temp/50)-(2+temp/100));
    if(mY > 500|| mY < 0){
     mY = 100; 
    }
  }
 }
 
 void keyPressed(){
   if (keyCode==UP){
     temp+=10;
   }
   
   if (keyCode==DOWN){
     temp-=10;
     
     if (temp <= 0){
        noStroke();
        fill(175+temp/10,175-temp/100,175-temp/100);
        rect(250, 575, 500,100);
        fill(0);
        text("Temperature = "+(temp)+" Kelvin",150,570);
       temp = 0;
     }
   }     
 }
 
 void nLoop(){
   noLoop();
 }
 
