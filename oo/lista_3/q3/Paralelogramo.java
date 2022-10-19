package lista_3.q3;

public class Paralelogramo implements IFigura {
  private double base, altura;

  public Paralelogramo(double base, double altura) {
    this.base = base;
    this.altura = altura;
  }

  public double getAltura() {
    return altura;
  }

  public double getBase() {
    return base;
  }

  public void setBase(double base) {
    this.base = base;
  }

  public void setAltura(double altura) {
    this.altura = altura;
  }

  @Override
  public double calculateArea() {
    return base * altura;
  }

  @Override
  public double calculatePerimeter() {
    return 2 * (base + altura);
  }

  @Override
  public String displayCalc() {
    return ("Area: " + getBase() + " * " + getAltura() + " = " + calculateArea() + "\n"
        + "Perimetro: 2 * (" + getBase() + " + " + getAltura() + ")" + " = " + calculatePerimeter());
  }

}
