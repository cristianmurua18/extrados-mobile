import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juego_cartas/commons/routes.dart';
import 'package:juego_cartas/features/login/presentation/bloc/login/login_bloc.dart';

class RegistroJugadorForm extends StatefulWidget {
  const RegistroJugadorForm({super.key});

  @override
  State<RegistroJugadorForm> createState() => _RegistroJugadorFormState();
}

class _RegistroJugadorFormState extends State<RegistroJugadorForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreApellidoController =
      TextEditingController();
  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _idPaisOrigenController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nombreUsuarioController =
      TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  void dispose() {
    _nombreApellidoController.dispose();
    _aliasController.dispose();
    _idPaisOrigenController.dispose();
    _emailController.dispose();
    _nombreUsuarioController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
        RegistrarJugadorEvent(
          nombreApellido: _nombreApellidoController.text,
          alias: _aliasController.text,
          idPaisOrigen: int.tryParse(_idPaisOrigenController.text) ?? 0,
          email: _emailController.text,
          nombreUsuario: _nombreUsuarioController.text,
          contrasena: _contrasenaController.text,
          rol: "Jugador", // Valor fijo
          activo: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nombreApellidoController,
              decoration: const InputDecoration(labelText: 'Nombre y Apellido'),
              validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
            ),
            TextFormField(
              controller: _aliasController,
              decoration: const InputDecoration(labelText: 'Alias'),
              validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
            ),
            TextFormField(
              controller: _idPaisOrigenController,
              decoration: const InputDecoration(labelText: 'ID País Origen'),
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator:
                  (value) => value!.contains('@') ? null : 'Email no válido',
            ),
            TextFormField(
              controller: _nombreUsuarioController,
              decoration: const InputDecoration(labelText: 'Nombre de Usuario'),
              validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
            ),
            TextFormField(
              controller: _contrasenaController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
              validator:
                  (value) => value!.length >= 6 ? null : 'Mínimo 6 caracteres',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registrar,
              child: const Text('Registrarse'),
            ),
            ElevatedButton(
              onPressed: () {
                routerApp.go('/login');
              },
              child: const Text('Calcelar'),
            ),
          ],
        ),
      ),
    );
  }
}
