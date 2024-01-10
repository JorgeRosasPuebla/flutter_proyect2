import 'package:flutter/material.dart';

class PassScreen extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contraseña')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: passwordController,
                decoration:
                    InputDecoration(labelText: 'Pon tu contraseña pasada'),
              ),
              TextField(
                controller: newPasswordController,
                decoration:
                    InputDecoration(labelText: 'Pon tu nueva contraseña'),
              ),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    labelText: 'Vuelve a poner tu nueva contraseña'),
              ),
              ElevatedButton(
                onPressed: () {
                  String newPassword = newPasswordController.text;
                  String confirmPassword = confirmPasswordController.text;
                  if (newPassword == confirmPassword) {
                    // Las contraseñas coinciden, muestra un mensaje de éxito
                    _mostrarMensaje(context, 'Contraseña Cambiada',
                        'La contraseña ha sido cambiada con éxito.');
                  } else {
                    // Las contraseñas no coinciden, muestra un mensaje de error
                    _mostrarMensaje(context, 'Error',
                        'Tu nueva contraseña es diferente, verifícala nuevamente.');
                  }
                },
                child: Text('Cambiar Contraseña'),
              ),
            ],
          ),
        ),
      ),
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
                Navigator.of(context).pop(); // Cierra el modal de éxito o error
                if (titulo == 'Contraseña Cambiada') {
                  // Redirige a WelcomeLoginScreen solo si el título es 'Contraseña Cambiada'
                  Navigator.of(context).pushReplacementNamed('/welcome_login');
                }
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
