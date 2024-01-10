import 'package:flutter/material.dart';

class NewCotScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nueva Cotización')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _mostrarModalCorreo(context);
              },
              child: Text('Enviar Correo'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción para descargar PDF
              },
              child: Text('Descargar PDF'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarModalCorreo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Ingresar Correo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Correo'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      String email = emailController.text;
                      if (email.contains('@')) {
                        // Si el correo contiene "@" es válido
                        // Muestra un mensaje de éxito y cierra el modal
                        _mostrarMensaje(context, 'Correo Enviado',
                            'El correo ha sido enviado con éxito.');
                      } else {
                        // Si el correo no contiene "@" muestra un mensaje de error
                        _mostrarMensaje(
                            context, 'Error', 'El correo no es válido.');
                      }
                    },
                    child: Text('Enviar'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarMensaje(BuildContext context, String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el modal del mensaje
                Navigator.of(context).pop(); // Cierra el modal principal
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
