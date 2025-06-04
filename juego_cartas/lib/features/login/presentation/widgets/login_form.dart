import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juego_cartas/commons/routes.dart';
import 'package:juego_cartas/features/login/presentation/bloc/login/login_bloc.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          const SizedBox(height: 80.0),
          Column(
            children: const <Widget>[
              SizedBox(height: 16.0),
              Image(
                image: AssetImage('android/assets/loggos.png'),
                height: 160,
              ),
            ],
          ),
          const SizedBox(height: 120.0),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Usuario',
            ),
          ),
          const SizedBox(height: 12.0),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Contraseña',
            ),
            obscureText: true,
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('CANCELAR'),
                onPressed: () {
                  usernameController.clear();
                  passwordController.clear();
                  routerApp.go('/home');
                },
              ),
              ElevatedButton(
                child: const Text('INGRESAR'),
                onPressed: () {
                  context.read<LoginBloc>().add(
                    LoginRequested(
                      usernameController.text,
                      passwordController.text,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
