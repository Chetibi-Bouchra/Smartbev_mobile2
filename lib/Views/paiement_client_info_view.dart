import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/paiement_widget.dart';

import '../Models/payment_model.dart';

import 'Custom_widgets/app_bar.dart';

import 'Custom_widgets/side_menu.dart';




class PaiementInfoPage extends StatelessWidget {
  PaiementInfoPage({Key? key, required this.payment}) : super(key: key);

  final Payment? payment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: CustomAppBar(
          title: 'Paiement',
        ),
        endDrawer: CustomSideMenu(),
        resizeToAvoidBottomInset: false,
        body: PaiementWidget(payment: payment));
  }
}
