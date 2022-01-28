import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

class MockHttpClient extends Mock implements http.Client{}

void main(){
  DoctorRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;

  setUp((){
    mockHttpClient = MockHttpClient();
    dataSource = DoctorRemoteDataSourceImp(client: mockHttpClient);
  });
}