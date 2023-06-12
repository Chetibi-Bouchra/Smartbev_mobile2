import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Utils/colors.dart';

class CustomSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        bottomLeft: Radius.circular(30.0),
      ),
      child: Drawer(
          child: Container(
        color: AppColors.backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.person,
                color: null,
              ),
              title: Text('Profil'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.receipt_rounded),
              title: Text('Factures'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.paid_rounded),
              title: Text('Paiement'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Se déconnecter'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      )),
    );
  }
}
