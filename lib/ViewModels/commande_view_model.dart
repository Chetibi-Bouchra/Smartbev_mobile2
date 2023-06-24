import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/commande_model.dart';
import '../Models/commande_model2.dart';
import '../Services/commandes_service.dart';

class CommandeViewModel extends ChangeNotifier {
  Commande? _commande;

  Future<void> fetchCommandeById(String idCommand) async {
    _commande = await CommandesAPI().fetchCommandByid(idCommand);

    notifyListeners();
  }

  CommandeQR transformQRdata(String codeQR) {
    try {


      Map<String, dynamic> data = jsonDecode(codeQR);


      // Convert the data into a List of Map entries
      List<MapEntry<String, dynamic>> dataList = data.entries.toList();

      // Convert the List of Map entries into a single Map
      Map<String, dynamic> map = Map.fromEntries(dataList);


      CommandeQR commandeTest = CommandeQR.fromJson(map);

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
