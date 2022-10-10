package semana15.services;

import semana15.errors.ContaJaCadastradaException;
import semana15.errors.ContaNaoEncontradaException;
import semana15.models.ContaAbstrata;
import semana15.models.ContaEspecial;
import semana15.models.Poupanca;
import semana15.repositories.IRepositorioContas;

public class Banco {
  private IRepositorioContas contas;

  public Banco(IRepositorioContas contas) {
    this.contas = contas;
  }

  public void cadastrarConta(ContaAbstrata c) throws ContaJaCadastradaException {
    contas.inserir(c);
  }

  public ContaAbstrata procurarConta(String numero) throws ContaNaoEncontradaException {
    return contas.procurar(numero);
  }

  public void debitarConta(String numero, double valor) throws ContaNaoEncontradaException {
    ContaAbstrata c;
    c = this.procurarConta(numero);
    c.debitar(valor);
  }

  public void creditarConta(String numero, double valor) throws ContaNaoEncontradaException {
    ContaAbstrata c;
    c = this.procurarConta(numero);
    c.creditar(valor);
  }

  public void transferir(String conta1, String conta2, double valor) throws ContaNaoEncontradaException {
    ContaAbstrata c1, c2;
    c1 = this.procurarConta(conta1);
    c2 = this.procurarConta(conta2);
    c1.debitar(valor);
    c2.creditar(valor);
  }

  public void renderJuros(String numero) throws ContaNaoEncontradaException {
    ContaAbstrata c;
    c = this.procurarConta(numero);
    if (c instanceof Poupanca) {
      ((Poupanca) c).renderJuros(0.01);
    }
  }

  public void renderBonus(String numero) throws ContaNaoEncontradaException {
    ContaAbstrata c;
    c = this.procurarConta(numero);
    if (c instanceof ContaEspecial) {
      ((ContaEspecial) c).renderBonus();
    }
  }
}
