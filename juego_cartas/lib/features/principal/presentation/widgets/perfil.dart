import 'package:flutter/material.dart';
import 'package:juego_cartas/commons/routes.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            routerApp.go('/principal');
            // O Navigator.of(context).pop()
          },
        ),
        title: const Text('Perfil'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Cuerpo de Perfil', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
