package lista_3.q2;

public abstract class Citizen {
  private String nome;
  private String endereco;
  private int CEP;

  public Citizen(String nome, String endereco, int cep) {
    this.nome = nome;
    this.endereco = endereco;
    CEP = cep;
  }

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public String getEndereco() {
    return endereco;
  }

  public void setEndereco(String endereco) {
    this.endereco = endereco;
  }

  public int getCEP() {
    return CEP;
  }

  public void setCEP(int cEP) {
    CEP = cEP;
  }

  public abstract void greet(Citizen other);
}
