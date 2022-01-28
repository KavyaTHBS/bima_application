import 'package:bima_application/features/data/repositories/firebaseAuthentication.dart';
import 'package:bima_application/features/domain/repositories/authentication.dart';
import 'package:bima_application/features/domain/usecases/authentication/sign_in.dart';
import 'package:bima_application/features/presentation/bloc/login/login_bloc.dart';
import 'package:get_it/get_it.dart';

final sl =GetIt.I;
void setUp(){

  // Blocs
  sl.registerFactory(() => LoginBloc(signInUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // Infra services
  sl.registerLazySingleton<AuthenticationService>(
          () => FirebaseAuthentication());

  //get DoctorList

}