import 'package:bima_application/core/exceptions/failure.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorListRepository {
  Future<Either<Failure,List<Doctor>>> getDoctorList();

}
