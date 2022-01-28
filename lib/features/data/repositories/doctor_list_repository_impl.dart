import 'package:bima_application/core/error/failures.dart';
import 'package:bima_application/core/platform/network_info.dart';
import 'package:bima_application/features/data/datasources/binding/local/doctor_local_data_source.dart';
import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/domain/repositories/doctor_list_repository.dart';
import 'package:dartz/dartz.dart';

class DoctorListRepositoryImpl implements DoctorListRepository{
 final DoctorRemoteDataSource remoteDataSource;
 final DoctorLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

 DoctorListRepositoryImpl({
  required this.remoteDataSource,required this.localDataSource,required this.networkInfo
});


  @override
  Future<Either<Failure, List<Doctor>>> getDoctorList() async{

    networkInfo.isConnected;
   final doctorList = await remoteDataSource.getDoctorList();
    localDataSource.cacheDoctorList(doctorList);
    return Right(doctorList);

  }

}