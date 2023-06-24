

import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Models/card_model.dart';
import 'package:smartbevmobile2/Models/payment_method_model.dart';
import 'package:smartbevmobile2/Services/stripe_service.dart';
import 'package:smartbevmobile2/ViewModels/commande_view_model.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/card_number_formatter.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/cvc_formatter.dart';

import 'package:smartbevmobile2/Views/Custom_widgets/payment_success_dialog.dart';

import '../../Models/payment_model.dart';
import '../../ViewModels/paiement_view_model.dart';
import '../scanner_start_view.dart';

import 'filled_button.dart';
import 'filled_text.dart';

//import './Custom_widgets/filled_button.dart';
//import './colors.dart';

class PaiementWidget extends StatefulWidget {
  final Payment? payment;
  PaiementWidget({Key? key, required this.payment}) : super(key: key);

  @override
  _PaiementWidgetState createState() => _PaiementWidgetState();
}

class _PaiementWidgetState extends State<PaiementWidget> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController expirationMonthController =
      TextEditingController();
  final TextEditingController expirationYearController =
      TextEditingController();

  bool _isLoading = false;
  bool _showDialog = false;

  Future<void> _onPress() async {
    setState(() {
      _isLoading = true;
    });
    InfoCard cardInfo = InfoCard(
        number: cardNumberController.text,
        expMonth: expirationMonthController.text,
        expYear: expirationYearController.text,
        cvc: cvcController.text);
    PaymentMethodObject paymentMeth =
        await StripeService().createPayMethod(card: cardInfo);



    Payment payment = Payment(
        amount: widget.payment!.amount * 100,
        currency: widget.payment!.currency,
        paymentMethodId: paymentMeth.id,
        customerId: widget.payment!.customerId,
        sellerAccountId: widget.payment!.sellerAccountId,
        orderId: widget.payment!.orderId);

    await PaymentViewModel().payCommand(payment);

    setState(() {
      _isLoading = false;
      _showDialog = true;
    });

    showDialog( 
      context: context,
      builder: (BuildContext context) => PaymentSuccessDialog(id : payment.orderId ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.fromLTRB(16, 4, 16, 64),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //image
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/clientInfo.png',
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(height: 32),
                              Flexible(
                                child: CustomFilledText(
                                  label: 'Numéro de la carte crédit',
                                  controller: cardNumberController,
                                  formatter: CardNumberFormatter(),
                                  widthProperty: 500,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                child: CustomFilledText(
                                  label: 'CVC',
                                  controller: cvcController,
                                  formatter: CvcFormatter(),
                                  widthProperty: 50,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(height: 32),
                              Flexible(
                                child: CustomFilledText(
                                  label: 'Expiration month',
                                  controller: expirationMonthController,
                                  formatter: CardNumberFormatter(),
                                  widthProperty: 100,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                child: CustomFilledText(
                                  label: 'Expiration year',
                                  controller: expirationYearController,
                                  formatter: CardNumberFormatter(),
                                  widthProperty: 100,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )))),

              const SizedBox(height: 4),

              _isLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      children: [
                        Flexible(
                          child: CustomFilledButton(
                            text: 'Confirmer',
                            onPressed: _onPress,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: CustomFilledButton(
                            text: 'Annuler',
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PaiementPage(
                                          title: 'Paiement',
                                        )),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ],
          )),
    );
  }
}
