import 'package:flutter/material.dart';
import 'package:juego_cartas/commons/routes.dart';

//Puede ir con el provaider para manejar estados y no hace falta usar el statefull widget
class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Soy el Principal.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 177, 162, 162),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu lateral'),
            ),
            ListTile(
              title: const Text('Mi Perfil'),
              onTap: () {
                routerApp.go('/perfil');
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: const Text('Mis Mazos'),
              onTap: () {
                routerApp.go('/mazos');
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: const Text('Inscripcion a torneos'),
              onTap: () {
                routerApp.go('/inscripcion');
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MENU PRINCIPAL'),
        actions: [
          IconButton(
            icon: const Icon(Icons.backspace),
            tooltip: 'Cerrar Sesion',
            onPressed: () {
              routerApp.go('/home');
            },
          ),
        ],
      ),
    );
  }
}

//Hacer la implementacion de la inyeccion de dependencia
