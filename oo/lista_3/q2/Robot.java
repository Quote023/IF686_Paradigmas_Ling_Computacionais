package lista_3.q2;

public class Robot extends Citizen {

  public Robot(String nome, String endereco, int cep) {
    super(nome, endereco, cep);
  }

  @Override
  public void greet(Citizen other) {
    if (other.getCEP() != this.getCEP())
      return;

    System.out.println("Saudações vizinho, " + this.getNome());
  }

}
