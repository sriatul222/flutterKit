class InputValidation {
  //validates any input field where format is not required
  static String? validateEmptyString(String value, String error) {
    if (value.isEmpty || value.length > 30 || value.length < 3) {
      return error;
    } else {
      return null;
    }
  }

  static String? reasonValidateEmptyString(String value, String error) {
    if (value.isEmpty || value.length > 500 || value.length < 14) {
      return error;
    } else {
      return null;
    }
  }

  static String? subjectReasonValidateEmptyString(String value, String error) {
    if (value.isEmpty || value.length > 50 || value.length < 5) {
      return error;
    } else {
      return null;
    }
  }

  //validates email
  static String? validateEmail(String value, String error) {
    if (value.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return error;
    } else {
      return null;
    }
  }

  //validates phone number
  static String? validatePhoneNumber(String value, String error) {
    if (value.isEmpty || value.length < 10) {
      return error;
    } else {
      return null;
    }
  }

  //validates password
  static String? validatePassword(String value, String error) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return error;
    } else if (value.length < 6 || !regExp.hasMatch(value)) {
      return error;
    } else {
      return null;
    }
  }

  //validates confirm password
  static String? validateConfirmPassword(
      String? password, String value, String error) {
    if (value.isEmpty) {
      return error;
    } else if (password == null || password != value) {
      return error;
    } else {
      return null;
    }
  }
}
