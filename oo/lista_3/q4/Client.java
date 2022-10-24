package lista_3.q4;

public class Client extends Wizard {
  public Client(float saldo, String nome, String varinha) {
    super(nome, varinha);
    this.saldo = saldo;
  }

  private float saldo;
  private int score = 0;

  public int getScore() {
    return score;
  }

  public void addScore(int score) {
    this.score = score;
  }

  public float getSaldo() {
    return saldo;
  }

  public void creditar(float saldo) {
    this.saldo += saldo;
  }
}
