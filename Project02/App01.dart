import 'dart:io';

import 'usuario.dart';

bool control = true;
var usuarios = new List();
var nome_usuario;
var credito;
main(){ //Menu inicial
  while(control == true){
    print("App RFood" );
    print("Entrar    (1)");
    print("Cadastrar (2)");
    print("Sair (3)");
    var digito = stdin.readLineSync();
    
    if(int.parse(digito) == 1){
      Entrar();
    }
    else if(int.parse(digito) == 2){
      Cadastrar();
    }
    else{
      control = false;
    }

  }
}

void Entrar(){ // Menu para Logar
  print("\n---TELA LOGIN---");
  print("Digite seu Login:");
  var dig_Login = stdin.readLineSync();
  print("Digite sua Senha:");
  var dig_Senha = stdin.readLineSync();

  for(int percorrer = 0; percorrer <= usuarios.length; percorrer++){
    if(usuarios[percorrer] == dig_Login){
      if(usuarios[percorrer+1] == dig_Senha){
        nome_usuario = usuarios[percorrer+2];
        credito = usuarios[percorrer+3]; 
        break;
      }
      else{
        print("Senha incorreta");
        break;
      }
    }
    else if(percorrer == usuarios.length - 1){
      print("Usuário não encontrado.");
      break;
    }
  }
  Tela_Usuario(nome_usuario, double.parse(credito));

}

void Cadastrar(){ // Menu de Cadastro
  Usuario usuario =Usuario();
  print("\n---TELA CADASTRO---\n");

  print("Digite um Login:");
  usuario.login= stdin.readLineSync();
  usuarios.add(usuario.login);

  print("Digite uma Senha:");
  usuario.senha= stdin.readLineSync();
  usuarios.add(usuario.senha);

  print("Digite um nome para usuário:");
  usuario.nome= stdin.readLineSync();
  usuarios.add(usuario.nome);
  usuarios.add("500");

  print("Cadastrado com sucesso.\n");
  //Sequencia: Login,Senha,Usuario,Credito.
}

void Tela_Usuario(var nome, double credito){
  bool controle_usuario = true;

  while(controle_usuario == true){
    print("\n---TELA DE USUÁRIO---");
    print("nome    : " + nome);
    print("\nSolicitar Pedido     (1)");
    print("Informações Pessoais (2)");
    print("Voltar para o Menu   (3)");
    var digito_usuario = stdin.readLineSync();

    if(int.parse(digito_usuario) == 1){
      credito = Compra(credito);
      Atualizar_Usuario(nome,credito);
    }
    else if(int.parse(digito_usuario) == 2){
      for(int percorrer = 0; percorrer <= usuarios.length; percorrer++){
        if(usuarios[percorrer] == nome){
          print("\nNome: " + nome);
          print("Crédito: " + usuarios[percorrer+1]);
        }
        else if(percorrer == usuarios.length - 1){break;}
      }
    }
    else if(int.parse(digito_usuario) == 3){
      controle_usuario = false;
    }

  }

}

double Compra(double credito){
  var confirm;
  
  print("\n---ESCOLHA O PEDIDO---");
  print("(1) Comida A = 40.00 ");
  print("(2) Comida B = 150.00 ");
  print("(3) Comida C = 300.00 ");
  var digito_escolha = stdin.readLineSync();

  switch(int.parse(digito_escolha)){
    case 1:{
      print("\nComida A custa: 20.00");
      print("Confirmar a compra? (S)");
      confirm = stdin.readLineSync();

      if(confirm.toString().toUpperCase() == "S"){
        if(credito < 20.00){
        print("Crédito insuficiente");
        }
        else{
          print("Compra Realizada");
          credito= credito - 40.00;
        }
      }
      break;
    }
    case 2:{
      print("\nComida B custa: 150.00");
      print("Confirmar a compra? (S)");
      confirm = stdin.readLineSync();

      if(confirm.toString().toUpperCase() == "S"){
        if(credito < 150.00){
        print("Crédito insuficiente");
        }
        else{
          print("Compra Realizada");
          credito= credito - 150.00;
        }
      }
      break;
    }
    case 3:{
      print("\nComida B custa: 300.00");
      print("Confirmar a compra? (S)");
      confirm = stdin.readLineSync();

      if(confirm.toString().toUpperCase() == "S"){
        if(credito < 300.00){
        print("Crédito insuficiente");
        }
        else{
          print("Compra Realizada");
          credito= credito - 300.00;
        }
      }
      break;
    }

    default:{
      print("Nenhum pedido escolhido");
      break;
    }
  }

  return credito;
}

void Atualizar_Usuario(var nome,var credito){
  //nome = O nome de Usuário.
  for(int percorrer = 0; percorrer <= usuarios.length; percorrer++){
    if(usuarios[percorrer] == nome){
      usuarios[percorrer+1] = credito.toString();
    }
    else if(percorrer == usuarios.length - 1){
      break;
    }
  }
}
