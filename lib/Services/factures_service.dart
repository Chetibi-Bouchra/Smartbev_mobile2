import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/facture_model.dart';

class FacturesAPI {
  Future<List<Facture>> fetchPaymentByidConsummer(String idConsommateur) async {
    try {
      String url = 'https://cuppa.onrender.com/payment/get-payments/1';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Facture> factures = factureFromJson(jsonEncode(data));
        return factures;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to fetch command');
  }
}
