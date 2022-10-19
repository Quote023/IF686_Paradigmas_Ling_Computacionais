package semana16;

public abstract class ExpressaoUnaria<T, U> extends Expressao<U> {
  private final Expressao<T> operando;

  public ExpressaoUnaria(Expressao<T> operando) {
    this.operando = operando;
  }

  protected abstract String getSinal();

  protected Expressao<T> getOperando() {
    return operando;
  }

  @Override
  public String toString() {
    return "(" + getSinal() + " " + operando.toString() + ")";
  }
}
