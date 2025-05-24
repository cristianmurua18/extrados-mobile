class Carta {
  final int cartaId;
  final String nombreCarta;
  final int ataque;
  final int defensa;
  final String ilustracion;

  Carta({
    required this.cartaId,
    required this.nombreCarta,
    required this.ataque,
    required this.defensa,
    required this.ilustracion,
  });

  factory Carta.fromJson(Map<String, dynamic> json) => Carta(
    cartaId: json['cartaID'],
    nombreCarta: json['nombreCarta'],
    ataque: json['ataque'],
    defensa: json['defensa'],
    ilustracion: json['ilustracion'],
  );
}

// class Carta {
//   final int id;
//   final String nombre;
//   final int ataque;
//   final int defensa;
//   final String ilustracion;

//   Carta({
//     required this.id,
//     required this.nombre,
//     required this.ataque,
//     required this.defensa,
//     required this.ilustracion,
//   });

//   factory Carta.fromJson(Map<String, dynamic> json) {
//     return Carta(
//       id: json['cartaID'],
//       nombre: json['nombreCarta'],
//       ataque: json['ataque'],
//       defensa: json['defensa'],
//       ilustracion: json['ilustracion'],
//     );
//   }
// }
