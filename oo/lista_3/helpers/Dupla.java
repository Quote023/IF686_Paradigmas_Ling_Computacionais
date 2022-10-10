package lista_3.helpers;

public class Dupla<T1, T2> {
  private T1 fst;
  private T2 snd;

  public static <T1, T2> Dupla<T1, T2> com(T1 fst, T2 snd) {
    Dupla<T1, T2> dupla = new Dupla<>();
    dupla.fst = fst;
    dupla.snd = snd;
    return dupla;
  }

  public void setFst(T1 fst) {
    this.fst = fst;
  }

  public void setSnd(T2 snd) {
    this.snd = snd;
  }

  public T1 getFst() {
    return fst;
  }

  public T2 getSnd() {
    return snd;
  }

}
