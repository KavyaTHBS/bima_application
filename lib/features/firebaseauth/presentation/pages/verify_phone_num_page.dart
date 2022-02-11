import 'package:bima_application/features/firebaseauth/data/datasources/auth.dart';
import 'package:bima_application/features/firebaseauth/presentation/cubits/auth_cubit.dart';
import 'package:bima_application/features/firebaseauth/presentation/cubits/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../main.dart';

class VerifyPhoneNumberPage extends StatefulWidget {
  @override
  State<VerifyPhoneNumberPage> createState() => _VerifyPhoneNumberPageState();
}

class _VerifyPhoneNumberPageState extends State<VerifyPhoneNumberPage> {
  Auth auth = Auth();

  String verificationID = "";

  String smsCode = "";

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Verify Phone Number'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*TextField(
                    controller: otpController,
                    maxLength: 6,
                    decoration: const InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '6-Digit OTP',
                        counterText: '',
                    ),
                  ),*/
                  otpField(),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoggedInState) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TestClass()));
                      } else if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                          duration: const Duration(milliseconds: 2000),
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .verifyOTP(smsCode);
                          },
                          color: Colors.blue,
                          child: Text("Verify"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(this.context).size.width,
      fieldWidth: 60,
      otpFieldStyle: OtpFieldStyle(
          backgroundColor: Colors.grey, borderColor: Colors.white),
      style: TextStyle(fontSize: 15),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  setData(_verificationId) {
    setState(() {
      verificationID = _verificationId;
    });
  }
}
