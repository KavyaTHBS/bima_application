import 'dart:ui';

import 'package:bima_application/core/error/app_error.dart';
import 'package:bima_application/core/error/failures.dart';
import 'package:bima_application/core/platform/network_info.dart';
import 'package:bima_application/features/data/datasources/binding/local/doctor_local_data_source.dart';
import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:bima_application/features/data/datasources/binding/tables/doctor_table.dart';
import 'package:bima_application/features/data/models/doctor_model.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/domain/repositories/doctor_list_repository.dart';
import 'package:dartz/dartz.dart';

class DoctorListRepositoryImpl implements DoctorListRepository{
 final DoctorRemoteDataSource remoteDataSource;
 final DoctorLocalDataSource localDataSource;
 // final DoctorLocalDataSource localDataSource;
 //  final NetworkInfo networkInfo;

 DoctorListRepositoryImpl({
  required this.remoteDataSource,
  required this.localDataSource,
});


  @override
  Future<Either<Failure, List<Doctor>>> getDoctorList() async{


      final doctorList = await remoteDataSource.getDoctorList();
      // await localDataSource.cacheDoctorList(doctorList);
      return Right(doctorList);

  }

  @override
  Future<Either<AppError, void>> cacheDoctorList(DoctorModel doctorModel) async {
    try {
      final response = await localDataSource.cacheDoctorList(DoctorTable.fromDoctorModel(doctorModel));
      print('local cache: $doctorModel');
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

}

