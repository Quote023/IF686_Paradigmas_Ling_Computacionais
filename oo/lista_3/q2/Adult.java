
package lista_3.q2;

import lista_3.helpers.ArrayHelpers;

public class Adult extends Human {
  protected static final int MAX_KIDS = 4;
  private String profissao;
  private Child[] filhos = new Child[MAX_KIDS];

  public Adult(String nome, String endereco, int cep, String profissao) {
    super(nome, endereco, cep);
    this.profissao = profissao;

  }

  public String getProfissao() {
    return profissao;
  }

  public void setProfissao(String profissao) {
    this.profissao = profissao;
  }

  public void addKid(Child kid) {
    ArrayHelpers.addAtEnd(filhos, kid);
  }

}