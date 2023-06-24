
import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Models/facture_model.dart';
import 'package:smartbevmobile2/Services/factures_service.dart';

class FactureViewModel extends ChangeNotifier {
  List<Facture>? _facture;

  Future<void> getFactures(String idFacture) async {
    _facture = await FacturesAPI().fetchPaymentByidConsummer(idFacture);

    notifyListeners();
  }

  List<Facture>? get factures => _facture;
}
