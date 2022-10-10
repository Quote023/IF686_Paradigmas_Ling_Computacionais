package semana15.repositories;

import semana15.errors.ContaJaCadastradaException;
import semana15.errors.ContaNaoEncontradaException;
import semana15.models.ContaAbstrata;

public interface IRepositorioContas {

  void inserir(ContaAbstrata conta) throws ContaJaCadastradaException;

  ContaAbstrata procurar(String numero) throws ContaNaoEncontradaException;

  void remover(String numero);

  void atualizar(ContaAbstrata conta) throws ContaNaoEncontradaException;

  boolean existe(String numero);
}
