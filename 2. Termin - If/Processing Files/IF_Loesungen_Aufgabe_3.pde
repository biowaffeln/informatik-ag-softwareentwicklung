int monat = 3;

if (monat >= 3 && monat <=5 ){
  println("Es ist Frühling");
} else if (monat >=6 && monat <=8){
  println("Es ist Sommer");
} else if (monat >= 9 && monat <= 11){
  println("Es ist Herbst");
} else if (monat == 12 || monat >= 1 && monat <= 2){
  println("Es ist Winter");
} else {
  println("Dieser Monat existiert nicht. Monate gehen von 1-12");
}
