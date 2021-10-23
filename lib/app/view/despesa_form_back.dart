
import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:financeiro_crud/app/domain/services/despesa_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';

part 'despesa_form_back.g.dart';

class DespesaFormBack = _DespesaFormBack with _$DespesaFormBack;

abstract class _DespesaFormBack with Store{
  Despesa despesa;
  var _service = GetIt.I.get<DespesaService>();
  bool _nameIsValid; 
  bool _typeIsValid; 
  bool _valueIsValid; 

  //@action
  bool get isValid => _nameIsValid && _typeIsValid && _valueIsValid;


  // diferenciar novo com alteração 
  _DespesaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    despesa = (parameter == null) ? Despesa() : parameter;
  }

  save() async {
    await _service.save(despesa);
  }

  //validações  
  String validateName(String name){
    try{
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    }catch(e){
      _nameIsValid = false;
      return e.toString();
    }
  }
  
  String validateType(String type){
    try{
      _service.validateTipo(type);
      _typeIsValid = true;
      return null;
    }catch(e){
      _typeIsValid = false;
      return e.toString();
    }
  }
  
  String validateValue(String value){
    try{
      _service.validateValor(value);
      _valueIsValid = true;
      return null;
    }catch(e){
      _valueIsValid = false;
      return e.toString();
    }
  }




}