package semana15.models;

public abstract class ContaAbstrata {
  private String numero;
  private double saldo;

  public ContaAbstrata(String numeroInicial, double saldoInicial) {
    numero = numeroInicial;
    saldo = saldoInicial;
  }

  public ContaAbstrata(String numeroInicial) {
    this(numeroInicial, 0);
  }

  public void creditar(double valor) {
    saldo += valor;
  }

  public abstract void debitar(double valor); // { }

  public double getSaldo() {
    return saldo;
  }

  public String getNumero() {
    return numero;
  }

  protected void setSaldo(double saldo) {
    this.saldo = saldo;
  }

}
