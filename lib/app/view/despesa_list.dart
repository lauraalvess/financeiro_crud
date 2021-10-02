import 'package:financeiro_crud/app/database/sqlite/DAO/despesa_dao_impl.dart';
import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:flutter/material.dart';

import '../my_app.dart';

class DespesaList extends StatelessWidget {

   Future<List<Despesa>> _buscar() async{
        //Database db = await Connection.get();
        //return db.query('despesa');
        return await DespesaDAOImpl().find();
    }


 @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      
      builder: (context, futuro){
        print(futuro.hasData);
        print(futuro.hasError);
        print(futuro.error);
        print(futuro.hashCode);
        if(futuro.hasData){
          //var lista;
          //lista.length = 0;
          //lista = futuro.data;  
           List<Despesa> lista = futuro.data;
          return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Despesas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
             onPressed: (){
               Navigator.of(context).pushNamed(MyApp.DESPESA_FORM);
             }
             )
        ],
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, i){
          var despesa = lista[i];
          var avatar = CircleAvatar( backgroundImage: NetworkImage(despesa.urlAvatar),);
          return ListTile(
            leading: avatar,
            title: Text(despesa.nome),
            subtitle:  Text(despesa.tipo),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: null),
                  IconButton(icon: Icon(Icons.delete), onPressed: null),
                ],
                ),
              ) ,
          );
        },
      )
      );

        }else{
          print('VAZIO');
          return Scaffold();
        }
      }
      );
    
  }
/*



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
       body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, i){
          var contato = lista[i];
          var avatar = CircleAvatar(backgroundImage: NetworkImage(contato['avatar'] ?? ""));

          //return Text(contato['nome'] ?? "");
          return ListTile(
            title: Text(contato['nome'] ?? ""),
            subtitle: Text(contato['telefone'] ?? ""),
            leading: avatar,
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(onPressed: null, icon:Icon(Icons.edit)),
                  IconButton(onPressed: null, icon:Icon(Icons.delete))
                ],
              )
            ),
          );
        }
      ),
    );
  }
  */
}