import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartbevmobile2/Utils/Const.dart';

import '../Models/reclamation_model.dart';

class ReclamationAPI {
  Future<void> sendReclamation(Reclamation commandReclamation) async {
    const apiUrl = createReclamation;
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'description_reclamation': commandReclamation.descriptionReclamation,
      'type_reclamation': commandReclamation.typeReclamation,
      'etat_reclamation': commandReclamation.etatReclamation,
      'prix_remboursement': commandReclamation.prixRemboursement,
      "id_cmd": commandReclamation.idCmd,
    });
    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 201) {
      print('Data sent successfully');
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
    }
  }
}
