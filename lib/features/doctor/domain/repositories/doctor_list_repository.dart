import 'package:bima_application/core/exceptions/failure.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:dartz/dartz.dart';

///Calls the BASE_URI.
///Response will be parsed into 'DoctorModel'.
///Doctor list will be sorted based on rating from highest to lowest
abstract class DoctorListRepository {
  Future<Either<Failure,List<Doctor>>> getDoctorList();

}
