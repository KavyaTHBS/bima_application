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
import 'features/presentation/pages/doctor_list_page.dart';
import 'features/presentation/widgets/app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
 await di.setUp();

 // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
 // Hive.init(appDocumentDir.path);
   Hive.registerAdapter(DoctorTableAdapter());
   //await Hive.openBox<DoctorTable>('DoctorTable');
  runApp( const MyApps());
}
class MyApps extends StatelessWidget{
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<DoctorBloc>(),
      child: MaterialApp(
        title: "bima app",
    theme: ThemeData(
    primaryColor: Colors.blue,
      primaryColorDark: Colors.blueAccent,
      accentColor: Colors.orangeAccent,
    ),
        home: const TestClass(),
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
