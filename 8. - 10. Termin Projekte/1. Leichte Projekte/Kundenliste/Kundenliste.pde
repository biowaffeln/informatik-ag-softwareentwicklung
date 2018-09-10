//Kundenliste durch suchen, wenn Kunde in Liste dann Programm gibt "grün" für Tür auf, wenn Kunde nicht in Liste "rot" für Tür zu
size(200,200);
String kunde = "Lahm";
boolean kunde_gefunden = false;
String[] kunden = new String[5];
kunden[0] = "Müller";
kunden[1] = "Özil";
kunden[2] = "Lahm";
kunden[3] = "Podolski";
kunden[4] = "Kroos";

for (int i=0; i < kunden.length; i++){
  if (kunde == kunden[i]){
    background(0,238,0);
    kunde_gefunden=true;
  }
}

if (kunde_gefunden == false){
  background(255,0,0);
}
