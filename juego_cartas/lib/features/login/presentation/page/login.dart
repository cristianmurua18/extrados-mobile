import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juego_cartas/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:juego_cartas/features/login/presentation/widgets/login_form.dart';
import 'package:juego_cartas/features/principal/presentation/page/principal.dart';
//Importo el paquete de material design para poder usar los widgets de la libreria

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  //El key es un identificador unico para identificarlo en el arbol de widgets
  @override
  LoginPageState createState() => LoginPageState();
  //Creo el estado de la pagina de login, la hago privada. Poque esta mal?
  //Le saque los guiones bajos
}

class LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  //Estas son las variables que se encargan de controlar el texto que el usuario ingresa en los campos de texto
  @override
  Widget build(BuildContext context) {
    //El metodo build es el encargado de construir la interfaz de usuario, controla cómo se crean todos los widgets de nuestra IU.
    return Scaffold(
      //El scaffold es un widget que proporciona una estructura basica para la UI
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          //Tengo una opcion por estado
          switch (state) {
            case LoginInitial():
              //REVISAR PARA VER QUE DEBERIA RECIBIR O HACER EL INITIAL Y EL SUCCESS
              return LoginForm(
                usernameController: _usernameController,
                passwordController: _passwordController,
              );
            case LoginLoading():
              return const Center(child: CircularProgressIndicator());
            case LoginSuccess():
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Inicio de sesion exitoso!')),
                );
              });
              return Principal();
            case AuthFailure():
              //A lo mejor llamar de nuevo al widget de LOGIN
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Credenciales incorrectas')),
                );
              });
              return SafeArea(
                child: Center(child: Text('Credenciales incorrectas')),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
