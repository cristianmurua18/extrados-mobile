import 'dart:convert';

import 'package:juego_cartas/features/home/domain/entities/carta_model.dart';

List<CartasModel> torneosFromJson(String str) => List<CartasModel>.from(
  json.decode(str).map((x) => CartasModel.fromJson(x)),
);

String torneosToJson(List<CartasModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartasModel extends Carta {
  CartasModel({
    required super.cartaId,
    required super.nombreCarta,
    required super.ataque,
    required super.defensa,
    required super.ilustracion,
  });

  factory CartasModel.fromJson(Map<String, dynamic> json) => CartasModel(
    cartaId: json['cartaID'],
    nombreCarta: json['nombreCarta'],
    ataque: json['ataque'],
    defensa: json['defensa'],
    ilustracion: json['ilustracion'],
  );

  Map<String, dynamic> toJson() => {
    'cartaID': cartaId,
    'nombreCarta': nombreCarta,
    'ataque': ataque,
    'defensa': defensa,
    'ilustracion': ilustracion,
  };
}
