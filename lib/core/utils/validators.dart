import 'package:email_validator/email_validator.dart';
import '../constants/app_constants.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.emailRequired;
    }
    if (!EmailValidator.validate(value)) {
      return AppConstants.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.passwordRequired;
    }
    if (value.length < 6) {
      return AppConstants.passwordTooShort;
    }
    return null;
  }
}
