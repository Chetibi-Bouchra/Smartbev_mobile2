// To parse this JSON data, do
//
//     final commande = commandeFromJson(jsonString);

import 'dart:convert';

Commande commandeFromJson(String str) => Commande.fromJson(json.decode(str));

String commandeToJson(Commande data) => json.encode(data.toJson());

class Commande {
  int idCmd;
  DateTime timeCmd;
  double prixCmd;
  int quantiteSucre;
  int tailleGoblet;
  String etatCmd;
  int idBoisson;
  dynamic idConsommateur;
  String numeroSerieDistributeur;
  String imageCmd;
  String name;

  Commande({
    required this.idCmd,
    required this.timeCmd,
    required this.prixCmd,
    required this.quantiteSucre,
    required this.tailleGoblet,
    required this.etatCmd,
    required this.idBoisson,
    required this.imageCmd,
    required this.name,
    this.idConsommateur,
    required this.numeroSerieDistributeur,
  });

  factory Commande.fromJson(Map<String, dynamic> json) => Commande(
        idCmd: json["id_cmd"],
        timeCmd: DateTime.parse(json["time_cmd"]),
        prixCmd: double.parse(json["prix_cmd"]),
        quantiteSucre: json["quantite_sucre"],
        tailleGoblet: json["taille_goblet"],
        etatCmd: json["etat_cmd"],
        idBoisson: json["id_boisson"],
        idConsommateur: json["id_consommateur"],
        numeroSerieDistributeur: json["numero_serie_distributeur"],
        imageCmd: json["path_image_boisson"],
        name: json["libelle_boisson"],


      );

  Map<String, dynamic> toJson() => {
        "id_cmd": idCmd,
        "time_cmd": timeCmd.toIso8601String(),
        "prix_cmd": prixCmd,
        "quantite_sucre": quantiteSucre,
        "taille_goblet": tailleGoblet,
        "etat_cmd": etatCmd,
        "id_boisson": idBoisson,
        "id_consommateur": idConsommateur,
        "numero_serie_distributeur": numeroSerieDistributeur,
        "libelle_boisson": name,
        "path_image_boisson": imageCmd,
      };
}
