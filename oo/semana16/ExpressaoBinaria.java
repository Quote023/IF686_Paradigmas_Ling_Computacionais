package semana16;

public abstract class ExpressaoBinaria<T, U, V> extends Expressao<V> {
  private final Expressao<T> esquerda;
  private final Expressao<U> direita;

  public ExpressaoBinaria(Expressao<T> esquerda, Expressao<U> direita) {
    this.esquerda = esquerda;
    this.direita = direita;
  }

  protected abstract String getSinal();

  protected Expressao<T> getEsquerda() {
    return esquerda;
  }

  protected Expressao<U> getDireita() {
    return direita;
  }

  @Override
  public String toString() {
    return "(" + esquerda.toString() + " " + getSinal() + " " + direita.toString() + ")";
  }
}
