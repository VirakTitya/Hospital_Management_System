import '../services/hospital_service.dart';

void main() {
  print('========================================');
  print('   Hospital Management System Demo');
  print('========================================\n');

  final service = HospitalService();

  print('--- Option 1: Create Hospital (with 5 departments) ---\n');
  final centralHospital = service.createDemoHospital();
  print('✓ Hospital created: ${centralHospital.hospitalName}\n');

  print('--- Option 2: Add Staff ---\n');
  print('✓ 5 staff members added successfully!\n');

  print('--- Option 3: View All Staff ---\n');
  print(centralHospital.listAllStaff());

  print('\n--- Option 4: View Staff by Department ---\n');
  for (var dept in centralHospital.departments) {
    print('Department: ${dept.departmentName}');
    print(dept.listStaff());
  }

  print('\n--- Option 5: Search Staff (by ID or Name) ---\n');

  print('Search Example 1: Search by ID "301"');
  final found = service.findStaffById(centralHospital, 301);
  if (found != null) {
    print('✓ Staff found (Department: ${found['department']}):');
    print((found['staff'] as dynamic).displayInfo());
  } else {
    print('No staff found with that ID');
  }

  print('\nSearch Example 2: Search by Name "Sarah"');
  final byName = service.findStaffByName(centralHospital, 'Sarah');
  for (var r in byName) {
    print('✓ Staff found (Department: ${r['department']}):');
    print((r['staff'] as dynamic).displayInfo());
  }

  print('\nSearch Example 3: Search by Role "Doctor"');
  final byRole = service.findStaffByRole(centralHospital, 'Doctor');
  int count = 1;
  for (var r in byRole) {
    final s = r['staff'];
    print('${count}. ${(s as dynamic).name} - ${(s).role.title} (Department: ${r['department']})');
    count++;
  }

  print('\n========================================');
  print('   Demo Completed Successfully!');
  print('   All 5 menu options demonstrated');
  print('========================================');
}
