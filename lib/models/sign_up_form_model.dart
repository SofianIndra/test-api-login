class SignUpFormModel {
  final int? roleId;
  final String? code;
  final String? username;
  final String? email;
  final String? password;
  final String? name;
  final String? alias;
  final bool? isActive;
  final String? createdBy;

  SignUpFormModel({
    this.roleId,
    this.code,
    this.username,
    this.email,
    this.password,
    this.name,
    this.alias,
    this.isActive,
    this.createdBy,
  });

  factory SignUpFormModel.fromJson(Map<String, dynamic> json) =>
      SignUpFormModel(
        roleId: json['role_id'],
        code: json['code'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        name: json['name'],
        alias: json['alias'],
        isActive: json['is_active'],
        createdBy: json['created_by'],
      );

  Map<String, dynamic> toJson() {
    return {
      'role_id': roleId,
      'code': code,
      'username': username,
      'email': email,
      'password': password,
      'name': name,
      'alias': alias,
      'is_active': isActive,
      'created_by': createdBy,
    };
  }
}
