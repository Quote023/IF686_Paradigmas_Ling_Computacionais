package semana16;

public class Soma<T extends Number> extends ExpressaoBinaria<T, T, T> {

  @Override
  protected final String getSinal() {
    return "+";
  }

  public Soma(Expressao<T> exp1, Expressao<T> exp2) {
    super(exp1, exp2);
  }

  @Override
  public T eval(Contexto context) {
    T v1 = getEsquerda().eval(context);
    T v2 = getDireita().eval(context);
    return (T) Double.valueOf(v1.doubleValue() + v2.doubleValue());
  }

}
