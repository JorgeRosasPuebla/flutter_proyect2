import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WelcomeLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usuarioController = TextEditingController();
    TextEditingController contrasenaController = TextEditingController();

    // Establecer valores predeterminados
    usuarioController.text = 'admin@sfl.com.mx';
    contrasenaController.text = '123456789!';

    // Función para realizar la autenticación
    Future<void> login() async {
      final String apiUrl = 'https://sfl.com.mx/api/auth/login';

      final Map<String, String> data = {
        'email': usuarioController.text,
        'password': contrasenaController.text,
      };

      try {
        final response = await http.post(Uri.parse(apiUrl), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          final jsonResponse = json.decode(response.body);
          final accessToken = jsonResponse['access_token'];

          // Acceder a los valores deserializados
          print('Token de acceso: $accessToken');
          print('Nombre de usuario: ${jsonResponse['user']['name']}');
        } else {
          // Hubo un error en la solicitud.
          print(
              'Error en la solicitud. Código de estado: ${response.statusCode}');

          // Imprime el cuerpo de la respuesta para obtener más detalles sobre el error.
          print('Cuerpo de la respuesta: ${response.body}');
        }
      } catch (error) {
        // Manejar errores de conexión
        print('Error de conexión: $error');
      }
    }

    // Una función para mostrar el modal de bienvenida después de un retraso de 3 segundos
    Future<void> mostrarModalDeBienvenida() async {
      await Future.delayed(Duration(seconds: 3));
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Bienvenido'),
            content: Column(
              children: [
                Text('¡Gracias por usar nuestra aplicación!'),
                SizedBox(height: 20),
                TextField(
                  controller: usuarioController,
                  decoration: InputDecoration(labelText: 'Usuario'),
                ),
                TextField(
                  controller: contrasenaController,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: login,
                  child: Text('Iniciar Sesión'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/pass');
                  },
                  child: Text('Cambiar Contraseña'),
                ),
              ],
            ),
          );
        },
      );
    }

    // Llama a la función para mostrar el modal al entrar en la pantalla
    mostrarModalDeBienvenida();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(''),
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/fondo1.png', fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset('assets/logo.png', width: 300, height: 300),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
