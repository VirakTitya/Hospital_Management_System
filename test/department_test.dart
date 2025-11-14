import 'package:test/test.dart';
import '../lib/domain/Department.dart';
import '../lib/domain/Role.dart';
import '../lib/domain/Staff.dart';

void main() {
  group('Department Tests', () {
    test('Add staff to department and basic properties', () {
      final dept = Department(departmentId: 3, departmentName: 'Surgery');
      final role = Role(roleId: 1, title: 'Doctor', description: 'Medical care');
      final staff = Staff(
        id: 2,
        name: 'Homey',
        age: 35,
        gender: 'Male',
        email: 'homey@hospital.com',
        phoneNumber: '076 89 71 1426',
        address: 'Phnom Penh',
        salary: 3000.0,
        role: role,
      );

      dept.addStaff(staff);
      expect(dept.staffList.length, equals(1));
      expect(dept.staffList[0].name, equals('Homey'));
      expect(dept.staffList[0].getSalary(), equals(3000.0));
      expect(dept.departmentName, equals('Surgery'));
    });

    test('Remove staff from department', () {
      final dept = Department(departmentId: 3, departmentName: 'Surgery');
      final role = Role(roleId: 1, title: 'Doctor', description: 'Medical care');
      final staff = Staff(
        id: 2,
        name: 'Homey',
        age: 35,
        gender: 'Male',
        email: 'homey@hospital.com',
        phoneNumber: '012 34 56 78',
        address: 'Phnom Penh',
        salary: 3000.0,
        role: role,
      );

      dept.addStaff(staff);
      expect(dept.staffList.length, equals(1));

      final removed = dept.removeStaff(2);
      expect(removed, isTrue);
      expect(dept.staffList.length, equals(0));
    });

    test('Find staff by id', () {
      final dept = Department(departmentId: 3, departmentName: 'Surgery');
      final role = Role(roleId: 1, title: 'Doctor', description: 'Medical care');
      final staff = Staff(
        id: 2,
        name: 'Homey',
        age: 35,
        gender: 'Male',
        email: 'homey@hospital.com',
        phoneNumber: '012 34 56 78',
        address: 'Phnom Penh',
        salary: 3000.0,
        role: role,
      );

      dept.addStaff(staff);
      final found = dept.findStaffById(2);

      expect(found, isNotNull);
      expect(found?.name, equals('Homey'));
      expect(found?.id, equals(2));
      expect(found?.getRole(), equals('Doctor'));
    });

    test('listStaff should not throw', () {
      final dept = Department(departmentId: 10, departmentName: 'TestDept');
      expect(() => dept.listStaff(), returnsNormally);
    });
  });
}
