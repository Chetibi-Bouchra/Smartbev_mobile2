import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartbevmobile2/Models/payment_model.dart';
import 'package:smartbevmobile2/Utils/Const.dart';

class PaymentAPI {
  Future<void> sendPayment(Payment paymentInstance) async {
    const apiUrl = createPaymentIntent;
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

    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
    }
  }
}
