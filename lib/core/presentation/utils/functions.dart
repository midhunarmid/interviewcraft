class UtilFunctions {
  static bool isEmailValid(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool isPasswordValid(String password, [int minLength = 6]) {
    if (password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    //bool hasSpecialCharacters = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        // hasSpecialCharacters &
        hasMinLength;
  }

  static bool isNameValid(String name, [int minLength = 2]) {
    if (name.isEmpty) {
      return false;
    }

    bool hasDigits = name.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters = name.contains(RegExp(r'[!@#$%^&*(),?":{}|<>]'));
    bool hasMinLength = name.length > minLength;

    return !(hasDigits || hasSpecialCharacters) & hasMinLength;
  }
}
