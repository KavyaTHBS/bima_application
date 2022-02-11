import 'package:bima_application/features/doctor/data/core/api_client.dart';
import 'package:bima_application/features/doctor/data/datasources/binding/local/doctor_local_data_source.dart';
import 'package:bima_application/features/doctor/data/datasources/binding/local/doctor_local_data_source_impl.dart';
import 'package:bima_application/features/doctor/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:bima_application/features/doctor/data/datasources/binding/remote/doctor_remote_data_source_impl.dart';
import 'package:bima_application/features/doctor/data/repositories/doctor_list_repository_impl.dart';
import 'package:bima_application/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:bima_application/features/firebaseauth/data/repositories/firebaseAuthentication.dart';
import 'package:bima_application/features/doctor/domain/repositories/doctor_list_repository.dart';
import 'package:bima_application/features/firebaseauth/domain/repositories/authentication.dart';
import 'package:bima_application/features/firebaseauth/domain/usecases/sign_in.dart';
import 'package:bima_application/features/doctor/domain/usecases/get_doctor_list.dart';
import 'package:bima_application/features/firebaseauth/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final sl = GetIt.I;

Future<void> setUp() async {
  /// Login Blocs
  sl.registerFactory(
      () => LoginBloc(signInWithPhoneNumber: sl(), verifySmsCode: sl()));

  // Use cases
  sl.registerLazySingleton(() => VerifySmsCode(sl()));

  // Infra services
  sl.registerLazySingleton<AuthenticationService>(
      () => FirebaseAuthentication(sl()));

  //bloc for doctor list
  sl.registerFactory(() => DoctorBloc(sl()));

  // Use cases for getting doctor list
  sl.registerLazySingleton(() => GetDoctorList(sl()));


  sl.registerLazySingleton<DoctorRemoteDataSource>(
      () => DoctorRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<DoctorLocalDataSource>(
      () => DoctorLocalDataSourceImpl());

  sl.registerLazySingleton<DoctorListRepository>(() =>
      DoctorListRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

  sl.registerLazySingleton<Client>(() => Client());

  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));
}
