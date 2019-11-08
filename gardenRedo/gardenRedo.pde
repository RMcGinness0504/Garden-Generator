//Robert McGinness
//Code 1
//Assignment 5: Digital Garden

int yValue = 200;
boolean firstLoop = true;

void setup() 
{
  size(600, 400);
  background(122,62,148);
  
  fill(255,200,0);
  ellipse(300,250,200,200);
  fill(105,66,31);
  rect(0,200,600,200);
  
  strokeWeight(2);
  noFill();
  for(int v = 0;v <= 600;v+=25)
    { 
      curve(v,200,v,150,v+25,150,v+25,200);
      line(v,150,v,200);
      line(v+25,150,v+25,200);
    }
  
  noStroke();
  
  frameRate(5);
}

void draw() 
{
  yValue+=3;
  if (yValue < 395)
  {
    drawPlant((int)random(0,600),yValue);
  }
  strokeWeight(4);
  stroke(0,0,0);
  noFill();
  
  for(int v = 0;v <= 600;v+=50)
  { 
    curve(v,400,v,300,v+50,300,v+50,400);
    line(v,300,v,400);
    line(v+50,300,v+50,400);
  }
}

void drawPlant(int center,int y)
{
  stem(center,y,(int)random(100,150));
}

void stem(int x,int y,int height)
{
  strokeWeight(6);
  stroke(0,random(100,200),0);
  line(x,y,x,y-height);
  int numLeaves = round(random(1,5));
  for(int z = 1;z < numLeaves;z++)
  {
    if (random(1) > 0.5)
    {
      leaf(x,y-(height/numLeaves + 1)*z,true);
    } else {
      leaf(x,y-(height/numLeaves + 1)*z,false);
    }
  }
  int[] colors = getRandomColor();
  flower(x,y-height,(int)random(30,60),(int)random(30,60),colors[0],colors[1],colors[2]);
}

int[] getRandomColor()
{
  int[] colors = {0,0,0};
  float r = random(1);
  if (r < 0.2)
  {
     colors[0] = 255;
     colors[1] = 255;
     colors[2] = 255;
  } else if (r < 0.4)
  {
     colors[0] = 250;
     colors[1] = 181;
     colors[2] = 255;
  } else if (r < 0.6)
  {
     colors[0] = 255;
     colors[1] = 38;
     colors[2] = 38;
  } else if (r < 0.8)
  {
     colors[0] = 136;
     colors[1] = 0;
     colors[2] = 255;
  } else
  {
     colors[0] = (int)random(150,255);
     colors[1] = (int)random(150,255);
     colors[2] = (int)random(150,255);
  }
  return colors;
}

void leaf(int x,int y,boolean isLeft)
{
    strokeWeight(2);
    stroke(0,150,0);
    fill(0,150,0);
    push();
    translate(x,y);
    if (isLeft)
    {
      rotate(45);
      ellipse(10,0,6,16);
    } else {
      rotate(-45);
      ellipse(-10,0,6,16);
    }
    pop();
}

void flower(int x, int y, int w, int h, int r, int g, int b)
{
   noStroke();
   float flowerType = random(1);
   if (flowerType < 0.33)
   {
    fill(r, g, b);
    push();
    translate(x,y);
    rotate(0);
    ellipse(0,0,w,h/2.3);
    ellipse(0,0,w/2.3,h);
    rotate(45);
    ellipse(0,0,w,h/2.3);
    ellipse(0,0,w/2.3,h);
    pop();
    fill(255,255,0);
    ellipse(x,y,w/2,h/2);
  
    fill(255,155,0);
    ellipse(x,y,w/4,h/4); 
   } else if (flowerType > 0.67) 
   {
      fill(r, g, b);
      push();
      translate(x,y);
      rotate(0);
      ellipse(0,0,w*1.5,h/3);
      ellipse(0,0,w/3,h*1.5);
      rotate(45);
      ellipse(0,0,w*1.5,h/3);
      ellipse(0,0,w/3,h*1.5);
     
      fill(255);
      rotate(0);
      ellipse(0,0,w*1,h/5);
      ellipse(0,0,w/5,h*1.2);
      rotate(45);
      ellipse(0,0,w*1,h/5);
      ellipse(0,0,w/5,h*1.2);
      pop();
      fill(255,200,0);
      ellipse(x,y,w/2,w/2);
    } 
  else
   {
    fill(r, g, b);
    arc(x,y-5,w/2,h,-0.4,3.6);
   }
}
