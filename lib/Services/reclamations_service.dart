import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartbevmobile2/Models/payment_model.dart';
import 'package:smartbevmobile2/Utils/Const.dart';

class ReclamationAPI {
  Future<void> sendReclamation(Payment paymentInstance) async {
    const apiUrl = '$paymentURI/create-payment-intent';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'amount': paymentInstance.amount,
      'currency': paymentInstance.currency,
      'paymentMethodId': paymentInstance.paymentMethodId,
      'customerId': paymentInstance.customerId,
      "seller_account_id": paymentInstance.sellerAccountId,
      "orderId": paymentInstance.orderId,
    });
    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    print(response.body);
    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
    }
  }
}
