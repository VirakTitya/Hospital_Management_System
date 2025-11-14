/// Class representing a role within a department
class Role {
  int roleId;
  String title;
  String description;
  dynamic department; // Associated department (using dynamic to avoid circular dependency)

  Role({
    required this.roleId,
    required this.title,
    required this.description,
    this.department,
  });

  /// Display role information
  String displayRoleInfo() {
    final buffer = StringBuffer();
    buffer.writeln('Role: $title');
    buffer.writeln('Description: $description');
    if (department != null) {
      buffer.writeln('Department: ${department.departmentName}');
    }
    return buffer.toString();
  }

  @override
  String toString() => displayRoleInfo();
}
