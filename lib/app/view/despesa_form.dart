import 'package:flutter/material.dart';

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