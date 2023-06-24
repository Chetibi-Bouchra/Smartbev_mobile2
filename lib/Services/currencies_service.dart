import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartbevmobile2/Models/currency_model.dart';
import 'package:smartbevmobile2/Utils/Const.dart';

class CurrenciesAPI {
  Future<Currency> fetchCurrencies() async {
    try {
      String url = getCurrencies;

      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Convert the data into a List of Map entries
        List<MapEntry<String, dynamic>> dataList = data.entries.toList();

        // Convert the List of Map entries into a single Map
        Map<String, dynamic> map = Map.fromEntries(dataList);

        Currency currencies = Currency.fromJson(map);

        return currencies;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    throw Exception('Failed to fetch currencies');
  }

  Future<String> convertCurrency(
      String oldCurrency, String newCurrency, String amount) async {
    try {
      final url =
          'https://api.exchangerate.host/convert?from=$oldCurrency&to=$newCurrency&amount=$amount';

      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = jsonDecode(response.body)["result"].toString();
        double prix = double.parse(data);
        String stringPrix = prix.toStringAsFixed(2);

        return stringPrix;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    throw Exception('Failed to convert currency');
  }
}
