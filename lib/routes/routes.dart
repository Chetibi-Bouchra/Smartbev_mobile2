import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Views/authentication_view.dart';
import 'package:smartbevmobile2/Views/factures_view.dart';
import '../Views/profile_view.dart';
import '../Views/scanner_start_view.dart';

import '../Views/welcome_view.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/welcome': (context) => const WelcomeView(),
    welcomePage: (context) => const WelcomeView(),
    '/paiement': (context) => const PaiementPage(title: 'Paiement'),
    paiementPage: (context) => const PaiementPage(title: 'Paiement'),
    /*'/paiementInfo': (context) => PaiementInfoPage(title: 'Paiement'),
    paiementInfoPage: (context) => PaiementInfoPage(title: 'Paiement'),*/
    '/factures': (context) => FacturesView(),
    facturesPage: (context) => FacturesView(),
    '/authentication': (context) => AuthenticationPage(),
    authentificationPage: (context) => AuthenticationPage(),
    '/profil': (context) => ProfilePage(),
    profilePage: (context) => ProfilePage(),
  };
}

const welcomePage = "welcomePage";
const paiementPage = "paiementPage";
const paiementInfoPage = "paiementInfoPage";
const facturesPage = "facturesPage";
const authentificationPage = "authentificationPage";
const profilePage = "profilePage";
