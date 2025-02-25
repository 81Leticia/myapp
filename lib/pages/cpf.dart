import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 11) {
      text = text.substring(0, 11);
    }

    if (text.length >= 9) {
      text =
      '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6, 9)}-${text.substring(9)}';
    } else if (text.length >= 6) {
      text =
      '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6)}';
    } else if (text.length >= 3) {
      text = '${text.substring(0, 3)}.${text.substring(3)}';
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
