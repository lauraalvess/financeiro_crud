import 'package:financeiro_crud/app/view/despesa_details_back.dart';
import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:flutter/material.dart';

class DespesaDetails extends StatelessWidget {
  
  
  showModalError(BuildContext context){
    var alert = AlertDialog( 
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return alert;
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    var _back = DespesaDetailsBack(context);
    Despesa despesa = _back.despesa;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
       
        var width = constraints.biggest.width; 
        var radius = width/3;
       // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(  
            padding: EdgeInsets.all(60),
            children: [  
              (Uri.tryParse(despesa.urlAvatar).isAbsolute) ? 
                CircleAvatar(
                  backgroundImage: NetworkImage(despesa.urlAvatar), 
                  radius:radius ,
                ) : 
                CircleAvatar(
                  child: Icon(
                    Icons.person, 
                    size: width/2,
                  ),
                  radius:radius ,
                ),
              Center( 
                child: Text('${despesa.nome}', style:  TextStyle(fontSize: 30),),
              ),
              Card( 
                child: ListTile( 
                  title: Text('Valor:'), 
                  subtitle: Text('${despesa.valor}'),
                ),
              ),
              Card( 
                child: ListTile( 
                  title: Text('Tipo:'), 
                  subtitle: Text('${despesa.tipo}'),
                ),
              ),
              Card( 
                child: ListTile( 
                  title: Text('Valor - aciona app:'), 
                  subtitle: Text('${despesa.valor}'),
                  trailing: Container( 
                    width: width/4 ,
                    child:  Row(
                      children: [
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.message), 
                          onPressed: (){
                            _back.launchSMS(showModalError);
                          }
                        ),
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.phone), 
                          onPressed: (){
                            _back.launchPhone(showModalError);
                          }
                        )
                      ]
                      ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton( 
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
/**
 * 
  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
       
        var width = constraints.biggest.width; 
        var radius = width/3;
       // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(  
            padding: EdgeInsets.all(60),
            children: [  
              (Uri.tryParse(contact.urlAvatar).isAbsolute) ? 
                CircleAvatar(
                  backgroundImage: NetworkImage(contact.urlAvatar), 
                  radius:radius ,
                ) : 
                CircleAvatar(
                  child: Icon(
                    Icons.person, 
                    size: width/2,
                  ),
                  radius:radius ,
                ),
              Center( 
                child: Text('${contact.nome}', style:  TextStyle(fontSize: 30),),
              ),
              Card( 
                child: ListTile( 
                  title: Text('Telefone:'), 
                  subtitle: Text('${contact.telefone}'),
                  trailing: Container( 
                    width: width/4 ,
                    child:  Row(
                      children: [
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.message), 
                          onPressed: (){
                            _back.launchSMS(showModalError);
                          }
                        ),
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.phone), 
                          onPressed: (){
                            _back.launchPhone(showModalError);
                          }
                        )
                      ]
                      ),
                  ),
                ),
              ),
              Card( 
                child: ListTile( 
                  title: Text('E-mail:'), 
                  onTap: () {
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text('${contact.email}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton( 
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
 */