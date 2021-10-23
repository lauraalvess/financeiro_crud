
import 'package:financeiro_crud/app/view/despesa_details.dart';
import 'package:financeiro_crud/app/view/despesa_form.dart';
import 'package:financeiro_crud/app/view/despesa_list.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static const HOME = '/';
  static const DESPESA_FORM = 'despesa-form';
  static const DESPESA_DETAILS = 'contact-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: ContactList(),
      routes: {
        HOME:(context) => DespesaList(),
        DESPESA_FORM: (context) => DespesaForm(),
        DESPESA_DETAILS: (context) => DespesaDetails()
      },
    );
  }
}
