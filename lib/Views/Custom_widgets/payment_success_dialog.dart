import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Utils/colors.dart';
import 'package:smartbevmobile2/Views/Custom_widgets/reclamation_popup.dart';

class PaymentSuccessDialog extends StatelessWidget {
  final String id;

  PaymentSuccessDialog({required this.id});
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      content: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/success.png",
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: const Text(
                "Votre paiement a été effectué avec succès",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            'Ok',
            style: TextStyle(color: AppColors.textColor),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: const Text(
            '',
            style: TextStyle(color: AppColors.textColor),
          ),
          onPressed: () {},
        ),
        TextButton(
          child: const Text(
            'Envoyer un avis',
            style: TextStyle(color: AppColors.textColor),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ReclamationPage(id: id,)),
            );
          },
        ),
      ],
    );
  }
}
