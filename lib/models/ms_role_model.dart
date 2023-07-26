class MsRoleModel {
  final int? id;
  final String? code;
  final String? roleName;
  final String? alias;
  final bool? isActive;
  final int? ordinal;
  final DateTime? modifiedAt;
  final DateTime? createdAt;
  final String? modifiedBy;
  final String? createdBy;

  MsRoleModel({
    this.id,
    this.code,
    this.roleName,
    this.alias,
    this.isActive,
    this.ordinal,
    this.modifiedAt,
    this.createdAt,
    this.createdBy,
    this.modifiedBy,
  });

  factory MsRoleModel.fromJson(Map<String, dynamic> json) => MsRoleModel(
        id: json['id'],
        code: json['code'],
        roleName: json['role_name'],
        alias: json['alias'],
        isActive: json['is_active'],
        ordinal: json['ordinal'],
        modifiedAt: json['modified_at'],
        createdAt: json['created_at'],
        modifiedBy: json['modified_by'],
        createdBy: json['created_by'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'role_name': roleName,
      'alias': alias,
      'is_active': isActive,
      'ordinal': ordinal,
      'modified_at': modifiedAt,
      'created_at': createdAt,
      'modified_by': modifiedBy,
      'created_by': createdBy,
    };
  }
}
