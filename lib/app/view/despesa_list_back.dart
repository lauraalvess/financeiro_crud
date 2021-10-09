import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:financeiro_crud/app/domain/services/despesa_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'despesa_list_back.g.dart';

class DespesaListBack = _DespesaListBack with _$DespesaListBack;

abstract class _DespesaListBack with Store{
  var _service = GetIt.I.get<DespesaService>();

  //lista de contatos 
  @observable
  Future<List<Despesa>> list;


  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _DespesaListBack(){
    refreshList();
  }

//método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Despesa despesa]){
    Navigator.of(context).pushNamed(MyApp.DESPESA_FORM, arguments: despesa).then(refreshList);
  }

  //excluir
  remove(int id){
    _service.remove(id); 
    refreshList();
  }
}