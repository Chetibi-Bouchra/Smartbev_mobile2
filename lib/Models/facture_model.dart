// To parse this JSON data, do
//
//     final facture = factureFromJson(jsonString);

import 'dart:convert';

List<Facture> factureFromJson(String str) => List<Facture>.from(json.decode(str).map((x) => Facture.fromJson(x)));

String factureToJson(List<Facture> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Facture {
    int idPaiement;
    String status;
    DateTime datePaiement;
    String heurePaiement;
    int idCmd;
    IdCmdCommande idCmdCommande;

    Facture({
        required this.idPaiement,
        required this.status,
        required this.datePaiement,
        required this.heurePaiement,
        required this.idCmd,
        required this.idCmdCommande,
    });

    factory Facture.fromJson(Map<String, dynamic> json) => Facture(
        idPaiement: json["id_paiement"],
        status: json["status"],
        datePaiement: DateTime.parse(json["date_paiement"]),
        heurePaiement: json["heure_paiement"],
        idCmd: json["id_cmd"],
        idCmdCommande: IdCmdCommande.fromJson(json["id_cmd_commande"]),
    );

    Map<String, dynamic> toJson() => {
        "id_paiement": idPaiement,
        "status": status,
        "date_paiement": "${datePaiement.year.toString().padLeft(4, '0')}-${datePaiement.month.toString().padLeft(2, '0')}-${datePaiement.day.toString().padLeft(2, '0')}",
        "heure_paiement": heurePaiement,
        "id_cmd": idCmd,
        "id_cmd_commande": idCmdCommande.toJson(),
    };
}

class IdCmdCommande {
    int idCmd;
    DateTime timeCmd;
    String prixCmd;
    int tailleGoblet;
    double quantiteSucre;
    String etatCmd;
    int idBoisson;
    int idConsommateur;
    String numeroSerieDistributeur;

    IdCmdCommande({
        required this.idCmd,
        required this.timeCmd,
        required this.prixCmd,
        required this.tailleGoblet,
        required this.quantiteSucre,
        required this.etatCmd,
        required this.idBoisson,
        required this.idConsommateur,
        required this.numeroSerieDistributeur,
    });

    factory IdCmdCommande.fromJson(Map<String, dynamic> json) => IdCmdCommande(
        idCmd: json["id_cmd"],
        timeCmd: DateTime.parse(json["time_cmd"]),
        prixCmd: json["prix_cmd"],
        tailleGoblet: json["taille_goblet"],
        quantiteSucre: json["quantite_sucre"]?.toDouble(),
        etatCmd: json["etat_cmd"],
        idBoisson: json["id_boisson"],
        idConsommateur: json["id_consommateur"],
        numeroSerieDistributeur: json["numero_serie_distributeur"],
    );

    Map<String, dynamic> toJson() => {
        "id_cmd": idCmd,
        "time_cmd": "${timeCmd.year.toString().padLeft(4, '0')}-${timeCmd.month.toString().padLeft(2, '0')}-${timeCmd.day.toString().padLeft(2, '0')}",
        "prix_cmd": prixCmd,
        "taille_goblet": tailleGoblet,
        "quantite_sucre": quantiteSucre,
        "etat_cmd": etatCmd,
        "id_boisson": idBoisson,
        "id_consommateur": idConsommateur,
        "numero_serie_distributeur": numeroSerieDistributeur,
    };
}
