int wurf = 0;
int versuch = 0;

while ( wurf != 6 ) {
  wurf = (int) (Math.random() * 6 +1);
  println(wurf);
  versuch = versuch + 1; 
}

println("Beim " + versuch + ". Wurf hast du die erste 6 gewürfelt!");
