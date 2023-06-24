import 'package:flutter/material.dart';

import 'routes.dart';

launchWelcomePage(BuildContext context) {
  Navigator.pushNamed(context, welcomePage);
}

launchPaiementPage(BuildContext context) {
  Navigator.pushNamed(context, paiementPage);
}

launchPaiementInfoPage(BuildContext context) {
  Navigator.pushNamed(context, paiementInfoPage);
}

launchFacturesInfoPage(BuildContext context) {
  Navigator.pushNamed(context, facturesPage);
}

launchAuthenticationPage(BuildContext context) {
  Navigator.pushNamed(context, authentificationPage);
}

launchProfilePage(BuildContext context) {
  Navigator.pushNamed(context, profilePage);
}
