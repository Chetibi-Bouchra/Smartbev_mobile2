import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbevmobile2/Models/card_model.dart';
import 'package:smartbevmobile2/Models/payment_method_model.dart';
import 'package:smartbevmobile2/Services/stripe_service.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/card_number_formatter.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/cvc_formatter.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../Models/payment_model.dart';
import '../ViewModels/commande_view_model.dart';
import '../ViewModels/paiement_view_model.dart';
import 'Custom_widgets/app_bar.dart';
import 'Custom_widgets/filled_button.dart';
import 'Custom_widgets/filled_text.dart';
import 'Custom_widgets/side_menu.dart';
import 'commande_view.dart';

//import './Custom_widgets/filled_button.dart';
//import './colors.dart';

class PaiementInfoPage extends StatelessWidget {
  PaiementInfoPage({Key? key, required this.title}) : super(key: key);

  final String title;
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController expirationMonthController =
      TextEditingController();
  final TextEditingController expirationYearController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Paiement',
        ),
        endDrawer: CustomSideMenu(),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
              color: Colors.cyan,
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
                                      widthProperty: 400,
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
                  Row(
                    children: [
                      Flexible(
                        child: CustomFilledButton(
                          text: 'Confirmer',
                          onPressed: () async {
                            InfoCard cardInfo = InfoCard(
                                number: cardNumberController.text,
                                expMonth: expirationMonthController.text,
                                expYear: expirationYearController.text,
                                cvc: cvcController.text);
                            PaymentMethodObject paymentMeth =
                                await StripeService()
                                    .createPayMethod(card: cardInfo);
                            print(paymentMeth.id);
                            /*print(cvcController.text);*/

                            Payment payment = Payment(
                                amount: 70000,
                                currency: "usd",
                                paymentMethodId: paymentMeth.id,
                                customerId: "cus_123456789",
                                sellerAccountId: "acct_1Mtq1gH6MZlaUz2j",
                                orderId: "88888456");
                            PaymentViewModel().payCommand(payment);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: CustomFilledButton(
                          text: 'Annuler',
                          onPressed: () async {
                            final commandeViewModel =
                                Provider.of<CommandeViewModel>(context,
                                    listen: false);
                            commandeViewModel.setCommande(null);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommandView()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
