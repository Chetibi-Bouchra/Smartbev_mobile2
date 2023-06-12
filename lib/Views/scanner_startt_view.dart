import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../ViewModels/commande_view_model.dart';
import 'Custom_widgets/app_bar.dart';
import 'Custom_widgets/filled_button.dart';
import 'Custom_widgets/side_menu.dart';
import '../Utils/colors.dart';
import 'commande_view.dart';
//import './Custom_widgets/filled_button.dart';
//import './colors.dart';

class PaiementPage extends StatelessWidget {
  const PaiementPage({super.key, required String title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Paiement',
        ),
        endDrawer: CustomSideMenu(),
        body: Center(
          child: Container(
              margin: const EdgeInsets.fromLTRB(16, 4, 16, 64),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 10.0, top: 10.0, left: 50.0, right: 50.0),
                      child: const SizedBox(
                        height: 80.0,
                        child: Text(
                          'Scannez le code affiché dans le distributeur et obtenez votre boisson !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      'assets/images/scann.png',
                    ),
                  ),
                  CustomFilledButton(
                    text: 'Commencer le scann',
                    onPressed: () async {
                      final commandeViewModel = Provider.of<CommandeViewModel>(
                          context,
                          listen: false);
                      commandeViewModel.setCommande(null);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CommandView()),
                      );
                    },
                  ),
                ],
              )),
        ));
  }
}
