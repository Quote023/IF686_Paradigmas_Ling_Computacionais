package semana15;

import semana15.services.Banco;
import semana15.errors.ContaJaCadastradaException;
import semana15.errors.ContaNaoEncontradaException;
import semana15.models.Conta;
import semana15.models.ContaEspecial;
import semana15.models.ContaImposto;
import semana15.models.Poupanca;
import semana15.repositories.RepositorioContasArray;

public class TestaBanco {
  public static void main(String[] args) {

    Banco banco;
    banco = new Banco(new RepositorioContasArray());

    Conta conta;
    conta = new ContaEspecial("21.342-7");
    try {
      banco.cadastrarConta(conta);
      banco.cadastrarConta(new Poupanca("32.234-4"));
      banco.cadastrarConta(new Conta("47.465-2"));
      banco.cadastrarConta(new ContaImposto("37.465-3"));
    } catch (ContaJaCadastradaException e1) {
      e1.printStackTrace();
    }

    try {
      banco.creditarConta("21.342-7", 200.00);
      banco.creditarConta("32.234-4", 200.00);
      banco.creditarConta("47.465-2", 200.00);
      banco.creditarConta("37.465-3", 200.00);
      banco.debitarConta("21.342-7", 100.00);
      banco.debitarConta("32.234-4", 100.00);
      banco.debitarConta("47.465-2", 100.00);
      banco.debitarConta("37.465-3", 100.00);
      banco.renderJuros("21.342-7");
      banco.renderJuros("32.234-4");
      banco.renderJuros("47.465-2");
      banco.renderBonus("21.342-7");
      banco.renderBonus("32.234-4");
      banco.renderBonus("47.465-2");
      banco.transferir("32.234-4", "47.465-2", 50);
    } catch (ContaNaoEncontradaException e) {
      e.printStackTrace();
    }
    System.out.print("saldo da conta 21.342-7 = ");
    System.out.println(conta.getSaldo());
    System.out.print("saldo da conta 21.342-7 = ");
    try {
      System.out.println(banco.procurarConta("21.342-7").getSaldo());
      System.out.print("saldo da conta 32.234-4 = ");
      System.out.println(banco.procurarConta("32.234-4").getSaldo());
      System.out.print("saldo da conta 47.465-2 = ");
      System.out.println(banco.procurarConta("47.465-2").getSaldo());
      System.out.print("saldo da conta 37.465-3 = ");
      System.out.println(banco.procurarConta("37.465-3").getSaldo());
    } catch (ContaNaoEncontradaException e) {
      e.printStackTrace();
    }
  }
}
