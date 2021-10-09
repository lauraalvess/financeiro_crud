import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:financeiro_crud/app/view/despesa_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../my_app.dart';

class DespesaList extends StatelessWidget {
  /*
  Future<List<Despesa>> _buscar() async {
    //Database db = await Connection.get();
    //return db.query('despesa');
    return DespesaDAOImpl().find();
  }
*/
  final _back = DespesaListBack();

  CircleAvatar circleAvatar(String url) {
    try {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } catch (e) {
      return CircleAvatar(child: Icon(Icons.person));
    }
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Despesas'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(MyApp.DESPESA_FORM);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                print(futuro.hasData);
                print(futuro.hasError);
                print(futuro.error);
                print(futuro.hashCode);
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  //var lista;
                  //lista.length = 0;
                  //lista = futuro.data;
                  List<Despesa> lista = futuro.data;
                  return ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, i) {
                        var despesa = lista[i];
                        return ListTile(
                          leading: circleAvatar(despesa.urlAvatar),
                          title: Text(despesa.nome),
                          subtitle: Text(despesa.tipo),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, despesa);
                                }),
                                iconRemoveButton(context, () {
                                  _back.remove(despesa.id);
                                  Navigator.of(context).pop();
                                })
                              ],
                            ),
                          ),
                        );
                      });
                }
              });
        }));
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
