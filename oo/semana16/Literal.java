package semana16;

public class Literal<T> extends Expressao<T> {
  private final T valor;

  public Literal(T valor) {
    this.valor = valor;
  }

  @Override
  public String toString() {
    return valor.toString();
  }

  @Override
  public T eval(Contexto _ctx) {
    return valor;
  }
}
