package semana15.errors;

public class ContaNaoEncontradaException extends Exception {

  public ContaNaoEncontradaException() {
    super("Conta não encontrada.");
  }
}
