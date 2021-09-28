import 'package:financeiro_crud/app/database/sqlite/connection.dart';
import 'package:financeiro_crud/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DespesaList extends StatelessWidget {
  //const DespesaList({ Key? key }) : super(key: key);

 /*
  final lista =[
    {'nome':'Ana', 'telefone':'17 9999-9999', 'avatar':'https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807__480.png'},
    {'nome': 'Andre', 'telefone': '18 9999-9999', 'avatar':'https://cdn.pixabay.com/photo/2016/04/01/11/25/avatar-1300331__480.png'},
    {'nome': 'Beatriz', 'telefone': '19 9999-9999', 'avatar':'https://cdn.pixabay.com/photo/2014/04/02/14/10/female-306407__480.png'}
  ];
*/

  Future<List<Map<String,dynamic>>> _buscar() async{
        Database db = await Connection.get();
        return db.query('despesa');
    }


 @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          var lista;
          lista.length = 0;
          lista = futuro.data;  
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
          var avatar = CircleAvatar( backgroundImage: NetworkImage(despesa['url_avatar']),);
          return ListTile(
            leading: avatar,
            title: Text(despesa['nome']),
            subtitle:  Text(despesa['tipo']),
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