//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financeiro_crud/app/injection.dart';
//import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'app/my_app.dart';


void main() async {
  setupInjection();
  runApp(MyApp());
  /*
  await Firebase.initializeApp();
  FirebaseFirestore.instance.collection('despesa').doc().set({
    'nome': 'Mercado',
    'tipo': 'Alimentação',
    'valor': '119'
  });

  var collection = FirebaseFirestore.instance.collection('despesa');
  collection.doc().set({
    'nome': 'IFood',
    'tipo': 'Alimentação',
    'valor': '45'

  }).then((value) => print('deu certo!')).catchError((error) => print('deu errado! $error'));

  collection.doc('contato3').set({ //contato3 é um ID, se ele já existir, substitui
    'nome': 'Padaria',
    'tipo': 'Alimentação',
    'valor': '10'

  }).then((value) => print('deu certo!')).catchError((error) => print('deu errado! $error'));

  collection.doc('contato3').set({ //contato3 é um ID, se ele já existir, substitui
    'nome': 'Padaria22',
    'valor': '100'

  },SetOptions(merge:true) //só altera os itens que foram modificados, mantém o anterior
  ).then((value) => print('deu certo!')).catchError((error) => print('deu errado! $error'));

  collection.doc('contato3').update({ //contato3 é um ID, se ele já existir, substitui - se usar update nao precisa passar o setoptions
    'nome': 'Padaria22',
    'valor': '100'

  }).then((value) => print('deu certo!')).catchError((error) => print('deu errado! $error'));
   //remover itens 
   collection.doc('contato3').delete().then((value) => print('deu certo!')).catchError((error) => print('deu errado! $error'));

  //pode ficar desatualizado
  var result = await collection.get();

  for(var doc in result.docs){
    print(doc['nome']);
  }
  
  //atualiza na medida que ocorrem alterações
  collection.snapshots().listen((r) {
    result = r;
   });

   */
}


//QUESTÕES
/*

Definições:
- Future: classe para trabalhar com dados futuros
- Await: indica que a execução deve aguardar a função ser completa para prosseguir a execução
- Async: sinaliza a função que tem a chamada à função assíncrona 

Para que serve a programação assíncrona?
Esta técnica de programação permite que a execução de atividades ocorram em tempos definidos pelo programador, diferente do processamento linear dos códigos que ocorre normalmente.
A programação síncrona e linear não é suficiente para atender às funcionalidades, como por exemplo no delay que poderia ocorrer na busca de dados no banco e a renderização de componentes na tela.
Desta maneira, é possível que o programa não fique preso à demora de um comando, sendo possível fazer uso dos recursos await, async e da classe Future para controlar o temporizador e a ordem de execução dos trechos de códigos apontados por estes marcadores. 
*/
/*
void main() async{
	telaInicial();
	print('carrega a tela');
	print('botões');
	print('campos');
	print('imagens');	
  await buscarDados();
  await confirmaRECaptcha();
  await renderizarComponentes();
}

Future buscarDados(){
	return Future.delayed(Duration(seconds: 5), () => print('Carga de dados efetuada'));	
}

Future renderizarComponentes(){
	return Future.delayed(Duration(seconds: 1), () => print('Componentes renderizados'));	
}

void telaInicial(){
	print('Tela de splash');	
}

Future confirmaRECaptcha(){
	return Future.delayed(Duration(seconds: 5), () => print('Aguarda confirmação do usuário'));	
}
*/