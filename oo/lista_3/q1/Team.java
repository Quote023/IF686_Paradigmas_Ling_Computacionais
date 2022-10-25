package lista_3.q1;

import lista_3.helpers.ArrayHelpers;

public class Team {
  protected static final int MAX_JOGADORES = 6;
  private Robot[] timeTitular;
  private Robot[] timeReserva;
  private int indexTitular, indexReserva;

  public Team() {
    this(new Robot[MAX_JOGADORES], new Robot[MAX_JOGADORES]);
  }

  public Team(Robot[] timeTitular, Robot[] timeReserva) {
    // Mantem os times sempre com o mesmo tamanho.
    this.timeTitular = ArrayHelpers.resize(timeTitular, new Robot[MAX_JOGADORES]);
    this.timeReserva = ArrayHelpers.resize(timeReserva, new Robot[MAX_JOGADORES]);
  }

  public void inserirTitular(Robot robot) {
    this.timeTitular[indexTitular++] = robot;
  }

  public void inserirReserva(Robot robot) {
    this.timeReserva[indexReserva++] = robot;
  }

  public void substituir(Robot reserva, Robot titular) {
    int indexT = ArrayHelpers.indexOf(timeTitular, titular);
    int indexR = ArrayHelpers.indexOf(timeReserva, reserva);

    reserva.setPosicao(titular.getX(), titular.getY());
    titular.setPosicao(-1, -1);
    timeTitular[indexT] = reserva;
    timeReserva[indexR] = titular;
  }

  public void substituir(Robot reserva) {
    substituir(reserva, timeTitular[0]);
  }

  public Robot getTitular(String nome) {
    return ArrayHelpers.find(timeTitular, (x) -> x.getNome() == nome);
  }

  public Robot getReserva(String nome) {
    return ArrayHelpers.find(timeReserva, (x) -> x.getNome() == nome);
  }

  public Robot[] getReservas() {
    return timeReserva.clone();
  }

  public Robot[] getTitulares() {
    return timeTitular.clone();
  }

}
