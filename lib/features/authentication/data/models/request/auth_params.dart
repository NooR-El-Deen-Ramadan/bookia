class AuthParams {
  String? name;
  String? email;
  String? password;
  // ignore: non_constant_identifier_names
  String? password_confirmation;

  AuthParams({
    this.name,
    this.email,
    this.password,
    this.password_confirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
    };
  }
}
