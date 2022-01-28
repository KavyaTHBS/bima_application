import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source_impl.dart';
import 'package:bima_application/features/data/repositories/doctor_list_repository_impl.dart';
import 'package:bima_application/features/data/repositories/firebaseAuthentication.dart';
import 'package:bima_application/features/domain/repositories/authentication.dart';
import 'package:bima_application/features/domain/repositories/doctor_list_repository.dart';
import 'package:bima_application/features/domain/usecases/authentication/sign_in.dart';
import 'package:bima_application/features/domain/usecases/doctor_list/get_doctor_list.dart';
import 'package:bima_application/features/presentation/bloc/login/login_bloc.dart';
import 'package:get_it/get_it.dart';

final sl =GetIt.I;
Future<void> init() async {

  // Blocs
  sl.registerFactory(() => DoctorBloc(signInUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetDoctorList(sl()));

  sl.registerLazySingleton<DoctorRemoteDataSource>(
          () => DoctorRemoteDataSourceImpl(sl()));

sl.registerLazySingleton<DoctorListRepository>(() => DoctorListRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
}