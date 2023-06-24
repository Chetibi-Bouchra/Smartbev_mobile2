import 'package:flutter/material.dart';

import 'package:smartbevmobile2/ViewModels/facture_view_model.dart';


import 'Custom_widgets/app_bar.dart';
import 'Custom_widgets/factures.dart';
import 'Custom_widgets/side_menu.dart';

class FacturesView extends StatefulWidget {
  @override
  _FacturesViewState createState() => _FacturesViewState();
}

class _FacturesViewState extends State<FacturesView> {
  String _text = '';

  void _updateText(String text) {
    setState(() {
      _text = text;
    });
  }

  @override
  void initState() {
    super.initState();

    FactureViewModel().getFactures("idFacture");
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> itemList = [
      {'title': 'Title 1', 'description': 'Description 1'},
      {'title': 'Title 2', 'description': 'Description 2'},

    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Factures',
      ),
      endDrawer: CustomSideMenu(),
      resizeToAvoidBottomInset: false,
      body: CardList(items: itemList),
    );
  }
}
