
import 'package:get_it/get_it.dart';

import 'database/sqlite/DAO/despesa_dao_impl.dart';
import 'domain/interfaces/despesa_dao.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<DespesaDAO>(DespesaDAOImpl());
}