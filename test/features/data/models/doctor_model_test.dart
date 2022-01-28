import 'package:bima_application/features/data/models/doctor_model.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  final doctorModel = DoctorModel();

  test(
    'should be a subclass of Doctor entity',
      () async {
      //assert
  expect(doctorModel, isA<Doctor>());
  },
  );
}