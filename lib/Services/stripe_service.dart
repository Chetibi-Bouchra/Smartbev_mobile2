import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartbevmobile2/Models/card_model.dart';

import '../Models/payment_method_model.dart';
import '../Utils/Const.dart';

class StripeService {
  Future<PaymentMethodObject> createPayMethod({required InfoCard card}) async {
    const url = stripeAPI;
    const apiSecretKey = secretKey;

    final headers = {
      'Authorization': 'Bearer $apiSecretKey',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final body = {
      'type': 'card',
      'card[number]': card.number.toString(),
      'card[exp_month]': card.expMonth.toString(),
      'card[exp_year]': card.expYear.toString(),
      'card[cvc]': card.cvc.toString(),
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      print(jsonDecode(response.body));
      PaymentMethodObject payment = PaymentMethodObject.fromJson(responseData);
      
      return payment;
    } else {
      final errorResponse = json.decode(response.body);
      final errorMessage = errorResponse['error']['message'];
      throw Exception(errorMessage); // Throw an exception if an error occurs
    }
  }
}
