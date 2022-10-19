package lista_3.q3;

public class Trapezio implements IFigura {
  private double baseMaior, baseMenor, ladoA, ladoB;

  public Trapezio(double baseMaior, double baseMenor, double ladoA, double ladoB) {
    this.baseMaior = baseMaior;
    this.baseMenor = baseMenor;
    this.ladoA = ladoA;
    this.ladoB = ladoB;
  }

  public double getLadoB() {
    return ladoB;
  }

  public void setLadoB(double ladoB) {
    this.ladoB = ladoB;
  }

  public double getBaseMenor() {
    return baseMenor;
  }

  public double getLadoA() {
    return ladoA;
  }

  public void setLadoA(double ladoA) {
    this.ladoA = ladoA;
  }

  public void setBaseMenor(double baseMenor) {
    this.baseMenor = baseMenor;
  }

  public double getBaseMaior() {
    return baseMaior;
  }

  public void setBaseMaior(double baseMaior) {
    this.baseMaior = baseMaior;
  }

  public double getAltura() {
    double a2 = Math.pow(ladoA, 2);
    double b2 = Math.pow(ladoB, 2);
    return Math.sqrt((a2 + b2 + (baseMaior - baseMenor)) / 2);
  }

  @Override
  public double calculateArea() {
    return ((baseMaior + baseMenor) / 2) * getAltura();
  }

  @Override
  public double calculatePerimeter() {
    return baseMaior + baseMenor + ladoA + ladoB;
  }

  @Override
  public String displayCalc() {
    return ("Area: ((" + getBaseMaior() + " + " + getBaseMenor() + ")/2)" + " * " + getAltura() + " = "
        + calculateArea() + "\n"
        + "Perimetro: " + getBaseMaior() + " + " + getBaseMenor() + " + " + getLadoA() + " + " + getLadoB() + " = "
        + calculatePerimeter() + "");
  }

}
