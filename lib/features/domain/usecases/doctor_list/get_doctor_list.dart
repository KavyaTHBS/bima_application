import 'package:bima_application/core/error/failures.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/domain/repositories/doctor_list_repository.dart';
import 'package:dartz/dartz.dart';

class GetDoctorList{
  final DoctorListRepository repository;
  GetDoctorList(this.repository);

  Future<Either<Failure,Doctor>> execute() async {
    return await repository.getDoctorList();
}
}