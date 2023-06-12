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
