import 'package:flutter/material.dart';

import '../../ViewModels/commande_view_model.dart';
import '../../Utils/colors.dart';
import 'filled_button.dart';

class DisplayCommande extends StatelessWidget {
  const DisplayCommande({super.key, required this.commandeViewModel});
  final CommandeViewModel commandeViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      child: Expanded(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Text(
                'Voici votre commande',
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textColor,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        commandeViewModel.commande!.imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      commandeViewModel.commande!.title,
                      style: const TextStyle(
                        fontFamily: '',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Size',
                            style: TextStyle(
                              fontFamily: '',
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(commandeViewModel.commande!.size),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontFamily: '',
                            fontSize: 33,
                            fontWeight: FontWeight.w900,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          commandeViewModel.commande!.prix,
                          style: const TextStyle(
                            fontFamily: '',
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: CustomFilledButton(
                      text: 'Confirmer',
                      onPressed: () {
                       /* Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );*/
                        //Navigator.pushNamed(context, '/paiementInfo');
                      },
                    ),
                  ),
                  // Add some spacing between the buttons
                  const SizedBox(width: 10),
                  Flexible(
                    child: CustomFilledButton(
                      text: 'Annuler',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
