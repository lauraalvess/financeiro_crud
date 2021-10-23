import 'package:financeiro_crud/app/view/despesa_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class DespesaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(DespesaFormBack back) {
    return TextFormField (  
      validator: back.validateName,
      onSaved: (newValue) => back.despesa.nome = newValue,
      initialValue: back.despesa.nome,
      decoration: InputDecoration ( 
        labelText: 'Nome:'
      )
    );
  }
  
  Widget fieldType(DespesaFormBack back) {
    return TextFormField (  
      validator: back.validateType,
      onSaved: (newValue) => back.despesa.tipo= newValue,
      initialValue: back.despesa.tipo,
      decoration: InputDecoration ( 
        labelText: 'Tipo:'
      )
    );
  }

  Widget fieldValue(DespesaFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField (  
      validator: back.validateValue,
      onSaved: (newValue) => back.despesa.valor= newValue,
      initialValue: back.despesa.valor,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration: InputDecoration ( 
        labelText: 'Valor:', 
        hintText: '9999,99'
      )
    );
  }

  Widget fieldURLImage(DespesaFormBack back) {
    return TextFormField (        
      validator: back.validateType,
      onSaved: (newValue) => back.despesa.urlAvatar= newValue,
      initialValue: back.despesa.urlAvatar,
      decoration: InputDecoration ( 
        labelText: 'Endereço Foto:', 
        hintText: 'http://www.site.com'
      )
    );
  }


   @override
  Widget build(BuildContext context) {
    var _back = DespesaFormBack(context);
    return Scaffold(
      appBar: AppBar(  
        title: Text('Cadastro de Despesa'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              _form.currentState.validate();
              _form.currentState.save();
              if(_back.isValid){
                _back.save();
                Navigator.of(context).pop();
              }
            })
        ],
      ),
      body: Padding(  
        padding: EdgeInsets.all(10),
        child: Form(  
          key: _form,
          child:  Column (
            children: [
              fieldName(_back),
              fieldType(_back),
              fieldValue(_back), 
              fieldURLImage(_back)
            ],
            ),
        ),
      ),
      
    );
  }
}

/* import 'package:flutter/material.dart';

class DespesaForm extends StatefulWidget {
  const DespesaForm({ key }) : super(key: key);

  @override
  _DespesaFormState createState() => _DespesaFormState();
}

class _DespesaFormState extends State<DespesaForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de despesa'),
        ),
    );
  }
}
*/