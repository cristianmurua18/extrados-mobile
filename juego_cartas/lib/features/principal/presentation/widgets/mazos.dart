import 'package:flutter/material.dart';
import 'package:juego_cartas/commons/routes.dart';

class Mazos extends StatelessWidget {
  const Mazos({super.key});

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
        title: const Text('Mazos'),
      ),
      body: const Center(child: Text('Mazos')),
    );
  }
}
