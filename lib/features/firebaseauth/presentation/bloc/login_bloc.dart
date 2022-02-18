import 'package:bima_application/features/firebaseauth/domain/usecases/sign_in.dart';
import 'package:bima_application/features/firebaseauth/domain/usecases/sign_in_with_phone_number.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late SignInWithPhoneNumber signInWithPhoneNumber;

  final VerifySmsCode verifySmsCode;

  LoginBloc({required this.signInWithPhoneNumber, required this.verifySmsCode})
      : super(AuthInitialState()) {
    on<PhoneAuthNumberVerified>((event, emit) async {
      emit(AuthLoadingState());
      await signInWithPhoneNumber(event.phoneNumber);
      emit(AuthCodeSentState());
    });
    on<PhoneAuthCodeVerified>((event, emit) async {
      emit(AuthLoadingState());
      await verifySmsCode(event.smsCode);
      emit(AuthLoggedInState());
    });
  }
}
