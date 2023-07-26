class UserModel {
  final int? id;
  final int? roleId;
  final String? code;
  final String? name;
  final String? username;
  final String? alias;
  final String? email;
  final String? password;
  final bool? isActive;
  final String? createdBy;
  final String? modifiedBy;
  final DateTime? createdAt;
  final DateTime? modifiedAt;

  UserModel({
    this.id,
    this.roleId,
    this.code,
    this.name,
    this.email,
    this.alias,
    this.isActive,
    this.username,
    this.password,
    this.createdBy,
    this.createdAt,
    this.modifiedAt,
    this.modifiedBy,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        roleId: json['role_id'],
        code: json['code'],
        name: json['name'],
        email: json['email'],
        alias: json['alias'],
        isActive: json['is_active'],
        createdBy: json['created_by'],
        modifiedBy: json['modified_by'],
        createdAt: json['created_at'] != ''
            ? DateTime.parse(json['created_at'])
            : null,
        modifiedAt: json['modified_at'] != ''
            ? DateTime.parse(json['modified_at'])
            : null,
      );

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'role_id': roleId,
      'code': code,
      'name': name,
      'email': email,
      'alias': alias,
      'is_active': isActive,
      'created_by': createdBy,
    };
  }
}
