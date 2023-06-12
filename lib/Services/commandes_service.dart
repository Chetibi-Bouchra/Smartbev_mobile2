import 'dart:convert';

import 'package:smartbevmobile2/Models/commande_model2.dart';

import 'package:http/http.dart' as http;

class CommandesAPI {
  Future<Commande> fetchCommandByid(String idCommand) async {
    try {
      //String url = 'http://192.168.1.5:8000/commandes/1';
      String url = 'http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=13328';

      http.Response response =
          await http.get(Uri.parse(url)); // Use a non-null assertion operator

      if (response.statusCode == 200) {
        //List<dynamic> data = jsonDecode(response.body);
        List<dynamic> data = jsonDecode(response.body)['drinks'];
        print(jsonDecode(response.body));
        Map<String, dynamic> map =
            data.fold({}, (acc, cur) => acc..addAll(Map.from(cur)));
        Commande commandeTest = Commande.fromJSON(map);
        print(commandeTest);
        return commandeTest;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    throw Exception(
        'Failed to fetch command'); // Use a throw statement to indicate failure
  }
}
