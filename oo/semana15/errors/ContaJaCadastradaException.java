package semana15.errors;

public class ContaJaCadastradaException extends Exception {
  private String numero;

  public ContaJaCadastradaException(String numero) {
    super("Conta " + numero + " já cadastrada.");
    this.numero = numero;
  }

  public String getNumero() {
    return numero;
  }

}
