import 'package:financeiro_crud/app/domain/entities/despesa.dart';

abstract class DespesaDAO{

  save(Despesa despesa);
  remove(dynamic id);
  Future<List<Despesa>> find();

}