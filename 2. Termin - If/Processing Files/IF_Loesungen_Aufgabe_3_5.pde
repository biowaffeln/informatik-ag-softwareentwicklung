int monat = 13;

if (monat >= 3 && monat <=5 ){
  fill(3,237,11);
  text("Es ist Frühling",10,50);
} else if (monat >=6 && monat <=8){
  fill(229,237,3);
  text("Es ist Sommer",10,50);
} else if (monat >= 9 && monat <= 11){
  fill(171,86,21);
  text("Es ist Herbst",10,50);
} else if (monat == 12 || monat >= 1 && monat <= 2){
  fill(255,255,255);
  text("Es ist Winter",10,50);
} else {
  fill(0,0,0);
  text("Dieser Monat existiert nicht.",10,10,70,80);
}
