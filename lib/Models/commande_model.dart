// To parse this JSON data, do
//
//     final commande = commandeFromJson(jsonString);

import 'dart:convert';

Commande commandeFromJson(String str) => Commande.fromJson(json.decode(str));

String commandeToJson(Commande data) => json.encode(data.toJson());

class Commande {
    int idCmd;
    DateTime timeCmd;
    String prixCmd;
    int quantiteSucre;
    int tailleGoblet;
    String etatCmd;
    int idBoisson;
    dynamic idConsommateur;
    String numeroSerieDistributeur;

    Commande({
        required this.idCmd,
        required this.timeCmd,
        required this.prixCmd,
        required this.quantiteSucre,
        required this.tailleGoblet,
        required this.etatCmd,
        required this.idBoisson,
        this.idConsommateur,
        required this.numeroSerieDistributeur,
    });

    factory Commande.fromJson(Map<String, dynamic> json) => Commande(
        idCmd: json["id_cmd"],
        timeCmd: DateTime.parse(json["time_cmd"]),
        prixCmd: json["prix_cmd"],
        quantiteSucre: json["quantite_sucre"],
        tailleGoblet: json["taille_goblet"],
        etatCmd: json["etat_cmd"],
        idBoisson: json["id_boisson"],
        idConsommateur: json["id_consommateur"],
        numeroSerieDistributeur: json["numero_serie_distributeur"],
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
    };
}
