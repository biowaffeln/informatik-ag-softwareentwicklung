int wurf;
int versuch = 0;
int anzahlSechsen = 0;

do {
  wurf = (int) (Math.random() * 6 +1);
  println(wurf);
  versuch = versuch + 1; 
  
  if(wurf == 6) {
    anzahlSechsen = anzahlSechsen + 1;
  }else{
    anzahlSechsen = 0;
  }
  
} while ( anzahlSechsen != 2 );

println("Nach dem " + versuch + ". Wurf hast du zwei Sechsen hinteinander geworfen!");
