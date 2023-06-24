import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartbevmobile2/Utils/Const.dart';

import '../Models/user_model.dart';

class UserAPI {
  Future<int> createUser(User userData) async {
    const apiUrl = createConsommateurAccount;
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'prenom_consommateur': userData.prenomConsommateur,
      'nom_consommateur': userData.nomConsommateur,
      'sexe_consommateur': userData.sexeConsommateur,
      'path_consommateur': userData.pathConsommateur,
      'mail_consommateur': userData.mailConsommateur,
      'password_consommateur': userData.passwordConsommateur,
      'payment_methode_id' : userData.paymentMethodeId
    });

    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final int idConsommateur = responseData['data']['id_consommateur'];

      return idConsommateur;
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
      return -1;
    }
  }
}

