package semana14.models;

public class Conta {
  private String numero;
  private double saldo;

  public Conta(String numero) {
    this(numero, 0.0);
  }

  public Conta(String numero, double saldo) {
    this.numero = numero;
    this.saldo = saldo;
  }

  public double getSaldo() {
    return saldo;
  }

  public void creditar(double valor) {
    this.saldo += valor;
  }

  public void debitar(double valor) {
    this.saldo -= valor;
  }

  public String getNumero() {
    return numero;
  }

  public void setNumero(String numero) {
    this.numero = numero;
  }

  @Override
  public String toString() {
    return "Dados da Conta: " + this.getNumero() + "\n"
        + "Saldo: " + this.getSaldo() + "\n";
  }

}
