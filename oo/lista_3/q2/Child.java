package lista_3.q2;

public class Child extends Human {
  private String brinquedo;

  public Child(String nome, String endereco, int cep, String brinquedo) {
    super(nome, endereco, cep);
    this.brinquedo = brinquedo;
  }

  public String getBrinquedo() {
    return brinquedo;
  }

  public void setBrinquedo(String brinquedo) {
    this.brinquedo = brinquedo;
  }

  @Override
  public void greet(Citizen other) {
    super.greet(other);
    System.out.println("Quer brincar com meu " + brinquedo + "?");
  }
}