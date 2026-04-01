
ArrayList<Float> x1 = new ArrayList<Float> ();
ArrayList<Float> y1 = new ArrayList<Float> ();

boolean drawShape = false;


void setup(){
  size(600,600);
}

void draw(){
  background(200);
  City();
  //monodrone(mouseX,mouseY);
  
  if (drawShape){
    for (int i = 0; i < x1.size(); i++){
    monodrone(x1.get(i),y1.get(i));
    }
  }
  monodrone(mouseX,mouseY);
}

void keyPressed(){
  if (key == ' '){
  drawShape = true;
  x1.add((float)mouseX);
  y1.add((float)mouseY);
  }
  if (key == 'c'){
    clearAll();
  }
}

void clearAll(){
  x1.clear();
  y1.clear();
  background(200);
}

void City(){//The Planes Mechanus
  circle(150,250,200);
  circle(30,380,150);
  circle(100,480,100);
  circle(200,100,120);
  circle(100,-20,200);
}

void monodrone(float x,float y){
  
  pushMatrix();
  translate(x,y);
  circle(260-300,270-300,20);
  circle(340-300,270-300,20);

  rect(295-300,240-300,10,30);//top
  rect(290-300,240-300,20,5);//top

//arm

  rect(350-300,295-300,5,20);
  rect(245-300,295-300,5,20);

  rect(246-300,315-300,2,30);
  rect(352-300,315-300,2,30);

  ellipse(353-300,350-300,5,8);
  ellipse(248-300,350-300,5,8);

  rect(246-300,355-300,2,15);
  rect(352-300,355-300,2,15);

  circle(353-300,370-300,6);
  circle(247-300,370-300,6);

  //line(352-300,370-300,350,380);


//legs

  fill(255);
  rect(270-300,340-300,5,30);
  rect(325-300,340-300,5,30);
  ellipse(272-300,380-300,10,20);
  ellipse(327-300,380-300,10,20);

  rect(270-300,390-300,5,30);
  rect(325-300,390-300,5,30);
  triangle(327-300,420-300,320-300,427-300,334-300,427-300);
  triangle(272-300,420-300,265-300,427-300,279-300,427-300);

  fill(0,0,0,0);
  stroke(0,0,0);
  strokeWeight(3);
  circle(275-300,340-300,20);
  circle(325-300,340-300,20);

//head

//strokeWeight(2);
//circle(277,336,20);
//circle(323,336,20);

  fill(255);
  strokeWeight(0);
  circle(300-300,300-300,100);
  fill(0);
  stroke(200);
  strokeWeight(5);
  circle(300-300,300-300,40);
  fill(0,0,255);
  strokeWeight(0);
  circle(300-300,300-300,20);
  
 //wings
 

 fill(0,0,0,0);
 stroke(0);
 strokeWeight(1);
 //right wing
 //circle(340-300,270-300,20);
 //triangle(340-300,270-300,360-300,260-300,340-300,220-300);
 circle(360-300,260-300,5);
 circle(340-300,220-300,5);
 line(340-300,270-300,360-300,260-300);
 line(360-300,260-300,340-300,220-300);
 
 //360-300,260-300,340-300,220-300
 triangle(350-300,240-300,350-300,200-300,360-300,250-300);
 //240-300,260-300,260-300,220-300
 triangle(250-300,240-300,250-300,200-300,240-300,250-300);
 
 
 //left wing
 //circle(260-300,270-300,20);
 //triangle(260-300,270-300,240-300,260-300,260-300,220-300);
 circle(240-300,260-300,5);
 circle(260-300,220-300,5);
 line(260-300,270-300,240-300,260-300);
 line(240-300,260-300,260-300,220-300);
 
 //glasses
 circle(270-300,260-300,8);
 line(270-300,260-300,280-300,250-300);
 line(280-300,250-300,290-300,270-300);
 circle(285-300,270-300,15);
 popMatrix();
}
