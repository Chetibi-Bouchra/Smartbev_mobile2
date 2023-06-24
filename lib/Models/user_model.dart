// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String prenomConsommateur;
    String nomConsommateur;
    String sexeConsommateur;
    String pathConsommateur;
    String mailConsommateur;
    String passwordConsommateur;
    String paymentMethodeId;

    User({
        required this.prenomConsommateur,
        required this.nomConsommateur,
        required this.sexeConsommateur,
        required this.pathConsommateur,
        required this.mailConsommateur,
        required this.passwordConsommateur,
        required this.paymentMethodeId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        prenomConsommateur: json["prenom_consommateur"],
        nomConsommateur: json["nom_consommateur"],
        sexeConsommateur: json["sexe_consommateur"],
        pathConsommateur: json["path_consommateur"],
        mailConsommateur: json["mail_consommateur"],
        passwordConsommateur: json["password_consommateur"],
        paymentMethodeId: json["payment_methode_id"],
    );

    Map<String, dynamic> toJson() => {
        "prenom_consommateur": prenomConsommateur,
        "nom_consommateur": nomConsommateur,
        "sexe_consommateur": sexeConsommateur,
        "path_consommateur": pathConsommateur,
        "mail_consommateur": mailConsommateur,
        "password_consommateur": passwordConsommateur,
        "payment_methode_id": paymentMethodeId,
    };
}
