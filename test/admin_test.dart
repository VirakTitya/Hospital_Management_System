import 'package:test/test.dart';
import '../lib/domain/Role.dart';
import '../lib/domain/Admin.dart';
import '../lib/domain/Staff.dart';
import '../lib/domain/Person.dart';

void main() {
  group('Admin Tests', () {
    test('Admin can be created and has correct inheritance', () {
      final adminRole = Role(
        roleId: 1,
        title: 'System Administrator',
        description: 'Manages hospital operations',
      );

      final admin = Admin(
        id: 1,
        name: 'Tharoeun',
        age: 38,
        gender: 'Male',
        email: 'tharoeun@gmail.com',
        phoneNumber: '089 85 20 86',
        address: 'ChhoukVa2',
        salary: 80000.0,
        role: adminRole,
      );

      expect(admin.name, equals('Tharoeun'));
      expect(admin.getRole(), equals('System Administrator'));
      expect(admin.getSalary(), equals(80000.0));
      expect(admin, isA<Staff>());
      expect(admin, isA<Person>());
    });
  });
}
