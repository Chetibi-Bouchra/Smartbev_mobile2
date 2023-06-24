// To parse this JSON data, do
//
//     final reclamation = reclamationFromJson(jsonString);

import 'dart:convert';

Reclamation reclamationFromJson(String str) => Reclamation.fromJson(json.decode(str));

String reclamationToJson(Reclamation data) => json.encode(data.toJson());

class Reclamation {
    String descriptionReclamation;
    String typeReclamation;
    String etatReclamation;
    int prixRemboursement;
    int idCmd;

    Reclamation({
        required this.descriptionReclamation,
        required this.typeReclamation,
        required this.etatReclamation,
        required this.prixRemboursement,
        required this.idCmd,
    });

    factory Reclamation.fromJson(Map<String, dynamic> json) => Reclamation(
        descriptionReclamation: json["description_reclamation"],
        typeReclamation: json["type_reclamation"],
        etatReclamation: json["etat_reclamation"],
        prixRemboursement: json["prix_remboursement"],
        idCmd: json["id_cmd"],
    );

    Map<String, dynamic> toJson() => {
        "description_reclamation": descriptionReclamation,
        "type_reclamation": typeReclamation,
        "etat_reclamation": etatReclamation,
        "prix_remboursement": prixRemboursement,
        "id_cmd": idCmd,
    };
}
