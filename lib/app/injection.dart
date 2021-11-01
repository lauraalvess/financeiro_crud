
import 'package:financeiro_crud/app/database/firestore/despesa_dao_firestore.dart';
import 'package:financeiro_crud/app/domain/services/despesa_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'domain/interfaces/despesa_dao.dart';

setupInjection() async{
  GetIt getIt = GetIt.I;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //getIt.registerSingleton<DespesaDAO>(DespesaDAOImpl());
  getIt.registerSingleton<DespesaDAO>(DespesaDAOFirestore());
  getIt.registerSingleton<DespesaService>(DespesaService());
}