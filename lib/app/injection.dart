
import 'package:financeiro_crud/app/domain/services/despesa_service.dart';
import 'package:get_it/get_it.dart';

import 'database/sqlite/DAO/despesa_dao_impl.dart';
import 'domain/interfaces/despesa_dao.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<DespesaDAO>(DespesaDAOImpl());
  getIt.registerSingleton<DespesaService>(DespesaService());
}