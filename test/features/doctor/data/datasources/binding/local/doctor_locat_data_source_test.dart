import 'package:bima_application/features/doctor/data/datasources/binding/local/doctor_local_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPrefrences extends Mock implements SharedPreferences{}
void main(){
  DoctorLocalDataSourceImpl dataSourceImpl;
  MockSharedPrefrences mockSharedPrefrences;

  setUp((){
    mockSharedPrefrences = MockSharedPrefrences();
  //  dataSourceImpl = DoctorLocalDataSourceImpl(mockSharedPrefrences);
  });
}