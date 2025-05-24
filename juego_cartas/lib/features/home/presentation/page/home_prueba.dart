// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:juego_cartas/features/home/data/models/carta_model.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// //Widgets comunes, por ej al Scaffold le paso el AppBar y el body como atributo obligatorio y un boton obligatorio o no, en null
// //Scaffold, y AppBar y botones (lo que puedes cambiar lo mandas como atributo)

// class _MyHomePageState extends State<MyHomePage> {
//   int paginaActual = 0;
//   final int cantRegistros = 10;
//   bool cargando = false;
//   bool sinMasCartas = false;
//   List<Carta> cartas = [];
//   final Dio dio = Dio();

//   @override
//   void initState() {
//     super.initState();
//     _cargarCartas();
//   }

//   Future<void> _cargarCartas() async {
//     if (cargando || sinMasCartas) return;
//     setState(() {
//       cargando = true;
//     });

//     final response = await dio.get(
//       //URL de la api https://localhost:7223/api/Jugador/VerCartas?desdePagina=0&cantRegistros=10
//       //192.168.88.6 es mi wifi y puerto 7223
//       //Primer caso WSL 172.21.80.1
//       //Eternet Ethernet 2 192.168.56.1. Con esto funciona
//       'http://192.168.56.1:5053/api/Jugador/VerCartas?desdePagina=$paginaActual&cantRegistros=$cantRegistros',
//     );

//     if (response.statusCode == 200) {
//       //List<dynamic> data = json.decode(response.data);
//       List<dynamic> data = response.data;
//       if (data.isEmpty) {
//         sinMasCartas = true;
//       } else {
//         setState(() {
//           cartas.addAll(data.map((json) => Carta.fromJson(json)).toList());
//           paginaActual++;
//         });
//       }
//     } else {
//       // Manejo de errores aquí si es necesario
//       print("Error al obtener cartas: ${response.statusCode}");
//     }

//     setState(() {
//       cargando = false;
//     });
//   }

//   Widget _buildCartaCard(Carta carta) {
//     return Card(
//       elevation: 4,
//       // El elevation es la sombra de la carta
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         // es la alineacion de los elementos dentro de la carta, los hijos, en este caso a la izquierda
//         children: [
//           Expanded(
//             // Expanded es un widget que se encarga de expandir el hijo para que ocupe todo el espacio disponible, en este caso la imagen
//             child: Image.network(
//               carta.ilustracion,
//               fit: BoxFit.cover,
//               // El fit es el ajuste de la imagen, en este caso la imagen ocupa todo el espacio disponible y se recorta si es necesario
//               // el BoxFit.cover es un widget que se encarga de ajustar la imagen al tamaño del contenedor
//               errorBuilder:
//                   // El errorBuilder es un widget que se encarga de manejar los errores de la imagen
//                   // Si la imagen no se carga, se muestra un icono de imagen rota
//                   (_, __, ___) =>
//                       Icon(Icons.broken_image, size: 60, color: Colors.grey),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "ID: ${carta.cartaId} Nombre: ${carta.nombreCarta} ",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text("ATK: ${carta.ataque} - DEF: ${carta.defensa}"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Cartas"), centerTitle: true),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification scrollInfo) {
//           if (!cargando &&
//               scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
//             _cargarCartas();
//           }
//           return false;
//         },
//         child: GridView.builder(
//           padding: EdgeInsets.all(8),
//           itemCount: cartas.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.75,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//           ),
//           itemBuilder: (context, index) {
//             return _buildCartaCard(cartas[index]);
//           },
//         ),
//       ),
//     );
//   }
// }

// //El createState es el metodo que se encarga de crear el estado de la pagina,
// //y es el que se va a encargar de manejar el estado de la pagina, los cambios
// //y las actualizaciones de la UI

// //Widgets comunes, por ej al Scaffold le paso el AppBar y el body como atributo obligatorio y un boton obligatorio o no, en null
// //Scaffold, y AppBar y botones (lo que puedes cambiar lo mandas como atributo)
