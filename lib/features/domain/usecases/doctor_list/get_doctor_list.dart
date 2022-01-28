import 'package:bima_application/core/error/failures.dart';
import 'package:bima_application/core/usecases/usecase.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/domain/repositories/doctor_list_repository.dart';
import 'package:dartz/dartz.dart';

class GetDoctorList extends UseCase<List<Doctor>, NoParams>{
  final DoctorListRepository repository;
  GetDoctorList(this.repository);

  @override
  Future<Either<Failure,List<Doctor>>> call(NoParams noParams ) async{
    return await repository.getDoctorList();
}
}