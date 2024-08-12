class RegisterModel {
  final String email, password;
  final String? name, whatsappNumber, accountKind;

  const RegisterModel({
    required this.email,
    required this.password,
    this.name,
    this.whatsappNumber,
    this.accountKind,
  });
}
