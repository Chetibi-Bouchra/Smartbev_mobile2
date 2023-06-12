import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smartbevmobile2/Models/payment_model.dart';

import 'package:smartbevmobile2/Services/payments_service.dart';


class PaymentViewModel /*extends ChangeNotifier*/ {
  //late Payment paymentInstance;
  Future<void> payCommand(Payment paymentInstance) async {
    await PaymentAPI().sendPayment(paymentInstance);
  }

  Future<void> createPaymentMethod() async {
    final tokenId = await Stripe.instance.createTokenForCVCUpdate("123");
  }

}
