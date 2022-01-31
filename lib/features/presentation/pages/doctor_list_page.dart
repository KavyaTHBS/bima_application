import 'dart:html';

import 'package:bima_application/core/config/di.dart';
import 'package:bima_application/core/util/loading_status.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/presentation/bloc/doctor_list/doctor_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocotorListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor List'),
      ),
      body: BlocProvider<DoctorBloc>(
        create: (_) => sl<DoctorBloc>()..add(GetDoctorBlocEvent()),
        child: BlocBuilder<DoctorBloc, DoctorBlocState>(
          builder: (context,state) {

            if(state is DoctorListLoaded) {
              return Container(
                child:const Text('testing'),
              );
              /* ListView.builder(
                itemCount:state.doctorList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text((state.doctorList[index]).first_name!),
                  );
                },
              );*/
            }else{
              return Loading();
            }


          },

        ),
        /*Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: BlocBuilder<DoctorBloc,DoctorBlocState>(
                    builder: (context,state) {

                      if(state is DoctorListLoaded) {
                          return doctorList(doctorList: state.doctorList);
                      }else{
                        return Loading();
                      }


                    },

                  ),
              ),

            ],
          ),
        ),*/
      ),
    );
  }


}


Widget doctorList({required List<Doctor> doctorList}) {
  print("doctor list: $doctorList");

  return MaterialApp(
title: 'doctor list',
    home: Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: doctorList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text((doctorList[index]).firstName),
              );
            },
          ),
        ),
      ),

  );



}

class Loading extends StatelessWidget {
  bool _loading = false;

  // void _onLoading() {
  //   setState(() {
  //     _loading = true;
  //     new Future.delayed(new Duration(seconds: 3), _login);
  //   });
  // }


  // Future _login() async{
  //   setState((){
  //     _loading = false;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home :  Column(
      children: <Widget>[
        new Container(
          height: 40.0,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.fromLTRB(15.0, 150.0, 15.0, 0.0),
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: new TextField(
            decoration: new InputDecoration.collapsed(hintText: "username"),
          ),
        ),
        new Container(
          height: 40.0,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(15.0),
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: new TextField(
            decoration: new InputDecoration.collapsed(hintText: "password"),
          ),
        ),
      ],
    ),
    );
  }



}
