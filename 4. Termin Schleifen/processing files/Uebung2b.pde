int wurf;
int versuch = 0;

do {
  wurf = (int) (Math.random() * 6 +1);
  println(wurf);
  versuch = versuch + 1; 

} while ( wurf != 6 );

println("Beim " + versuch + ". Wurf hast du die erste 6 gewürfelt!");
