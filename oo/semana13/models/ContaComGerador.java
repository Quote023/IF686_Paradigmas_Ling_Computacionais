package semana13.models;

public class ContaComGerador extends Conta {

  private static int proximo = 0;

  public ContaComGerador() {
    super(getProximo() + "");
  }

  public static int getProximo() {
    proximo += 1;
    return proximo;
  }
}
