import 'package:flutter/foundation.dart';

class Contact {
  final String nom;
  final String prenom;
  final String numero;

  const Contact({
    required this.nom,
    required this.prenom,
    required this.numero,
  });

  @override
  String toString() {
    return "Nom: $nom, Prenom: $prenom, Numero: $numero";
  }

  factory Contact.fromJson(Map<String, dynamic> data) {
    return Contact(
      nom: data["nom"],
      prenom: data["prenom"],
      numero: data["numero"],
    );
  }
}
