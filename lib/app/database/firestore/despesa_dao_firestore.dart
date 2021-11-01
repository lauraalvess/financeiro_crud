import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:financeiro_crud/app/domain/interfaces/despesa_dao.dart';
import 'package:flutter/cupertino.dart';

class DespesaDAOFirestore implements DespesaDAO{
  CollectionReference despesaCollection;

  DespesaDAOFirestore(){
    despesaCollection = FirebaseFirestore.instance.collection('despesa');
  }

  @override
  Future<List<Despesa>> find() async {
    var result = await despesaCollection.get();
    return result.docs.map(
      (doc) => Despesa(
        id: doc.reference.id.toString(),
        nome: doc['nome'],
        tipo: doc['tipo'],
        valor: doc['valor']
      )
    ).toList();

    throw UnimplementedError();
  }



  @override
  remove(id) {
    despesaCollection.doc(id).delete();
    throw UnimplementedError();
  }

  @override
  save(Despesa despesa) {
    despesaCollection.doc(despesa.id).set(
      {
        'nome': despesa.nome,
        'tipo' : despesa.tipo,
        'valor': despesa.valor,
        'urlAvatar': despesa.urlAvatar
      }
    );
    throw UnimplementedError();
  }

  
}