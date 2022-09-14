package semana13.models;

public class Conta {
  private String numero;

  public String getNumero() {
    return numero;
  }

  public void setNumero(String numero) {
    this.numero = numero;
  }

  public Conta(String numero, double saldo) {
    this.numero = numero;
  }

  public Conta(String numero) {
    this(numero, 0.0);
  }
}
