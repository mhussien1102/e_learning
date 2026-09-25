class FormValidator {
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "password is required";
    } else if (value.length < 6) {
      return "Password is too short";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!value.contains("@")) {
      return "Enter the valid Email";
    } else {
      return null;
    }
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter Your name";
    } else if (value.length < 3) {
      return "Full Name must be more than 3 ";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "password is required";
    } else if (value != password) {
      return "Passwords do not match";
    } else {
      return null;
    }
  }
}
