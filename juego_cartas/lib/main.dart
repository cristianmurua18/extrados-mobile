import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:juego_cartas/commons/routes.dart';
import 'package:juego_cartas/config/getit_config.dart';
import 'package:juego_cartas/features/home/presentation/bloc/Torneos/torneos_bloc.dart';
import 'package:juego_cartas/features/login/presentation/bloc/login/login_bloc.dart';

void main() {
  //Agregar Configuraciones. debe ser asincrono el main?
  configureGetItApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TorneosBloc(GetIt.instance.get())),
        BlocProvider(create: (_) => LoginBloc(GetIt.instance.get())),
      ],

      child: FutureBuilder(
        // Es necesario esperar a que GetIt termine de instanciar las dependencias y no se muestre un error
        future: GetIt.instance.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp.router(
              //debugShowCheckedModeBanner: true,
              //El debugShowCheckedModeBanner es un widget que se encarga de mostrar el banner de debug en la parte superior derecha de la pantalla, y es el que se va a encargar de mostrar el banner de debug en la parte superior derecha de la pantalla
              routerConfig: routerApp,
              //No olvidar hacer la configuracion de las rutas
              title: 'Juego de cartas',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
            );
          } else {
            //TODO: hacer un blocbuilder del login
            /*
              En ese blocListener hayq ue evaluar si hay un inicio de sesion o no
              y segun abrir directo al home o a inicio de sesion
             */
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
    //theme: CustomTheme.lightTheme,
  }
}
