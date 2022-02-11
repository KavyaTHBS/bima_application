import 'package:bima_application/core/config/di.dart';
import 'package:bima_application/features/firebaseauth/presentation/bloc/login_bloc.dart';
import 'package:bima_application/features/firebaseauth/presentation/cubits/auth_cubit.dart';
import 'package:bima_application/features/firebaseauth/presentation/cubits/auth_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _bloc = sl<LoginBloc>();

  String phoneNumber = "";
  String smsCode = "";

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [form()],
            ),
          );
        },
      ),
    );
  }

  Widget form() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Phone number',
            suffixIcon: Icon(Icons.phone),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onChanged: handlePhoneChange,
        ),
        SizedBox(height: 10.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: Icon(Icons.donut_small),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onChanged: handleVerification,
        ),
        RaisedButton(child: Text('Login'), elevation: 5.0, onPressed: doLogin)
      ],
    );
  }

  void doLogin() {
    _bloc.add(DoLogin(phoneNumber: phoneNumber, smsCode: smsCode));
  }

  void handlePhoneChange(String value) => setState(() => phoneNumber = value);

  void handleVerification(String value) => setState(() => phoneNumber = value);
}
