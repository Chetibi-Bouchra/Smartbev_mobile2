import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Utils/colors.dart';

class ReclamationPopup extends StatefulWidget {
  @override
  _ReclamationPopupState createState() => _ReclamationPopupState();
}

class _ReclamationPopupState extends State<ReclamationPopup> {
  bool showTextInput = false;
  String selectedRadioValue = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor, // Set the background color to pink
      title: Text('Faites-nous part de votre expérience'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile<String>(
            title: Text('Option 1'),
            value: 'option1',
            groupValue: selectedRadioValue,
            onChanged: (value) {
              setState(() {
                selectedRadioValue = value!;
                showTextInput = false;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Option 2'),
            value: 'option2',
            groupValue: selectedRadioValue,
            onChanged: (value) {
              setState(() {
                selectedRadioValue = value!;
                showTextInput = false;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Option 3'),
            value: 'option3',
            groupValue: selectedRadioValue,
            onChanged: (value) {
              setState(() {
                selectedRadioValue = value!;
                showTextInput = true;
              });
            },
          ),
          if (showTextInput) TextField(
            decoration: InputDecoration(
              labelText: 'Enter your text',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Send'),
        ),
      ],
    );
  }
}
