//setup 
size(800,500);
background(0);
stroke(255);
line(500,0,500,500);
stroke(0);
//Übung 1 while-Schleife

fill(255,0,0); //rot

int xWhile = 100; //X-Koordinate des ersten Punktes.
while(xWhile < 500){ //Bedingung die erfüllt sein muss
  ellipse(xWhile,100,50,50); //Zeichne Kreis
  xWhile = xWhile + 100; //setze X-Koordinate um 100 Pixel nach rechts
}


//Übung 1 whileDo-Schleife

fill(255,255,0); //gelb

int xWhileDo = 0; //X-Koordinate des ersten Punktes.
do {
  ellipse(xWhileDo,200,50,50); //Zeichne Kreis
  xWhileDo = xWhileDo + 100; //setze X-Koordinate um 100 Pixel nach rechts
}while(xWhileDo < 500 && xWhileDo > 0);


//Übung 1 for-Schleife

fill(0,0,255); //blau

int xFor = 100;
for(int i = xFor; i < 500; i = i +100){
  ellipse(i,300,50,50);
}
