import 'Department.dart';

/// Class representing a hospital
class Hospital {
  String hospitalName;
  String hospitalAddress;
  List<Department> departments;

  Hospital({
    required this.hospitalName,
    required this.hospitalAddress,
    List<Department>? departments,
  }) : departments = departments ?? [];

  /// Add a department to the hospital
  void addDepartment(Department dept) {
    departments.add(dept);
  }

  /// List all departments in the hospital
  String listDepartments() {
    final buffer = StringBuffer();
    buffer.writeln('\n========== Departments at $hospitalName ==========');
    if (departments.isEmpty) {
      buffer.writeln('No departments available');
    } else {
      for (int i = 0; i < departments.length; i++) {
        buffer.writeln('${i + 1}. ${departments[i].departmentName} (ID: ${departments[i].departmentId})');
        buffer.writeln('   Staff Count: ${departments[i].staffList.length}');
      }
    }
    buffer.writeln('Total Departments: ${departments.length}\n');
    return buffer.toString();
  }

  /// List all staff across all departments
  String listAllStaff() {
    final buffer = StringBuffer();
    buffer.writeln('\n========== All Staff at $hospitalName ==========');
    int totalStaff = 0;
    
    if (departments.isEmpty) {
      buffer.writeln('No departments available');
      return buffer.toString();
    }

    for (var dept in departments) {
      if (dept.staffList.isNotEmpty) {
        buffer.writeln('\n--- ${dept.departmentName} Department ---');
        for (var staff in dept.staffList) {
          buffer.writeln('• ${staff.name} - ${staff.getRole()} (ID: ${staff.id})');
          totalStaff++;
        }
      }
    }
    
    if (totalStaff == 0) {
      buffer.writeln('No staff members in the hospital');
    }
    buffer.writeln('\nTotal Staff: $totalStaff\n');
    return buffer.toString();
  }

  /// Find a department by ID
  Department? findDepartmentById(int deptId) {
    try {
      return departments.firstWhere((dept) => dept.departmentId == deptId);
    } catch (e) {
      return null;
    }
  }

  /// Remove a department from the hospital
  bool removeDepartment(int deptId) {
    int initialLength = departments.length;
    departments.removeWhere((dept) => dept.departmentId == deptId);
    return departments.length < initialLength;
  }
}
