import 'package:flutter/material.dart';
import 'package:juego_cartas/commons/routes.dart';

class InscripcionTorneos extends StatelessWidget {
  const InscripcionTorneos({super.key});

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
        title: const Text('Inscripcion a Torneo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Inscripcion a Torneo', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
