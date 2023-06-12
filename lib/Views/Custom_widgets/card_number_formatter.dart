import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    String newText = '';

    // Add space after every 4 digits
    for (int i = 0; i < text.length; i++) {
      newText += text[i];
    }

    // Remove last character if it is a space
    if (newText.isNotEmpty && newText[newText.length - 1] == ' ') {
      newText = newText.substring(0, newText.length - 1);
    }

    // Prevent adding more than 19 digits
    if (newText.length > 16) {
      newText = newText.substring(0, 16);
    }

    // Create new value and selection
    TextEditingValue formattedValue = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );

    return formattedValue;
  }
}
