package lista_3.q1;

public class Main {
  public static void main(String[] args) {
    Team t1 = new Team();
    Team t2 = new Team(
        new Robot[] {
            new Robot("Marvin"),
            new Robot("Bender"),
            new Robot("Bumblebee"),
            new Robot("XJ9"),
            new Robot("Rodney Lataria"),
            new Robot("R2-D2")
        },
        new Robot[] {
            new Robot("C-3P0"),
            new Robot("BB-8"),
            new Robot("Rosey"),
            new Robot("Wall-E"),
            new Robot("BayMax"),
            new Robot("Astro Boy")
        });
    t1.inserirTitular(new Robot("Megatron"));
    t1.inserirTitular(new Robot("Ultron"));
    t1.inserirReserva(new Robot("Gigante de Ferro"));
    t1.inserirReserva(new Robot("Grande Soldador"));

    t1.substituir(t1.getReserva("Gigante de Ferro"), t1.getTitular("Ultron"));
    t2.substituir(t2.getReserva("Astro Boy"));

    System.out.println("Titulares T1:");
    for (Robot r : t1.getTitulares())
      System.out.println(r == null ? "--" : r.getNome());

    System.out.println();
    System.out.println("Reservas T2:");
    for (Robot r : t2.getReservas())
      System.out.println(r == null ? "--" : r.getNome());

  }
}