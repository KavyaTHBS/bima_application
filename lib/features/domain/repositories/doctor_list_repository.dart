import 'package:bima_application/core/error/failures.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorListRepository {
  Future<Either<Failure,List<Doctor>>> getDoctorList();
}
