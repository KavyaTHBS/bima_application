import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/di.dart' as di;
import 'core/config/di.dart';
import 'features/presentation/bloc/doctor_list/doctor_bloc.dart';
import 'features/presentation/pages/doctor_list_page.dart';
import 'features/presentation/widgets/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
 await di.setUp();
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
    primarySwatch: Colors.blue,
    ),
        home: const TestClass(),
      ),
    );
  }

}

class TestClass extends StatelessWidget {
  const TestClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                           Text(state.listOfDoctors[index].specialization),
                           Text(state.listOfDoctors[index].description)
                         ],),
                         trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: () {},),
                         title: Text(state.listOfDoctors[index].firstName + ' ' + state.listOfDoctors[index].lastName),);
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
}
