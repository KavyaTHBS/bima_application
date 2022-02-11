import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:bima_application/features/doctor/domain/repositories/doctor_list_repository.dart';
import 'package:bima_application/features/doctor/domain/usecases/get_doctor_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDoctorListRepository extends Mock implements DoctorListRepository{
}
void main(){
  GetDoctorList? usecase;
  MockDoctorListRepository? mockDoctorListRepository;
  
  setUp((){
    mockDoctorListRepository = MockDoctorListRepository();
    usecase = GetDoctorList(mockDoctorListRepository!);
  });
  
  const id = 1;
  List<Doctor> doctorResult = Doctor('Amitabh', 'Bachchan', "General Practice", "Meet Dr. Amitabh, our Chief Medical Officer. Dr. Amitabh completed his medical training at University of India Medical School and has practiced medicine for over 8 years. His passion is to reach out to every Indiaian with quality medical information and care and this is why he loves telemedicine. He enjoys reading, watching movies and listening to music.", "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indian_actor_Amitabh_Bachchan.jpg/440px-Indian_actor_Amitabh_Bachchan.jpg",'3.5','+919793380800',1) as List<Doctor>;

  test(
    "Should get doctor list from repository",
      () async {
      when(mockDoctorListRepository?.getDoctorList()).thenAnswer((_) async =>Right(doctorResult) );
     // final result = await usecase?.execute();
      final result = await usecase!;
      verify(mockDoctorListRepository?.getDoctorList());
      verifyNoMoreInteractions(mockDoctorListRepository);
      }
  );
}