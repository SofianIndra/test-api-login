class SignInFormModel {
  final String? username;
  final String? password;

  SignInFormModel({
    this.username,
    this.password,
  });

  factory SignInFormModel.fromJson(Map<String, dynamic> json) =>
      SignInFormModel(
        username: json['username'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
