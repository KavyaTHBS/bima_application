import 'package:bima_application/core/platform/network_info.dart';
import 'package:bima_application/features/data/datasources/binding/local/doctor_local_data_source.dart';
import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:bima_application/features/data/models/doctor_model.dart';
import 'package:bima_application/features/data/repositories/doctor_list_repository_impl.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements DoctorRemoteDataSource{

}
class MockLocalDataSource extends Mock implements DoctorLocalDataSource{}
class MockNetworkInfo extends Mock implements NetworkInfo{}

void main(){
  DoctorListRepositoryImpl? repositoryImpl;
  MockRemoteDataSource? mockRemoteDataSource;
  MockLocalDataSource? mockLocalDataSource;
  MockNetworkInfo? mockNetworkInfo;

  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = DoctorListRepositoryImpl(
      remoteDataSource: mockRemoteDataSource!,
      localDataSource: mockLocalDataSource!,
      networkInfo: mockNetworkInfo!,
    );

  });

  group('getDoctorList',(){
  //  final doctorModel = DoctorModel();
   // final Doctor doctorEntity = doctorModel;
    test('should check if the device is online',
        (){
      //arrange
          when(mockNetworkInfo?.isConnected).thenAnswer((_) async => true);

         //act
         repositoryImpl?.getDoctorList();
         //assert
          verify(mockNetworkInfo?.isConnected);
        });

  });
}