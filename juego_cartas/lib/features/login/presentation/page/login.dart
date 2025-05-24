import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juego_cartas/commons/routes.dart';
import 'package:juego_cartas/features/login/presentation/bloc/login/login_bloc.dart';
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
              return SafeArea(
                //El safe area asegura que el contenido no se superponga con la barra de navegacion o la barra de estado
                child: ListView(
                  //Aqui puedo poner una lista de widgets
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  children: <Widget>[
                    const SizedBox(height: 80.0),
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 16.0),
                        //const Text('LOGIN'),
                        const Image(
                          image: AssetImage('android/assets/loggos.png'),
                          height: 160,
                        ),
                      ],
                    ),
                    const SizedBox(height: 120.0),
                    // [Name]
                    TextField(
                      controller: _usernameController,
                      //Aqui es donde se asigna el controlador de texto al campo de texto
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Usuario',
                      ),
                    ),
                    // spacer
                    const SizedBox(height: 12.0),
                    // [Password]
                    TextField(
                      controller: _passwordController,
                      //Aqui es donde se asigna el controlador de texto al campo de texto
                      decoration: const InputDecoration(
                        //Esto le da un cierto relleno al campo de texto para que quedo mejor visiblemente
                        filled: true,
                        labelText: 'Contraseña',
                      ),
                      obscureText: true,
                      //reemplaza automaticamente la entrada que el usuario escribe con viñetas, y es apropiado para contraseñas
                    ),
                    OverflowBar(
                      //Organiza sus elementos secundarios en una fila
                      //Se encarga del diseño de los botones, los pone en horizonal uno al lado de otro
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        //Estos son los dos botones
                        TextButton(
                          child: const Text('CANCELAR'),
                          onPressed: () {
                            //Usar bloques vacios evita que se inhabiliten los botones
                            //Luego agrego el comando para borrar el texto de los campos, cuando aprete el boton
                            _usernameController.clear();
                            _passwordController.clear();
                            routerApp.go('/home');
                          },
                        ),
                        ElevatedButton(
                          child: const Text('INGRESAR'),
                          onPressed: () {
                            context.read<LoginBloc>().add(
                              LoginRequested(
                                _usernameController.text,
                                _passwordController.text,
                              ),
                            );
                            //routerApp.go('/principal');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
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
