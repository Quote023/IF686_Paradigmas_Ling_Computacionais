package lista_3.q4;

import lista_3.helpers.ArrayHelpers;

public class Main {
  public static void main(String[] args) {
    var db = new DataBaseWeasleys();
    db.inserir(new Product("Varinha A", 10, 5000.0f));
    db.inserir(new Product("Varinha B", 10, 5000.0f));
    db.inserir(new Product("Varinha C", 10, 5000.0f));
    db.inserir(new Product("Varinha Mixuruca", 10, 50.0f));
    db.inserir(new Product("Varinha Cara", 10, 50000.0f));
    var store = new Store(db);
    System.out.println(ArrayHelpers.fitIn(new Integer[] { 1, 2, 3 }, new Integer[1])[0]);
    var merlin = new Client(99900.0f, "Merlin", "v");
    var howl = new Client(90.0f, "Howl", "Calcifer");

    try {
      store.comprar(howl, "Varinha A");
    } catch (SaldoInsuficienteException e) {
      System.out.println(e.getMessage());
    }
    try {
      store.comprar(merlin, "Varinha Cara");

    } catch (SaldoInsuficienteException e) {
      // ignore
    }
    db.remover(new Product("Varinha Mixuruca", 0, 0f));
    System.out.println(db.get("Varinha Mixuruca"));
  }
}
