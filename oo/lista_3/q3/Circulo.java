package lista_3.q3;

public class Circulo implements IFigura {
  private double raio;
  private final double PI = Math.PI;

  public Circulo(double raio) {
    this.raio = raio;
  }

  public double getRaio() {
    return raio;
  }

  public void setRaio(double raio) {
    this.raio = raio;
  }

  @Override
  public double calculateArea() {
    return PI * Math.pow(raio, 2);
  }

  @Override
  public double calculatePerimeter() {
    return 2 * PI * raio;
  }

  @Override
  public String displayCalc() {
    return ("Area: " + PI + " * " + raio + "^2 = " + calculateArea() + "\n"
        + "Perimetro: 2 * " + PI + " * " + raio + " = " + calculatePerimeter());
  }

}
