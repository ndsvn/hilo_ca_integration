import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:get/get_utils/src/extensions/export.dart';

bool isPasswordValidate({
  required String password,
  required int minLength,
  int maxLength = 0,
}) {
  if (password.isStringNotEmpty) {
    // Trường hợp có yêu cầu nhập tối đa vào mật khẩu.
    if (maxLength > 0) {
      if (password.length >= minLength && password.length <= maxLength) {
        return true;
      }
    } else {
      // Trường hợp chỉ yêu cầu số ký tự tối thiểu nhập vào của mật khẩu.
      if (password.length >= minLength) {
        return true;
      }
    }
  }
  return false;
}

String? validatePass(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.login_passwordEmpty.tr;
  }

  return null;
}

String? validateRepass(String? text, String pass, {String? textValidate}) {
  if (text == null || text.isEmpty) {
    return textValidate ?? LocaleKeys.eCert_changePass_validatePassword.tr;
  } else if (text != pass) {
    return LocaleKeys.eCert_changePass_validateReNewPassword.tr;
  }

  return null;
}

extension StringUtils on String? {
  bool get isStringNotEmpty => this != null && this!.trim().isNotEmpty;

  bool get isStringEmpty => this != null && this!.trim().isEmpty;

  bool get isNullOrEmpty => this == null || (this?.trim().isEmpty ?? true);
}

bool isListNotEmpty(List<dynamic>? list) => list != null && list.isNotEmpty;

String convertDoubleToStringSmart(double? value) {
  return '${value?.toInt() == value ? value?.toInt() : value}';
}

double convertRounding(double money) {
  return double.parse(money.toStringAsFixed(2));
}

// bool isEmail(String? value) {
//   RegExp email = RegExp(
//       r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

//   if (value == null) return false;
//   if (value.trim().isEmpty || !email.hasMatch(value.toLowerCase())) {
//     return false;
//   }

//   return true;
// }

bool isEmail(String? value) {
  if (value == null) return false;
  if (value.trim().isEmpty) {
    return false;
  }
  final regex = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+$');
  return regex.hasMatch(value);
}

bool isPhoneValidate({required String? value}) {
  if (value == null) return false;
  if (value.trim().isEmpty || !RegExp(r'\d{10,14}').hasMatch(value)) {
    return false;
  }

  return true;
}

bool isIdentityCard({required String? value}) {
  if (value == null) return false;
  if (value.trim().isEmpty || !RegExp(r'\d{9,12}').hasMatch(value)) {
    return false;
  }
  return true;
}

bool isTaxCode({required String? taxCode}) {
  if (taxCode == null) return false;
  if (taxCode.length < 10 || taxCode.length > 13) return false;
  return true;
}

bool isValidatePasswordRegexTextAndNumber(String? password) {
  if (password == null) return false;
  // Sử dụng regular expression để kiểm tra mật khẩu
  RegExp regex =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*])(?=.*[a-zA-Z])');
  return regex.hasMatch(password);
}
