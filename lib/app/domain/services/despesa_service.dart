import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:financeiro_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:financeiro_crud/app/domain/interfaces/despesa_dao.dart';
import 'package:get_it/get_it.dart';

class DespesaService{
 // var dao = DespesaDAOImpl();
 var _dao = GetIt.I.get<DespesaDAO>();


save(Despesa despesa){
  validateName(despesa.nome);
  validateTipo(despesa.tipo);

  _dao.save(despesa);
}

remove(int id){
  _dao.remove(id);
}


Future <List<Despesa>> find(){
  return _dao.find();
}

  validateName(String name){
    var min = 3;
    var max = 50;
    if(name==null){
      throw new DomainLayerException('O nome é obrigatório');
    } else if(name.length < min){
      throw new DomainLayerException('O nome deve possuir pelo menos $min caracteres');
    } else if(name.length > max){
      throw new DomainLayerException('O nome deve possuir até $max caracteres');
    }

  }

  validateTipo(String tipo){
    if(tipo==null){
      throw new DomainLayerException('O tipo é obrigatório');
    }
  }

  validateValor(String valor){
    if(valor == null){
      throw new DomainLayerException('O valor é obrigatório');
    }
  }

}
