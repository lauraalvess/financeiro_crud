import 'package:financeiro_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class DespesaList extends StatelessWidget {
  const DespesaList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de despesas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(MyApp.DESPESA_FORM);
            }), 
        ],
      ),
      body: ListView(),
    );
  }
}