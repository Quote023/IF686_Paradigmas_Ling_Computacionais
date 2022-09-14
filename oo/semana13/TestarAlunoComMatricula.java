package semana13;

import semana13.models.AlunoComMatricula;
import semana13.models.Curso;

public class TestarAlunoComMatricula {

  public static void main(String[] args) {
    Curso curso = new Curso("EC", "42");
    for (int i = 0; i < 30; i++) {
      System.out.println("-------------------------------->");
      System.out.println(new AlunoComMatricula("João " + i, "000.000.000-00", 18, curso));
    }
  }
}
