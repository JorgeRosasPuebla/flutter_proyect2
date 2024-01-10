import 'package:flutter/material.dart';
import 'welcome_login_screen.dart';
import 'list_screen.dart';
import 'form_screen.dart';
import 'new_cot_screen.dart';
import 'pass_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu Aplicación',
      theme: ThemeData(
        primarySwatch:
            Colors.green, // Cambia el color azul predeterminado a verde
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(
                0xFF4BAF74), // Establece el color hexadecimal personalizado (#4BAF74) para los botones
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(
              0xFF4BAF74), // Establece el color hexadecimal personalizado (#4BAF74) para la barra de la aplicación
        ),
      ),
      initialRoute: '/welcome_login',
      routes: {
        '/welcome_login': (context) => WelcomeLoginScreen(),
        '/list': (context) => ListScreen(),
        '/form': (context) => FormScreen(),
        '/new_cot': (context) => NewCotScreen(),
        '/pass': (context) => PassScreen(),
      },
    );
  }
}
