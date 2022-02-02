

import 'package:bima_application/core/error/app_error.dart';
import 'package:bima_application/core/error/failures.dart';
import 'package:bima_application/core/usecases/usecase.dart';
import 'package:bima_application/features/data/models/doctor_model.dart';
import 'package:bima_application/features/data/repositories/doctor_list_repository_impl.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/domain/repositories/doctor_list_repository.dart';
import 'package:dartz/dartz.dart';

class CacheDoctorList extends UseCases<void, DoctorModel> {
  final DoctorListRepository doctorListRepository;

  CacheDoctorList(this.doctorListRepository);

  @override
  Future<Either<AppError, void>> call(DoctorModel params) async {
    return await doctorListRepository.cacheDoctorList(params);
  }
}
