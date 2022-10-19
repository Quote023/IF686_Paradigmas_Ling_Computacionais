package semana16;

public class Variavel<T> extends Expressao<T> {
  private final String key;

  public Variavel(String key) {
    this.key = key;
  }

  @Override
  public String toString() {
    return key;
  }

  @Override
  public T eval(Contexto context) {
    return context.get(key);
  }

}
