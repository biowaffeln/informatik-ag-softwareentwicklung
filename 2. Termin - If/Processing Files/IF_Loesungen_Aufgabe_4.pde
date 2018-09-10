int distanz = 2600;
String geschlecht = "männlich";

if(geschlecht == "männlich"){
  if(distanz >= 3000){
    println("Bewertung: Ausgezeichnet");
  } else if (distanz >= 2800){
    println("Bewertung: Sehr Gut");
  }  else if (distanz >= 2400){
    println("Bewertung: Gut");
  }  else if (distanz >= 2000){
    println("Bewertung: Befriedigend");
  }  else if (distanz >= 1700){
    println("Bewertung: Ausreichend");
  }  else if (distanz >= 1400){
    println("Bewertung: Mangelhaft");
  }
} else if(geschlecht == "weiblich"){
  if(distanz >= 2800){
    println("Bewertung: Ausgezeichnet");
  } else if (distanz >= 2600){
    println("Bewertung: Sehr Gut");
  }  else if (distanz >= 2200){
    println("Bewertung: Gut");
  }  else if (distanz >= 1800){
    println("Bewertung: Befriedigend");
  }  else if (distanz >= 1400){
    println("Bewertung: Ausreichend");
  }  else if (distanz >= 1200){
    println("Bewertung: Mangelhaft");
  }
}
