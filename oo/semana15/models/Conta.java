package semana15.models;

public class Conta extends ContaAbstrata {
  // private String numero;
  // private double saldo;

  public Conta(String numeroInicial, double saldoInicial) {
    super(numeroInicial, saldoInicial);
  }

  public Conta(String numeroInicial) {
    this(numeroInicial, 0);
  }

  // public void creditar(double valor) {
  // saldo += valor; }

  public void debitar(double valor) {
    super.setSaldo(getSaldo() - valor);
  }

  // public double getSaldo() {
  // return saldo; }

  // public String getNumero() {
  // return numero; }
}
