package lista_3.q3;

public class Quadrado extends Paralelogramo {

  public Quadrado(double lado) {
    super(lado, lado);
  }

  @Override
  public void setAltura(double altura) {
    setLado(altura);
  }

  @Override
  public void setBase(double altura) {
    setLado(altura);
  }

  public double getLado() {
    return getBase();
  }

  public void setLado(double lado) {
    super.setAltura(lado);
    super.setBase(lado);
  }

}
