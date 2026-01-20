import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/services.dart';

class CommaFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (text.isNotEmpty &&
        text[text.length - 1] == getDefaultFormatCurrency()) {
      text = text.replaceRange(text.length - 1, text.length,
          getDefaultFormatCurrency(isDot: !CurrencyUtils.isDotCurrency));
    }

    return newValue.copyWith(
      text: text,
    );
  }
}

class CommaToDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (text.isNotEmpty && text[text.length - 1] == ',') {
      text = text.replaceRange(text.length - 1, text.length, '.');
    }

    return newValue.copyWith(
      text: text,
    );
  }
}
