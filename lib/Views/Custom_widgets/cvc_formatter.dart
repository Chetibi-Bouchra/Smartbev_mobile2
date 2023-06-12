import 'package:flutter/services.dart';

class CvcFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-digit characters from the new value
    String cleanedValue = newValue.text.replaceAll(RegExp(r'\D+'), '');

    // Get the length of the cleaned value
    int length = cleanedValue.length;

    // If the length is greater than 3, truncate it to 3
    if (length > 3) {
      cleanedValue = cleanedValue.substring(0, 3);
      length = 3;
    }

    // Create a new buffer for the formatted value
    StringBuffer formattedValue = new StringBuffer();

    // Append the digits to the buffer, separated by spaces
    for (int i = 0; i < length; i++) {
      formattedValue.write(cleanedValue[i]);
    }

    // Update the new value with the formatted text and caret position
    return newValue.copyWith(
      text: formattedValue.toString(),
      selection: new TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
