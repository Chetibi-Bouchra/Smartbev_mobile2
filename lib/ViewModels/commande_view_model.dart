import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/commande_model2.dart';
import '../Services/commandes_service.dart';

class CommandeViewModel extends ChangeNotifier {
  Commande? _commande;

  Future<void> fetchCommandebById(String idCommand) async {
    _commande = await CommandesAPI().fetchCommandByid(idCommand);

    notifyListeners();
  }

  Future<Commande> transformQRdata(String codeQR) async {
    try {
      final qrData = jsonDecode(codeQR);
      print(jsonDecode(qrData));

      Commande commandeTest = Commande.fromJSON(qrData);
      print(commandeTest);
      return commandeTest;
    } catch (e) {
      print(e);
    }
    throw Exception(
        'Failed to transform Data'); // Use a throw statement to indicate failure
  }

  Commande? get commande => _commande;
  void setCommande(Commande? value) {
    _commande = value;
  }
}
