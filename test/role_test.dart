import 'package:test/test.dart';
import '../lib/domain/Role.dart';
import '../lib/domain/Department.dart';

void main() {
  group('Role Tests', () {
    test('Create Role with department', () {
      final dept = Department(departmentId: 1, departmentName: 'Administrative');
      final role = Role(roleId: 1, title: 'System Administrator', description: 'Manages ops', department: dept);

      expect(role.roleId, equals(1));
      expect(role.title, equals('System Administrator'));
      expect(role.description, equals('Manages ops'));
      expect(role.department, isNotNull);
      expect(role.department.departmentName, equals('Administrative'));
    });

    test('Role displayRoleInfo should not throw', () {
      final role = Role(roleId: 2, title: 'Doctor', description: 'Medical care');
      expect(() => role.displayRoleInfo(), returnsNormally);
    });
  });
}
