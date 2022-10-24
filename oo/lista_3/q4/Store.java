package lista_3.q4;

public class Store {
  private final int BRINDE_TARGET = 500;
  private DataBase<Product> bancoDeProdutos;

  public Store(DataBase<Product> bancoDeProdutos) {
    this.bancoDeProdutos = bancoDeProdutos;
  }

  public void comprar(Client cliente, String produto) throws SaldoInsuficienteException {
    var prod = bancoDeProdutos.get(produto);

    if ((cliente.getSaldo() - prod.getTrd()) < 0)
      throw new SaldoInsuficienteException();

    cliente.creditar(-prod.getTrd());
    cliente.addScore((int) Math.round(prod.getTrd() * 0.10));
    prod.setSnd(prod.getSnd() - 1);
    bancoDeProdutos.atualizar(prod);
    System.out.println("Compra Realizada com Sucesso");

    if (hasBrinde(cliente))
      darBrinde(cliente);
  }

  private void darBrinde(Client cliente) {
    cliente.addScore(-BRINDE_TARGET);
    Product produtoMaisBarato = bancoDeProdutos.sortAndTake((x, y) -> x.getTrd() < y.getTrd(), 1)[0];
    produtoMaisBarato.setSnd(produtoMaisBarato.getSnd() - 1);
    bancoDeProdutos.atualizar(produtoMaisBarato);
    System.out.println("Brinde " + produtoMaisBarato.getFst());
  }

  private boolean hasBrinde(Client cliente) {
    return cliente.getScore() >= BRINDE_TARGET;
  }

}
