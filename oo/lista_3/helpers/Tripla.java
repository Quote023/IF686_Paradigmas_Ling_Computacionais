package lista_3.helpers;

public class Tripla<T1, T2, T3> extends Dupla<T1, T2> {
  private T3 trd;

  public Tripla(T1 fst, T2 snd, T3 trd) {
    super(fst, snd);
    this.trd = trd;
  }

  public T3 getTrd() {
    return trd;
  }

  public void setTrd(T3 trd) {
    this.trd = trd;
  }
}
