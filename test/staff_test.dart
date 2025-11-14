import 'package:test/test.dart';
import '../lib/domain/Role.dart';
import '../lib/domain/Staff.dart';

void main() {
  group('Staff Tests', () {
    test('Staff salary getter and setter', () {
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

      expect(staff.getSalary(), equals(3000.0));

      staff.setSalary(3500.0);
      expect(staff.getSalary(), equals(3500.0));
    });

    test('Staff displayInfo should not throw', () {
      final role = Role(roleId: 1, title: 'Doctor', description: 'Medical care');
      final staff = Staff(
        id: 3,
        name: 'Dr. Test',
        age: 40,
        gender: 'Male',
        email: 'test@hospital.com',
        phoneNumber: '011 11 11 11',
        address: 'Phnom Penh',
        salary: 4000.0,
        role: role,
      );

      expect(() => staff.displayInfo(), returnsNormally);
    });
  });
}
