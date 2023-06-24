import 'package:smartbevmobile2/Services/reclamations_service.dart';

import '../Models/reclamation_model.dart';


class ReclamationViewModel /*extends ChangeNotifier*/ {
  //late Payment paymentInstance;
  Future<void> reclamation(Reclamation commandReclamation) async {
    await ReclamationAPI().sendReclamation(commandReclamation);
  }

}
