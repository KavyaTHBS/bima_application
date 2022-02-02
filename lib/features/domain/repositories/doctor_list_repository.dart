import 'package:bima_application/core/error/app_error.dart';
import 'package:bima_application/core/error/failures.dart';
import 'package:bima_application/features/data/models/doctor_model.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorListRepository {
  Future<Either<Failure,List<Doctor>>> getDoctorList();
  Future<Either<AppError,void>>  cacheDoctorList(DoctorModel doctorModel);

}
