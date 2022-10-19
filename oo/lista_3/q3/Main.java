package lista_3.q3;

public class Main {
  public static void main(String[] args) {
    IFigura[] figuras = new IFigura[] {
        new Circulo(4),
        new Paralelogramo(20, 30),
        new Quadrado(10),
        new Trapezio(20, 10, 15, 15)
    };

    for (IFigura fig : figuras) {
      System.out.println(fig.getClass().getSimpleName() + ":");
      System.out.println(fig.displayCalc());
      System.out.println();
    }
  }
}
