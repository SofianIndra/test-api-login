class ChangePasswordModel {
  final String? password;
  final String? newPassword;

  ChangePasswordModel({
    this.password,
    this.newPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        password: json['password'],
        newPassword: json['new_password'],
      );

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'new_password': newPassword,
    };
  }
}
