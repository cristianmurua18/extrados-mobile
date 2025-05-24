import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juego_cartas/features/home/presentation/page/home.dart';
import 'package:juego_cartas/features/login/presentation/page/login.dart';
import 'package:juego_cartas/features/principal/presentation/page/principal.dart';
import 'package:juego_cartas/features/principal/presentation/widgets/inscripcion_torneos.dart';
import 'package:juego_cartas/features/principal/presentation/widgets/mazos.dart';
import 'package:juego_cartas/features/principal/presentation/widgets/perfil.dart';

//Aqui se definen las rutas, con GoRouter, que es un paquete para manejar rutas en Flutter
final GoRouter routerApp = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),

    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),

    GoRoute(
      //NO LA USO MAS DESDE AQUI
      path: '/principal',
      builder: (BuildContext context, GoRouterState state) {
        return const Principal();
      },
    ),

    GoRoute(
      path: '/perfil',
      builder: (BuildContext context, GoRouterState state) {
        return const Perfil();
      },
    ),

    GoRoute(
      path: '/mazos',
      builder: (BuildContext context, GoRouterState state) {
        return const Mazos();
      },
    ),

    GoRoute(
      path: '/inscripcion',
      builder: (BuildContext context, GoRouterState state) {
        return const InscripcionTorneos();
      },
    ),
  ],
);
