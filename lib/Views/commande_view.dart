import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbevmobile2/ViewModels/commande_view_model.dart';
import 'package:smartbevmobile2/Views/paiement_client_info_view.dart';

import 'Custom_widgets/app_bar.dart';
import 'Custom_widgets/side_menu.dart';

class CommandView extends StatefulWidget {
  @override
  _CommandViewState createState() => _CommandViewState();
}

class _CommandViewState extends State<CommandView> {
  String _text = '';

  void _updateText(String text) {
    setState(() {
      _text = text;
    });
  }

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
        margin: const EdgeInsets.fromLTRB(16, 4, 16, 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<CommandeViewModel>(
                builder: (context, commandeViewModel, child) {
                  if (_text == '') {
                    return ElevatedButton(
                      onPressed: () {
                        Provider.of<CommandeViewModel>(context, listen: false)
                            .fetchCommandebById("bloody mary");
                      },
                      child: Text('Change Data'),
                    );
                    /*QRViewExample(
                            key: GlobalKey(), onUpdateText: _updateText);*/
                  }
                  return /*DisplayCommande(commandeViewModel: commandeViewModel);*/
                      PaiementInfoPage(
                    title: 'Paiement',
                  );
                },
              ),
              /*child: _text.isEmpty
                  ? QRViewExample(key: GlobalKey(), onUpdateText: _updateText)
                  : PaiementWidget(text: _text),*/
            ),

            /*ElevatedButton(
              onPressed: () {
                Provider.of<CommandeViewModel>(context, listen: false)
                    .fetchCommandebById("11007");
              },
              child: Text('Change Data'),
            ),*/
          ],
        ),
      )),
    );
  }
}
