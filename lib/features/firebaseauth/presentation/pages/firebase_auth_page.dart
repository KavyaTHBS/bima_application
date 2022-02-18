import 'package:bima_application/core/theme/color.dart';
import 'package:bima_application/core/theme/text_styles.dart';
import 'package:bima_application/features/firebaseauth/presentation/cubits/auth_cubit.dart';
import 'package:bima_application/features/firebaseauth/presentation/cubits/auth_state.dart';
import 'package:bima_application/features/firebaseauth/presentation/pages/verify_phone_num_page.dart';
import 'package:bima_application/features/firebaseauth/presentation/widgets/button.dart';
import 'package:bima_application/features/firebaseauth/presentation/widgets/text_input_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final GlobalKey<TextInputCountryState> _numberKey =
      GlobalKey<TextInputCountryState>();
  final TextEditingController _prefixController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  late String phoneIsoCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColorDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 100, 30, 80),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  'Enter your mobile number'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: Font.ROBOTO_CONDENSED_BOLD,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                )),
                const SizedBox(
                  height: 35,
                ),
                TextInputCountry(
                  textInputAction: TextInputAction.done,
                  key: _numberKey,
                  isMobileNumber: true,
                  controller: _prefixController,
                  mobileController: _mobileNoController,
                  keyboardType:
                      const TextInputType.numberWithOptions(signed: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      phoneIsoCode = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 12.5,
                ),
                Text(
                  'We will send you an SMS with the verification code to this number',
                  style: TextStyle(
                      fontFamily: Font.ROBOTO,
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 15),
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthCodeSentState) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => VerifyPhoneNumberPage()));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Button(
                            onPressed: _submitVerifyPhoneNumber,
                            color: AppColor.primaryGreen,
                            textColor: Colors.white.withOpacity(0.6),
                            title: 'Continue',
                            font: Font.ROBOTO_CONDENSED_BOLD,
                            borderColor: AppColor.primaryGreen,
                            borderRadius: 10,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitVerifyPhoneNumber() {
    if (_mobileNoController.text.isNotEmpty) {
      String mobileNumber =
          '+' + _prefixController.text.trim() + _mobileNoController.text.trim();
      BlocProvider.of<AuthCubit>(context).sendOTP(mobileNumber);
    }
  }
}
