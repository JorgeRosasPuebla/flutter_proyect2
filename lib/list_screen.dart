import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Usamos un Row para alinear el texto a la izquierda y el botón al centro
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tipo de Persona'),
                      Text('Taza de Seguro por Marca'),
                      Text(
                          '¿No encuentras tu taza? Puedes crearla en la sección de vehículos'),
                      Text('Modelo'),
                      Text('Precio Total del Vehículo'),
                      Text(
                          '\$'), // Aquí puedes ajustar el valor según sea necesario
                      Text('% Comisión por Apertura'),
                      Text('Plazo'),
                      Text('Fecha de Contratación'),
                      Text('Bien Inmueble'),
                      Text('Cliente'),
                      Text('Género'),
                      Text('% Anticipo a Rentas'),
                      Text('Seguro'),
                      Text(
                          '\$'), // Aquí puedes ajustar el valor según sea necesario
                      Text('Interés con IVA'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/form');
                  },
                  child: Text('Crear nuevo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
