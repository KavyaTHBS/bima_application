import 'dart:html';

import 'package:bima_application/core/config/di.dart';
import 'package:bima_application/core/util/loading_status.dart';
import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/domain/usecases/doctor_list/get_doctor_list.dart';
import 'package:bima_application/features/presentation/bloc/doctor_list/doctor_bloc.dart';
import 'package:bima_application/features/presentation/cubits/auth_cubit.dart';
import 'package:bima_application/features/presentation/cubits/auth_state.dart';
import 'package:bima_application/features/presentation/pages/authentication/firebase_auth_page.dart';
import 'package:bima_application/features/presentation/theme/color.dart';
import 'package:bima_application/features/presentation/theme/text_styles.dart';
import 'package:bima_application/features/presentation/widgets/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_detail_page.dart';

class DocotorListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        leading: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoggedOutState) {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignIn()));
            }
          },
          builder: (context, state) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColor.primaryColor,
              ),
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();
              },
            );
          },
        ),

        title: Image.asset(
          'assets/images/dr_bima.png',
          fit: BoxFit.scaleDown,
          width: MediaQuery.of(context).size.width / 2.5,
        ),
        actions: [
          Image.asset(
            'assets/images/bima_icon.png',
            height: 40,
            fit: BoxFit.cover,
          )
        ],
      ),
      body: body(context),
    );
  }


}

BlocProvider<DoctorBloc> body(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<DoctorBloc>()..add(GetDoctorBlocEvent()),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocBuilder<DoctorBloc, DoctorBlocState>(
              builder: (context, state) {
                if (state is DoctorBlocInitial) {
                  return const LoadingWidget();
                } else if (state is Loading) {
                  return const LoadingWidget();
                } else if (state is DoctorLoadedState) {
                  return DisplayDoctorList(doctorsList: state.listOfDoctors);
                } else if (state is DoctorsFailed) {
                  return DisplayError(message: state.message);
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}


class DisplayDoctorList extends StatelessWidget {
  final List<Doctor> doctorsList;
  const DisplayDoctorList({Key? key, required this.doctorsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
              NetworkImage(doctorsList[index].profilePic.toString()),
            ),
            title: Text(
              doctorsList[index].firstName + ' ' + doctorsList[index].lastName,
              style: const TextStyle(
                color: AppColor.primaryColorDark,
                fontFamily: Font.ROBOTO_CONDENSED_BOLD,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    doctorsList[index].specialization.toUpperCase(),
                    style: const TextStyle(
                      color: AppColor.primaryColorDark,
                      fontFamily: Font.ROBOTO_CONDENSED_REGULAR,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    doctorsList[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: Font.ROBOTO,
                    ),
                  ),
                )
              ],
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: AppColor.primaryColor,
              ),
              onPressed: () {
                _navigateToDoctorDetailPage(context,doctorsList[index]);

              },
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 2),
        itemCount: doctorsList.length);

  }

  void _navigateToDoctorDetailPage(BuildContext context, Doctor listOfDoctor) {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => DoctorDetailPage(detailsOfDoctor: listOfDoctor,)));
  }

}


class DisplayError extends StatelessWidget {
  const DisplayError({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 6,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              message,
            ),
          ],
        ),
      ),
    );
  }
}