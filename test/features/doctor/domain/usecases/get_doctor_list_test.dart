import 'dart:convert';

import 'package:bima_application/core/exceptions/failure.dart';
import 'package:bima_application/core/usecases/usecase.dart';
import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:bima_application/features/doctor/domain/repositories/doctor_list_repository.dart';
import 'package:bima_application/features/doctor/domain/usecases/get_doctor_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_resources/fixtures.dart';

class MockDoctorListRepository extends Mock implements DoctorListRepository {}

void main() {
 late GetDoctorList usecase;
 late MockDoctorListRepository mockDoctorListRepository;

  setUp(() {
    mockDoctorListRepository = MockDoctorListRepository();
    usecase = GetDoctorList(mockDoctorListRepository);
  });

  final doctorListModel = [
   Doctor(
        rating: '3.5',
        id: 1,
        firstName: 'Amitabh',
        lastName: 'Bachchan',
        profilePic:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indian_actor_Amitabh_Bachchan.jpg/440px-Indian_actor_Amitabh_Bachchan.jpg',
        specialization: 'General Practice',
        description:
        'Meet Dr. Amitabh, our Chief Medical Officer. Dr. Amitabh completed his medical training at University of India Medical School and has practiced medicine for over 8 years. His passion is to reach out to every Indiaian with quality medical information and care and this is why he loves telemedicine. He enjoys reading, watching movies and listening to music.', primaryContactNo: '+919793380800')
  ];
  test("Should get doctor list from repository", () async {
    //Arrange
    when(mockDoctorListRepository.getDoctorList())
        .thenAnswer((_) async => Right(doctorListModel));
// Act
    final result = await usecase(NoParams());
// Assert
    expect(result, Right<Failure, List<Doctor>>(doctorListModel));
    verify(mockDoctorListRepository.getDoctorList());
    verifyNoMoreInteractions(mockDoctorListRepository);
  });
}
