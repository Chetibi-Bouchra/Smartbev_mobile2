import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Utils/colors.dart';
import 'package:smartbevmobile2/Views/welcome_view.dart';

import '../../Services/secure_storage.dart';

class CustomSideMenu extends StatelessWidget {
  final SecureStorage _secureStorage = SecureStorage();

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
          child: Center(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: null,
                  ),
                  title: const Text('Profil'),
                  onTap: () => Navigator.pushNamed(context, '/profil'),
                ),
                ListTile(
                  leading: const Icon(Icons.receipt_rounded),
                  title: const Text('Factures'),
                  onTap: () => Navigator.pushNamed(context, '/profil'),
                ),
                ListTile(
                  leading: const Icon(Icons.paid_rounded),
                  title: const Text('Paiement'),
                  onTap: () => Navigator.pushNamed(context, '/paiement'),
                ),
                FutureBuilder<String?>(
                  future: _secureStorage.getId(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Se déconnecter'),
                        onTap: () async {
                          await _secureStorage.logout();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WelcomeView()),
                          );
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
