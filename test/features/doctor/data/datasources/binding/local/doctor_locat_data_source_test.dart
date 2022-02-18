import 'package:bima_application/features/doctor/data/datasources/binding/local/doctor_local_data_source_impl.dart';
import 'package:bima_application/features/doctor/data/datasources/binding/tables/doctor_table.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'doctor_locat_data_source_test.mocks.dart';

class MockSharedPrefrences extends Mock implements SharedPreferences {}

@GenerateMocks([HiveInterface, Box])
void main() {
  late DoctorLocalDataSourceImpl dataSourceImpl;
  late MockHiveInterface mockHiveInterface;
  late MockBox box;
  const baseLocation = './local_database_test_files/';
  Hive.init(baseLocation);

  setUp(() async {
    mockHiveInterface = MockHiveInterface();
    box = MockBox();
    dataSourceImpl = DoctorLocalDataSourceImpl();
  });
  group('localDataSource', () {
    var doctorTable = <DoctorTable>[
      DoctorTable(
          id: 1,
          firstName: 'firstname',
          lastName: 'lastname',
          profilePic: 'url',
          primaryContactNo: '',
          rating: '',
          description: '',
          specialization: '')
    ];
    final Map<String, DoctorTable> doctorTableMap = {
      for (var doctor in doctorTable)
        doctor.id.toString(): DoctorTable(
            id: doctor.id,
            firstName: doctor.firstName,
            lastName: doctor.lastName,
            profilePic: doctor.profilePic,
            primaryContactNo: doctor.primaryContactNo,
            rating: doctor.rating,
            description: doctor.description,
            specialization: doctor.specialization)
    };

    test('locally cache the doctor list ', () async {
      when(mockHiveInterface.openBox(any)).thenAnswer((_) async => box);
      when(box.putAll(doctorTableMap)).thenAnswer((answer) async => answer);
      await box.putAll(doctorTableMap);
      verifyNever(mockHiveInterface.openBox('DoctorTable'));
      verifyNever(box.putAll(doctorTableMap));
    });
  });
}
