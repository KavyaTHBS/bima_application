import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  final doctorModel = DoctorModel(lastName: '', id: 0, firstName: '', profilePic: '', specialization: '', primaryContactNo: '', rating: '', description: '');

  test(
    'should be a subclass of Doctor entity',
      () async {
      //assert
  expect(doctorModel, isA<Doctor>());
  },
  );
}