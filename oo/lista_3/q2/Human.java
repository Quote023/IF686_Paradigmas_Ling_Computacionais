package lista_3.q2;

import lista_3.helpers.ArrayHelpers;

public abstract class Human extends Citizen {
  protected static final int MAX_AMIGOS = 5;
  private Citizen[] amigos = new Citizen[MAX_AMIGOS];

  public Human(String nome, String endereco, int cep) {
    super(nome, endereco, cep);
  }

  public Citizen[] getAmigos() {
    return amigos.clone();
  }

  @Override
  public void greet(Citizen other) {
    System.out.println("Olá " + other.getNome());
    ArrayHelpers.addAtEnd(amigos, other, true);
  }

}
