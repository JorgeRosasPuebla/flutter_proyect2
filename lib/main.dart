import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/bienvenida',
      routes: {
        '/bienvenida': (context) => BienvenidaScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Agrega un Future.delayed para mostrar el modal después de 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/huella.png',
                  width: 100,
                  height: 100,
                ),
                //Text('Autenticarse con huella'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra el modal
                    Navigator.pushNamed(
                        context, '/home'); // Navega al tercer screen
                  },
                  child: Text('Autenticarse con huella digital'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra el modal
                    Navigator.pushNamed(
                        context, '/login'); // Navega al segundo screen
                  },
                  child: Text('Cerrar'),
                ),
              ],
            ),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: 127,
            ),
            Image.asset(
              'assets/logo.png',
              width: 400,
              height: 400,
            ),
            // Text('¡Bienvenido!'),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bienvenido'),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true, // Para contraseñas
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de inicio de sesión
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Realiza la autenticación o cualquier otra lógica aquí
                // Por ahora, simplemente navega al tercer screen
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pantalla Principal'),
          ],
        ),
      ),
    );
  }
}
