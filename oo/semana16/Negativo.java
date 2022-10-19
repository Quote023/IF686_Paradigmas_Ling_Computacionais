package semana16;

public class Negativo<T extends Number> extends ExpressaoUnaria<T, T> {

  public Negativo(Expressao<T> operando) {
    super(operando);
  }

  @Override
  protected final String getSinal() {
    return "-";
  }

  @Override
  public T eval(Contexto context) {
    var valor = getOperando().eval(context);
    return (T) Double.valueOf(valor.doubleValue() * -1);
  }

}
