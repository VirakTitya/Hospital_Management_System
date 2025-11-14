import 'package:test/test.dart';
import '../lib/domain/Hospital.dart';
import '../lib/domain/Department.dart';

void main() {
  group('Hospital Tests', () {
    test('Create hospital with 5 departments', () {
      final hospital = Hospital(
        hospitalName: 'Calmette Hospital',
        hospitalAddress: 'Phnom Penh',
      );

      final dept1 = Department(departmentId: 1, departmentName: 'Administrative');
      final dept2 = Department(departmentId: 2, departmentName: 'Pharmacy');
      final dept3 = Department(departmentId: 3, departmentName: 'Surgery');
      final dept4 = Department(departmentId: 4, departmentName: 'Maternity');
      final dept5 = Department(departmentId: 5, departmentName: 'Emergency');

      hospital.addDepartment(dept1);
      hospital.addDepartment(dept2);
      hospital.addDepartment(dept3);
      hospital.addDepartment(dept4);
      hospital.addDepartment(dept5);

      expect(hospital.hospitalName, equals('Calmette Hospital'));
      expect(hospital.hospitalAddress, equals('Phnom Penh'));
      expect(hospital.departments.length, equals(5));
      expect(hospital.departments[0].departmentName, equals('Administrative'));
      expect(hospital.departments[4].departmentName, equals('Emergency'));
    });

    test('listDepartments and listAllStaff should not throw when empty', () {
      final hospital = Hospital(hospitalName: 'Empty', hospitalAddress: 'Nowhere');
      expect(() => hospital.listDepartments(), returnsNormally);
      expect(() => hospital.listAllStaff(), returnsNormally);
    });
  });
}
