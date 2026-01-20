import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../../cores/cores_src.dart';

mixin FormatterEnum {
  List<TextInputFormatter> getFormatters(InputTextModel inputTextFormModel) {
    switch (inputTextFormModel.inputFormatters) {
      case InputFormatterEnum.digitsOnly:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(
              inputTextFormModel.maxLengthInputForm),
        ];
      case InputFormatterEnum.taxCode:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
          MaskedInputFormatter('##########-###')
        ];
      case InputFormatterEnum.textOnly:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-_\.]')),
        ];
      case InputFormatterEnum.currency:
        return [
          NumericTextFormatter(),
        ];

      case InputFormatterEnum.negativeNumber:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
        ];

      case InputFormatterEnum.decimalNumber:
        return [
          CommaFormatter(),
          FilteringTextInputFormatter.allow(RegExp(
              '[0-9${getDefaultFormatCurrency(isDot: !CurrencyUtils.isDotCurrency)}]')),
        ];

      case InputFormatterEnum.identity:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
          MaskedInputFormatter('############')
        ];
      case InputFormatterEnum.phoneNumber:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
          MaskedInputFormatter('##############')
        ];
      case InputFormatterEnum.password:
        return [
          FilteringTextInputFormatter.deny(RegExp(r'( )')),
        ];
      default:
        return [
          LengthLimitingTextFieldFormatterFixed(
              inputTextFormModel.maxLengthInputForm)
        ];
    }
  }
}
