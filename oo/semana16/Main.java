package semana16;

public class Main {
  public static void main(String[] args) {
    var a = new Literal<>(12);
    var b = new Literal<>(10);
    var ab = new Multiplicacao<>(a, b);
    var abplus2 = new Soma<>(ab, new Negativo<>(new Variavel<>("x")));

    var contexto = new Contexto();
    contexto.add("x", 30);
    System.out.println(abplus2);
    System.out.println(abplus2.eval(contexto));
  }
}
