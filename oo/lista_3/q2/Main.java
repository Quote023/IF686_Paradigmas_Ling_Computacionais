package lista_3.q2;

public class Main {
  public static void main(String[] args) {
    Robot r1 = new Robot("C-3PO", "SWRoad", 12);
    Robot r2 = new Robot("R2-D2", "SWRoad", 12);
    Adult a1 = new Adult("Darth Vaders", "Tatooine", 25, "Sith");
    Child c1 = new Child("Luke Skywalker", "Tatooine", 25, "Sabre de Luz");

    r1.greet(r2);
    r1.greet(a1);
    a1.addKid(c1);
    c1.greet(r2);
    c1.setBrinquedo("X-Wing");
    System.out.println("Amigos de " + c1.getNome());
    for (Citizen amg : c1.getAmigos()) {
      System.out.println(amg == null ? "--" : amg.getNome());
    }
    c1.greet(r2);
  }
}
