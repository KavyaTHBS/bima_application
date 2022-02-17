import 'dart:convert';

import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:bima_application/features/doctor/domain/repositories/doctor_list_repository.dart';
import 'package:bima_application/features/doctor/domain/usecases/get_doctor_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_resources/fixtures.dart';

class MockDoctorListRepository extends Mock implements DoctorListRepository{
}
void main(){
  GetDoctorList? usecase;
  MockDoctorListRepository? mockDoctorListRepository;
  
  setUp((){
    mockDoctorListRepository = MockDoctorListRepository();
    usecase = GetDoctorList(mockDoctorListRepository!);
  });
  
  final doctorListModel = List<Doctor>.from(
      (json.decode(fixture('doctors_list.json')) as List)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>)));
  doctorListModel.sort((a, b) => b.rating.compareTo(a.rating));

  test(
    "Should get doctor list from repository",
      () async {
      when(mockDoctorListRepository?.getDoctorList()).thenAnswer((_) async =>Right(doctorListModel) );
      final result = usecase;
      await mockDoctorListRepository?.getDoctorList();

      verify(mockDoctorListRepository?.getDoctorList());
      verifyNoMoreInteractions(mockDoctorListRepository);
      }
  );
}