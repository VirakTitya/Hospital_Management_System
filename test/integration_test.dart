import 'package:test/test.dart';
import '../lib/domain/Hospital.dart';
import '../lib/domain/Department.dart';
import '../lib/domain/Role.dart';
import '../lib/domain/Staff.dart';

void main() {
  group('Integration Tests', () {
    test('Full hospital management system workflow', () {
      // Step 1: Create Hospital
      final hospital = Hospital(hospitalName: 'Royal Hospital', hospitalAddress: 'Phnom Penh');

      final administrative = Department(departmentId: 1, departmentName: 'Administrative');
      final pharmacy = Department(departmentId: 2, departmentName: 'Pharmacy');
      final surgery = Department(departmentId: 3, departmentName: 'Surgery');
      final maternity = Department(departmentId: 4, departmentName: 'Maternity');
      final emergency = Department(departmentId: 5, departmentName: 'Emergency');

      hospital.addDepartment(administrative);
      hospital.addDepartment(pharmacy);
      hospital.addDepartment(surgery);
      hospital.addDepartment(maternity);
      hospital.addDepartment(emergency);

      expect(hospital.departments.length, equals(5));

      // Step 2: Add Staff
      final doctorRole = Role(roleId: 1, title: 'Doctor', description: 'Medical care', department: surgery);
      final doctor = Staff(
        id: 2,
        name: 'Homey',
        age: 35,
        gender: 'Male',
        email: 'homey@hospital.com',
        phoneNumber: '012 34 56 78',
        address: 'Phnom Penh',
        salary: 3000.0,
        role: doctorRole,
      );
      surgery.addStaff(doctor);

      // Step 3: View All Staffs
      int totalStaff = 0;
      for (var dept in hospital.departments) {
        totalStaff += dept.staffList.length;
      }
      expect(totalStaff, equals(1));

      // Step 4: Update Staff
      doctor.setSalary(3500.0);
      expect(doctor.getSalary(), equals(3500.0));

      // Step 5: Remove Staff
      final removed = surgery.removeStaff(2);
      expect(removed, isTrue);
      expect(surgery.staffList.length, equals(0));

      // Step 6: List Departments
      expect(hospital.departments.length, equals(5));
      expect(() => hospital.listDepartments(), returnsNormally);

      // Step 7: Add staff back
      surgery.addStaff(Staff(
        id: 3,
        name: 'Dr. Test',
        age: 40,
        gender: 'Male',
        email: 'test@hospital.com',
        phoneNumber: '011 11 11 11',
        address: 'Phnom Penh',
        salary: 4000.0,
        role: doctorRole,
      ));

      expect(surgery.staffList.length, equals(1));
      expect(() => surgery.listStaff(), returnsNormally);

      // Step 8: Search Staff
      final foundStaff = surgery.findStaffById(3);
      expect(foundStaff, isNotNull);
      expect(foundStaff?.name, equals('Dr. Test'));
    });
  });
}
