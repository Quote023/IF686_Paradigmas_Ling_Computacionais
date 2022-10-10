package semana15.repositories;

import semana15.errors.ContaJaCadastradaException;
import semana15.errors.ContaNaoEncontradaException;
import semana15.models.ContaAbstrata;

public class RepositorioContasArray implements IRepositorioContas {
  private ContaAbstrata[] contas;
  private int indice;

  public RepositorioContasArray() {
    this.contas = new ContaAbstrata[10];
    indice = 0;
  }

  @Override
  public void inserir(ContaAbstrata conta) throws ContaJaCadastradaException {
    String numero = conta.getNumero();
    if (existe(numero))
      throw new ContaJaCadastradaException(numero);

    contas[indice] = conta;
    indice = indice + 1;
  }

  @Override
  public ContaAbstrata procurar(String numero) throws ContaNaoEncontradaException {
    for (ContaAbstrata conta : contas)
      if (conta.getNumero().equals(numero))
        return conta;

    throw new ContaNaoEncontradaException();
  }

  @Override
  public void remover(String numero) {
    // TODO Auto-generated method stub

  }

  @Override
  public void atualizar(ContaAbstrata conta) throws ContaNaoEncontradaException {
    var c = procurar(conta.getNumero());

  }

  @Override
  public boolean existe(String numero) {
    try {
      procurar(numero);
      return true;
    } catch (ContaNaoEncontradaException e) {
      return false;
    }
  }

}
