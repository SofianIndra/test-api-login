class MsRoleDetailModel {
  final int? id;
  final int? groupId;
  final int? moduleId;
  final int? roleId;
  final bool? view;
  final bool? add;
  final bool? edit;
  final bool? print;
  final bool? export;

  MsRoleDetailModel({
    this.id,
    this.groupId,
    this.moduleId,
    this.roleId,
    this.view,
    this.add,
    this.edit,
    this.print,
    this.export,
  });

  factory MsRoleDetailModel.fromJson(Map<String, dynamic> json) =>
      MsRoleDetailModel(
        id: json['id'],
        groupId: json['group_id'],
        moduleId: json['module_id'],
        roleId: json['role_id'],
        view: json['view'],
        add: json['add'],
        edit: json['edit'],
        print: json['print'],
        export: json['export'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'group_id': groupId,
      'module_id': moduleId,
      'role_id': roleId,
      'view': view,
      'add': add,
      'edit': edit,
      'print': print,
      'export': export,
    };
  }
}
