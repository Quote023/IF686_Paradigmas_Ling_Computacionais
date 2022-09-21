package semana14.models;

public class Poupanca extends Conta {

  public Poupanca(String numero) {
    super(numero);
  }

  public void renderJuros(double taxaDeJuros) {
    double juros = getSaldo() * taxaDeJuros;
    creditar(juros);
  }

}
