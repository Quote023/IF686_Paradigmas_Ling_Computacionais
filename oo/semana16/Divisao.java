package semana16;

public class Divisao<T extends Number> extends ExpressaoBinaria<T, T, T> {

  protected String getSinal() {
    return "/";
  }

  public Divisao(Expressao<T> exp1, Expressao<T> exp2) {
    super(exp1, exp2);
  }

  @Override
  public T eval(Contexto context) {
    T v1 = getEsquerda().eval(context);
    T v2 = getDireita().eval(context);

    if (v1 instanceof Integer || v1 instanceof Long)
      return (T) Long.valueOf(v1.longValue() * v2.longValue());

    return (T) Double.valueOf(v1.doubleValue() * v2.doubleValue());
  }

}