import 'package:test/test.dart';
import '../lib/domain/Person.dart';

void main() {
  group('Person Tests', () {
    test('Person creation with all attributes', () {
      final person = Person(
        id: 1,
        name: 'Tharoeun',
        age: 38,
        gender: 'Male',
        email: 'thapp@gmail.com',
        phoneNumber: '089 85 20 86',
        address: 'Kob Srov, ChhoukVa2',
      );

      expect(person.id, equals(1));
      expect(person.name, equals('Tharoeun'));
      expect(person.age, equals(38));
      expect(person.gender, equals('Male'));
      expect(person.email, equals('thapp@gmail.com'));
      expect(person.phoneNumber, equals('089 85 20 86'));
      expect(person.address, equals('Kob Srov, ChhoukVa2'));
    });

    test('Person displayInfo should not throw error', () {
      final person = Person(
        id: 1,
        name: 'Tharoeun',
        age: 38,
        gender: 'Male',
        email: 'thapp@gmail.com',
        phoneNumber: '089 85 20 86',
        address: 'Kob Srov, ChhoukVa2',
      );

      expect(() => person.displayInfo(), returnsNormally);
    });
  });
}
