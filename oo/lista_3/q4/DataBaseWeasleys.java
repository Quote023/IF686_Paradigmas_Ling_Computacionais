package lista_3.q4;

import lista_3.helpers.ArrayHelpers;
import lista_3.helpers.CompLambda2;

public class DataBaseWeasleys implements DataBase<Product> {

  private Product[] produtos = new Product[50];
  private int index = 0;

  @Override
  public void inserir(Product elemento) {
    produtos[index++] = elemento;
  }

  @Override
  public void remover(Product elemento) {
    ArrayHelpers.remove(produtos, get(elemento.getFst()));
  }

  @Override
  public void atualizar(Product elemento) {
    var produto = ArrayHelpers.find(produtos, x -> x.getFst() == elemento.getFst());
    produto.setSnd(elemento.getSnd());
    produto.setTrd(elemento.getTrd());
  }

  @Override
  public Product get(String produto) {
    return ArrayHelpers.find(produtos, x -> x == null ? false : x.getFst() == produto);
  }

  @Override
  public Product[] sortAndTake(CompLambda2<Product, Product> sortBy, int take) {
    return ArrayHelpers.fitIn(ArrayHelpers.sort(produtos, sortBy), new Product[1]);
  }

}
