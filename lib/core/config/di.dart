import 'package:bima_application/features/data/core/api_client.dart';
import 'package:bima_application/features/data/datasources/binding/local/doctor_local_data_source.dart';
import 'package:bima_application/features/data/datasources/binding/local/doctor_local_data_source_impl.dart';
import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source_impl.dart';
import 'package:bima_application/features/data/repositories/doctor_list_repository_impl.dart';
import 'package:bima_application/features/data/repositories/firebaseAuthentication.dart';
import 'package:bima_application/features/domain/repositories/authentication.dart';
import 'package:bima_application/features/domain/repositories/doctor_list_repository.dart';
import 'package:bima_application/features/domain/usecases/authentication/sign_in.dart';
import 'package:bima_application/features/domain/usecases/doctor_list/get_doctor_list.dart';
import 'package:bima_application/features/presentation/bloc/doctor_list/doctor_bloc.dart';
import 'package:bima_application/features/presentation/bloc/login/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';


final sl =GetIt.I;
Future<void> setUp()async {

  // Blocs
  sl.registerFactory(() => LoginBloc(signInUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // Infra services
  sl.registerLazySingleton<AuthenticationService>(
          () => FirebaseAuthentication());
//sl.registerLazySingleton<ApiClient>(
   //       () => ApiClient(sl()));

  //get DoctorList
  sl.registerFactory(() => DoctorBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetDoctorList(sl()));

  sl.registerLazySingleton<DoctorRemoteDataSource>(
          () => DoctorRemoteDataSourceImpl(client: sl()));
sl.registerLazySingleton<DoctorLocalDataSource>(
          () => DoctorLocalDataSourceImpl());

  sl.registerLazySingleton<DoctorListRepository>(() => DoctorListRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));
}