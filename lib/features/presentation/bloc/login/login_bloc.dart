import 'dart:async';
import 'dart:js';
import 'package:bima_application/features/domain/repositories/authentication.dart';
import 'package:bima_application/features/domain/usecases/authentication/sign_in.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late SignInUseCase signIn  ;

  //LoginBloc(LoginState initialState) : super(initialState);
  static LoginState? get initialState => null;


  LoginBloc({ required SignInUseCase signInUseCase}) : super(initialState!) {
     signIn= signInUseCase;
  }



  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is DoLogin) {
      yield* _mapDoLoginToState(event.phoneNumber, event.smsCode);
    }
  }

  Stream<LoginState> _mapDoLoginToState(String phoneNumber, String smsCode) async* {
    try {
      final response = await signIn(phoneNumber, smsCode);
      print(response);
      yield LoginSuccess();
    } catch (e) {
      yield LoginFailure(e.toString());
    }
  }
}
