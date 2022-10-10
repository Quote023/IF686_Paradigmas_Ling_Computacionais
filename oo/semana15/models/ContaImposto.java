package semana15.models;

public class ContaImposto extends ContaAbstrata {
  // private String numero;
  // private double saldo;
  private static final double CPMF = 0.001;

  public ContaImposto(String numeroInicial, double saldoInicial) {
    super(numeroInicial, saldoInicial);
  }

  public ContaImposto(String numeroInicial) {
    this(numeroInicial, 0);
  }

  // public void creditar(double valor) {
  // saldo += valor; }

  public void debitar(double valor) {
    double imposto = valor * CPMF;
    super.setSaldo(getSaldo() - valor - imposto);
  }

  // public double getSaldo() {
  // return saldo; }

  // public String getNumero() {
  // return numero; }
}
