package semana13.models;

public class AlunoComMatricula extends Aluno {

  private int matricula;

  private static int ultimaMatricula = 0;

  public AlunoComMatricula(String nome, String cpf, int idade, Curso curso) {
    super(nome, cpf, idade, curso);
    this.matricula = getProximaMatricula();
  }

  private static int getProximaMatricula() {
    return ++ultimaMatricula;
  }

  public int getMatricula() {
    return matricula;
  }

  @Override
  public String toString() {
    return super.toString()
        + "Matricula: " + this.getMatricula();
  }

}
