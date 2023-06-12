import 'package:flutter/material.dart';
import '../Views/scanner_startt_view.dart';
import '../Views/paiement_client_info_view.dart';
import '../Views/welcome_view.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/welcome': (context) => const WelcomeView(),
    welcomePage: (context) => const WelcomeView(),

    '/paiement': (context) => const PaiementPage(title: 'Paiement'),
    paiementPage: (context) => const PaiementPage(title: 'Paiement'),

    '/paiementInfo': (context) => PaiementInfoPage(title: 'Paiement'),
    paiementInfoPage: (context) => PaiementInfoPage(title: 'Paiement'),
  };
}


const welcomePage = "welcomePage";
const paiementPage = "paiementPage";
const paiementInfoPage = "paiementInfoPage";