import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new_cot');
          },
          child: Text('Botón'),
        ),
      ),
    );
  }
}
