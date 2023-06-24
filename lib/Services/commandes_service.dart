import 'dart:convert';

import 'package:smartbevmobile2/Models/commande_model.dart';

import 'package:http/http.dart' as http;

import '../Utils/Const.dart';

class CommandesAPI {
  Future<Commande> fetchCommandByid(String idCommand) async {
    try {
      String url = '$commandesEntry/$idCommand';
      

      http.Response response =
          await http.get(Uri.parse(url)); // Use a non-null assertion operator

      if (response.statusCode == 201) {
        
        Map<String, dynamic> data = jsonDecode(response.body);

        // Convert the data into a List of Map entries
        List<MapEntry<String, dynamic>> dataList = data.entries.toList();

        // Convert the List of Map entries into a single Map
        Map<String, dynamic> map = Map.fromEntries(dataList);

        
        Commande commandeTest = Commande.fromJson(map);
        return commandeTest;
      } else {
        
      }
    } catch (e) {
      print(e);
    }
    throw Exception(
        'Failed to fetch command'); // Use a throw statement to indicate failure
  }


}
