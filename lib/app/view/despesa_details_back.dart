import 'package:financeiro_crud/app/domain/entities/despesa.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class DespesaDetailsBack{
  BuildContext context;
  Despesa despesa;

  DespesaDetailsBack(context){
    despesa = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async{
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError){
    //_launchApp('tel:${despesa.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError){
    //_launchApp('sms:${despesa.telefone}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError){
    //_launchApp('mailto:${despesa.email}', showModalError);
  }
}