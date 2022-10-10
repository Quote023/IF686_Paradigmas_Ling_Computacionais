package lista_3.q1;

import lista_3.helpers.Dupla;

public class Robot {
  private String nome;
  private int camisa;
  private Dupla<Integer, Integer> posicao;

  public Robot(String nome) {
    this.nome = nome;
    this.camisa = -1;
    this.posicao = Dupla.com(-1, -1);
  }

  public int getX() {
    return posicao.getFst();
  }

  public int getY() {
    return posicao.getSnd();
  }

  public void setPosicao(int x, int y) {
    this.posicao.setFst(x);
    this.posicao.setSnd(y);
  }

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public int getCamisa() {
    return camisa;
  }

  public void setCamisa(int camisa) {
    this.camisa = camisa;
  }

}
