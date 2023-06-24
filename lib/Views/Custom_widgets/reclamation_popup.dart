import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Models/reclamation_model.dart';
import 'package:smartbevmobile2/Utils/colors.dart';
import 'package:smartbevmobile2/ViewModels/reclamation_view_model.dart';


class ReclamationPage extends StatefulWidget {
  final String id;

  ReclamationPage({required this.id});

  @override
  _ReclamationPageState createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  bool showTextInput = false;
  String selectedRadioValue = '';
  final TextEditingController textController = TextEditingController();

  bool _isLoading = false;
  bool _showDialog = false;

  Future<void> _onPress() async {
    setState(() {
      _isLoading = true;
    });

    ReclamationViewModel reclamationViewModel = ReclamationViewModel();

    setState(() {
      _isLoading = false;
      //_showDialog = true;
    });


    String descriptionReclamation = '';
    if (textController.text.isEmpty) {
      descriptionReclamation =
          'Boisson non délivré'; // Update with desired text
    } else {
      descriptionReclamation = textController.text;
    }

    Reclamation reclamation = Reclamation(
      descriptionReclamation: descriptionReclamation,
      typeReclamation: selectedRadioValue,
      etatReclamation: "Pending",
      prixRemboursement: 0,
      idCmd: int.parse(widget.id),
    );

    await reclamationViewModel.reclamation(reclamation);

    /*Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeView()),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votre avis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Title(
                color: AppColors.textColor,
                child: const Text(
                  'Faites-nous part de votre expérience !',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            RadioListTile<String>(
              title: const Text('Commande non reçue'),
              value: 'Commande non reçue',
              groupValue: selectedRadioValue,
              onChanged: (value) {
                setState(() {
                  selectedRadioValue = value!;
                  showTextInput = false;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Commande non complète'),
              value: 'Commande non complète',
              groupValue: selectedRadioValue,
              onChanged: (value) {
                setState(() {
                  selectedRadioValue = value!;
                  showTextInput = false;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Commande insatisfaisante'),
              value: 'Commande insatisfaisante',
              groupValue: selectedRadioValue,
              onChanged: (value) {
                setState(() {
                  selectedRadioValue = value!;
                  showTextInput = true;
                });
              },
            ),
            if (showTextInput)
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Entrer votre texte',
                  border: OutlineInputBorder(),
                ),
              ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton(
                onPressed: _onPress,
                child: const Text(
                  'Envoyer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
