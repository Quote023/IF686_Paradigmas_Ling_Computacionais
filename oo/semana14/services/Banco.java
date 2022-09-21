package semana14.services;

import semana14.models.*;

public class Banco {
  private Conta[] contas;
  private int ultimoIndice;
  private double taxaDeJuros;

  public Banco(int capacidade, double taxaDeJuros) {
    this.taxaDeJuros = taxaDeJuros;
    this.contas = new Conta[capacidade];
    ultimoIndice = 0;
  }

  public void cadastrarConta(Conta c) {
    contas[ultimoIndice] = c;
    ultimoIndice = ultimoIndice + 1;
  }

  public void creditarConta(String numero, double valor) {
    Conta conta = buscarConta(numero);
    conta.creditar(valor);
  }

  public void transferir(double valor, String remetente, String destinatario) {
    Conta rConta = buscarConta(remetente);
    Conta dConta = buscarConta(destinatario);
    rConta.debitar(valor);
    dConta.creditar(valor);
  }

  public void renderJuros(String numero) {
    Conta conta = buscarConta(numero);
    if (conta instanceof Poupanca) {
      ((Poupanca) conta).renderJuros(taxaDeJuros);
    } else {
      throw new RuntimeException("Não foi possível render juros na conta " + numero + ". Não é uma conta poupança");
    }
  }

  public void renderBonus(String numero) {
    Conta conta = buscarConta(numero);
    if (conta instanceof ContaEspecial) {
      ((ContaEspecial) conta).renderBonus();
    } else {
      throw new RuntimeException("Não foi possível render bonus na conta " + numero + ". Não é uma conta especial");
    }
  }

  public Conta buscarConta(String numero) {
    for (int i = 0; i < ultimoIndice; i++) {
      Conta conta = contas[i];
      if (conta == null)
        break;
      if (conta.getNumero().equals(numero))
        return contas[i];
    }

    throw new RuntimeException("Conta " + numero + " não encontrada.");
  }

  @Override
  public String toString() {
    StringBuilder str = new StringBuilder();
    str.append("Banco:\n");
    str.append("Id\tNumero\n");
    for (int i = 0; i < ultimoIndice; i++) {
      Conta conta = contas[i];
      str.append(i);
      str.append("\t");

      if (conta != null)
        str.append(conta.getNumero());

      str.append("\n");
    }
    return str.toString();
  }
  // ...
}
