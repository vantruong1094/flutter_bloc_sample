
class Validations {
  static bool isValidEmail(String email) {
    return email != null && email.length > 6 && email.contains("@");
  }

  static bool isValidPassword(String password) {
    return password != null && password.length > 6;
  }
}