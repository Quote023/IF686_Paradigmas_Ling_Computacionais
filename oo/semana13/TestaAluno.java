package semana13;

import semana13.models.*;

public class TestaAluno {
  public static void main(String[] args) {
    Curso curso = new Curso("Ciência da Computação", "18");
    Aluno a = new Aluno("Sergio Soares", "239.234.111-98", 32, curso);
    System.out.println(a);
    a.setCpf("NOVO_CPF");
    a.setIdade(20);
    a.setNome("NOVO_NOME");
    curso = new Curso("Engenharia da Computação", "21");
    a.setCurso(curso);
    System.out.println(a);
  }
}