import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Models/card_model.dart';
import 'package:smartbevmobile2/Models/payment_method_model.dart';
import 'package:smartbevmobile2/Services/stripe_service.dart';
import 'package:smartbevmobile2/ViewModels/commande_view_model.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/card_number_formatter.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/cvc_formatter.dart';
import 'package:smartbevmobile2/Utils/colors.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../../Models/payment_model.dart';
import '../../ViewModels/paiement_view_model.dart';
import '../scanner_startt_view.dart';
import 'filled_button.dart';
import 'filled_text.dart';

//import './Custom_widgets/filled_button.dart';
//import './colors.dart';

class PaiementWidget extends StatefulWidget {
  final String text;
  PaiementWidget({Key? key, required this.text}) : super(key: key);

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
    CommandeViewModel commandeViewModel = CommandeViewModel();

    //final jsonData = commandeViewModel.transformQRdata(text);
    Map<String, dynamic> json = jsonDecode(widget.text);
    print(json);
    InfoCard cardInfo = InfoCard(
        number: cardNumberController.text,
        expMonth: expirationMonthController.text,
        expYear: expirationYearController.text,
        cvc: cvcController.text);
    PaymentMethodObject paymentMeth =
        await StripeService().createPayMethod(card: cardInfo);
    print(paymentMeth.id);
    /*print(cvcController.text);*/

    setState(() {
      _isLoading = false;
      //_showDialog = true;
    });

    print(_isLoading);
    Payment payment = Payment(
        amount: 300000,
        currency: "usd",
        paymentMethodId: paymentMeth.id,
        customerId: "cus_123456789",
        sellerAccountId: "acct_1Mtq1gH6MZlaUz2j",
        //orderId: json['id_cmd'].toString());
        orderId: "20");
    PaymentViewModel().payCommand(payment);
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
                              SizedBox(height: 32),
                              Flexible(
                                child: CustomFilledText(
                                  label: 'Numéro de la carte crédit',
                                  controller: cardNumberController,
                                  formatter: CardNumberFormatter(),
                                  widthProperty: 500,
                                ),
                              ),
                              SizedBox(width: 16),
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
                              SizedBox(height: 32),
                              Flexible(
                                child: CustomFilledText(
                                  label: 'Expiration month',
                                  controller: expirationMonthController,
                                  formatter: CardNumberFormatter(),
                                  widthProperty: 100,
                                ),
                              ),
                              SizedBox(width: 16),
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
              Center(
                child: _showDialog
                    ? AlertDialog(
                        backgroundColor: AppColors.backgroundColor,
                        content: Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                "assets/images/success.png",
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(height: 16),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 25, right: 25),
                                child: Text(
                                  "Votre paiement a été effectué avec succès",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Ok',
                              style: TextStyle(color: AppColors.textColor),
                            ),
                            onPressed: () {
                              //Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                    : null,
              ),
              _isLoading
                  ? CircularProgressIndicator()
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
