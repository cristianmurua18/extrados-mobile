// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MazoEntity welcomeFromJson(String str) => MazoEntity.fromJson(json.decode(str));

String welcomeToJson(MazoEntity data) => json.encode(data.toJson());

class MazoEntity {
  int mazoId;
  String nombreMazo;
  int jugadorCreador;

  MazoEntity({
    required this.mazoId,
    required this.nombreMazo,
    required this.jugadorCreador,
  });

  factory MazoEntity.fromJson(Map<String, dynamic> json) => MazoEntity(
    mazoId: json["mazoID"],
    nombreMazo: json["nombreMazo"],
    jugadorCreador: json["jugadorCreador"],
  );

  Map<String, dynamic> toJson() => {
    "mazoID": mazoId,
    "nombreMazo": nombreMazo,
    "jugadorCreador": jugadorCreador,
  };
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Welcome {
//     int mazoId;
//     String nombreMazo;
//     int jugadorCreador;

//     Welcome({
//         required this.mazoId,
//         required this.nombreMazo,
//         required this.jugadorCreador,
//     });

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         mazoId: json["mazoID"],
//         nombreMazo: json["nombreMazo"],
//         jugadorCreador: json["jugadorCreador"],
//     );

//     Map<String, dynamic> toJson() => {
//         "mazoID": mazoId,
//         "nombreMazo": nombreMazo,
//         "jugadorCreador": jugadorCreador,
//     };
// }
