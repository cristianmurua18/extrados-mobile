//Aqui vamos a crear nuestro tema personalizado para la aplicacion
import 'package:flutter/material.dart';

//Es el tema de la app, donde se define el color de fondo, el color del texto, y del appbar
//Es una buena practica tenerlo en un archivo separado(centralizado), para poder reutilizarlo en toda la app
class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    //El ThemeData ya traer versiones de los colores y otras cosas de estilos, por ej light y dark
    //con el copyWith copia lo que traen por defecto seleecionado y no se esta modificando aqui
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: Colors.deepPurple,
      secondary: Colors.amber,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );

  //static var ligththeme;
}

//Concepto: usar una variable, que se actualizada cada vez que hago un cambio de estado
//Debo usar un gestor de estado
//Para eso tengo que declarar un variable con el widget si es StatefulWidget, y luego en el build, la variable se actualiza cada vez que cambia el estado
