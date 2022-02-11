import 'package:bima_application/core/exceptions/failure.dart';
import 'package:bima_application/features/doctor/data/datasources/binding/local/doctor_local_data_source.dart';
import 'package:bima_application/features/doctor/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:bima_application/features/doctor/domain/repositories/doctor_list_repository.dart';
import 'package:dartz/dartz.dart';

class DoctorListRepositoryImpl implements DoctorListRepository {
  final DoctorRemoteDataSource remoteDataSource;
  final DoctorLocalDataSource localDataSource;

  DoctorListRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Doctor>>> getDoctorList() async {
    List<DoctorModel> doctorsList = await localDataSource.getDoctorList();

    if (doctorsList.isNotEmpty) {
      return Right(doctorsList);
    } else {
      doctorsList = await remoteDataSource.getDoctorList();
      await localDataSource.deleteDoctorsList();
      await localDataSource.updateDoctorsList(doctorsList);
      return Right(doctorsList);
    }
  }
}
