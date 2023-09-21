class Validate {
  static fldempty(String? v, String fldname) {
    if (v == null) {
      return "Please Enter Your $fldname";
    } else if (v.isEmpty) {
      return "Please Enter Your $fldname";
    } else {
      return null;
    }
  }

  static fldisValidEmail(String v, String fldname) {
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(v)) {
      return 'Invalid Email ID';
    }
    return null;
  }

  static String? isPasswordValid(String password) {
    // Define regular expressions for each criteria
    final uppercaseRegex = RegExp(r'[A-Z]');
    final lowercaseRegex = RegExp(r'[a-z]');
    final digitRegex = RegExp(r'[0-9]');
    final specialCharacterRegex = RegExp(r'[@#\$]');

    // Check password length
    if (password.length < 8) {
      return 'Password min 8  characters';
    }

    // Check for uppercase, lowercase, digit, and special character
    if (!uppercaseRegex.hasMatch(password)) {
      return 'Add at least one uppercase letter';
    }
    if (!lowercaseRegex.hasMatch(password)) {
      return 'Add at least one lowercase letter';
    }
    if (!digitRegex.hasMatch(password)) {
      return 'Add at least one digit';
    }
    if (!specialCharacterRegex.hasMatch(password)) {
      return 'Add special character (@, #, or \$)';
    }

    // Password meets all criteria
    return null; // Return null if the password is valid
  }
}
