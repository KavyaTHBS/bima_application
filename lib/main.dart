import 'dart:async';

import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/presentation/pages/doctor_detail_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'core/config/di.dart' as di;
import 'core/config/di.dart';
import 'features/data/datasources/binding/tables/doctor_table.dart';
import 'features/presentation/bloc/doctor_list/doctor_bloc.dart';
import 'features/presentation/cubits/auth_cubit.dart';
import 'features/presentation/cubits/auth_state.dart';
import 'features/presentation/pages/doctor_list_page.dart';
import 'features/presentation/pages/firebase_auth_page.dart';
import 'features/presentation/theme/theme.dart';
import 'features/presentation/widgets/app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.setUp();

 // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
 // Hive.init(appDocumentDir.path);
   Hive.registerAdapter(DoctorTableAdapter());
   //await Hive.openBox<DoctorTable>('DoctorTable');
  runApp(  MyApps());
}
class MyApps extends StatelessWidget{
   MyApps({Key? key}) : super(key: key);
final Future<FirebaseApp> initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<DoctorBloc>(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Bima App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: FutureBuilder(
          future: initialization,
          builder: (context,snapshot){
            if(snapshot.hasError){
              print('Error');
            }
            if(snapshot.connectionState == ConnectionState.done){
              return  BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (oldState, newState) {
            return oldState is AuthInitialState;
            },
            builder: (context, state) {
            if (state is AuthLoggedInState) {
            return const TestClass();
            } else if (state is AuthLoggedOutState) {
            return const SignIn();
            } else {
            return const Scaffold();
            }
            },
            )
            ;
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}

class TestClass extends StatefulWidget {
  const TestClass({Key? key}) : super(key: key);


  @override
  State<TestClass> createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

     title: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
       Image.asset('assets/dr_bima.png',
       fit: BoxFit.contain,
       height: 72,),
       Image.asset('assets/bima_icon.png',
       fit: BoxFit.contain,
       height: 72,),],
     ),
        toolbarHeight: 88,

        backgroundColor: Colors.white,
      ),
     body: body(context),
    );
  }

  BlocProvider<DoctorBloc> body(BuildContext context){
    return BlocProvider(
        create: (_) => sl<DoctorBloc>()..add(GetDoctorBlocEvent()),
            child: Column(

              children: [
                Expanded(child: BlocBuilder<DoctorBloc,DoctorBlocState>(

                  builder: (context,state) {
                    if (state is DoctorBlocInitial) {
                      return CircularProgressIndicator();
                    }

                   else if(state is DoctorLoadedState) {
                     return ListView.builder(
                     itemCount: state.listOfDoctors.length,
                     itemBuilder: (context, index){
                       print('Doctor list ${state.listOfDoctors[index].firstName}');
                       return ListTile(
                         subtitle: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             ListTile(
                         leading:CircleAvatar(
                             radius: 30,
                             backgroundImage: NetworkImage(state.listOfDoctors[index].profilePic)),
                           title:  Text(state.listOfDoctors[index].specialization),
                           subtitle:  Text(state.listOfDoctors[index].description)

                           ),
                         ],),
                         trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: () {
                           _navigateToDoctorDetailPage(context,state.listOfDoctors[index]);
                         },),
                         title: Padding(
                           padding:  const EdgeInsets.only(left: 90),
                           child: Text(state.listOfDoctors[index].firstName + ' ' + state.listOfDoctors[index].lastName,
                           ),
                         ),
                       );
                     });
                   } else {
                  return const Text('No data');

                   }
                  },
                ))
              ],
            ),
    );
  }

  void _navigateToDoctorDetailPage(BuildContext context, Doctor listOfDoctor) {
    Navigator.push(context, 
    MaterialPageRoute(
        builder: (context) => DoctorDetailPage(detailsOfDoctor: listOfDoctor,)));
  }
}


//auth
class FirebaseAuthPage extends StatelessWidget {
  const FirebaseAuthPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<DoctorBloc>(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Bima POC',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldState, newState) {
            return oldState is AuthInitialState;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return const TestClass();
            } else if (state is AuthLoggedOutState) {
              return const SignIn();
            } else {
              return const Scaffold();
            }
          },
        ),
      ),
    );
  }
}
