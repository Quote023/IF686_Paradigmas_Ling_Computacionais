package lista_3.q4;

import lista_3.helpers.CompLambda2;

public interface DataBase<T> {
  public void inserir(T elemento);

  public void remover(T elemento);

  public void atualizar(T elemento);

  public T get(String primaryKey);

  public T[] sortAndTake(CompLambda2<T, T> sortBy, int take);
}
