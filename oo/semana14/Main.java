package semana14;

import semana14.models.*;
import semana14.services.Banco;

public class Main {
  public static void main(String[] args) {
    Banco banco = new Banco(100, 0.01);
    banco.cadastrarConta(new Poupanca("CP1"));
    banco.cadastrarConta(new Conta("NC1"));
    banco.cadastrarConta(new ContaEspecial("CE1"));

    System.out.println(banco);
    banco.creditarConta("NC1", 100);
    banco.creditarConta("CE1", 100);
    banco.creditarConta("CP1", 100);

    banco.renderBonus("CE1");
    banco.renderJuros("CP1");
    System.out.println(banco.buscarConta("NC1"));
    System.out.println(banco.buscarConta("CE1"));
    banco.transferir(100.5, "CE1", "NC1");
    System.out.println(banco.buscarConta("NC1"));
    System.out.println(banco.buscarConta("CE1"));
  }
}
