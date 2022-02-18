import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget{
  final Doctor detailsOfDoctor;
  const DoctorDetailPage({Key? key, required this.detailsOfDoctor,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    //  backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
    // leading: IconButton(
    //   icon: Icon(Icons.arrow_back,
    //       color: Colors.amber,
    //     ),
    //   onPressed: () {
    //
    //   },
    // ),

      ),
       body:Column(

         children:<Widget> [
           Expanded(
             child: Container(
               decoration: const BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
              ),
               ),
              child: doctorImages(),

             ),

           ),
           FractionallySizedBox(
             widthFactor: 1,
             child: Container(
             decoration: const BoxDecoration(color: Colors.white),
               child: Text(detailsOfDoctor.firstName+' '+detailsOfDoctor.lastName,
               textAlign: TextAlign.center,
               style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold,)),

             ),
           ),
           Padding(
             padding: EdgeInsets.all(10.0),
             child: RaisedButton(
              onPressed: () {  },
               color: Colors.cyan,
             child: Text('Edit Profile'),
             ),
           ),
           personalDetails(),



         ],
       ),




      //Text(detailsOfDoctor.firstName),
    );
  }

  doctorImages() {
    return Positioned(
      top: 0.0,
        left: 100.0,
       // right: 100.0,


          child:Container(
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(fit:BoxFit.fill,
                  image: NetworkImage(detailsOfDoctor.profilePic)

              ),
          ),


          ),

        );
  }

  personalDetails() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          color: Colors.grey[350],

          child: Column(
          children:<Widget> [
            Container(
            decoration: BoxDecoration(
              color: Colors.grey[350]
            ),
            child: const Text('Personal details',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
          ),


             Card(
              elevation: 10,
              child: ListTile(
                title:  Text('FIRST NAME'),
                subtitle: Text(detailsOfDoctor.firstName),
              ),

            ),Card(
              elevation: 10,
              child: ListTile(
                title:  Text('LAST NAME'),
                subtitle: Text(detailsOfDoctor.lastName),
              ),

            ),const Card(
              elevation: 10,
              child: ListTile(
                title:  Text('GENDER'),
                subtitle: Text('-'),
              ),

            ),Card(
              elevation: 10,
              child: ListTile(
                title:  Text('CONTACT NUMBER'),
                subtitle: Text(detailsOfDoctor.primaryContactNo),
              ),

            ),
            Container(
              decoration: BoxDecoration(
              ),
              child: const Text('DATE OF BIRTH',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.grey,fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
            DateOfBirth(),

    ],
        ),

      ),

    );
  }






}
class DateOfBirth extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children:  [
          const Card(
            
        color: Colors.cyan,
            child: Text('date')
            
          ),
          Container(
          color: Colors.cyan,
        padding: EdgeInsets.all(30.0),
      child: Text('container'),
      ),        Container(

      color: Colors.cyan,
      padding: EdgeInsets.all(30.0),
      child: Text('container'),
          ),
       /* Card(
      elevation: 10,
      child: ListTile(
      title:  Text('DAY',
      style:TextStyle(color: Colors.grey) ,),
      subtitle: Text('28'),
      ),
      ),
      Card(
elevation: 10,
child: ListTile(
title:  Text('MONTH',
style:TextStyle(color: Colors.grey) ,),
subtitle: Text('JUNE'),
),
),
Card(
elevation: 10,
child: ListTile(
title:  Text('YEAR',
style:TextStyle(color: Colors.grey) ,),
subtitle: Text('1985'),
),
),*/
        ],

      ),
    );
  }
}
// Row(
// children: const <Widget>[
// Card(
// elevation: 10,
// child: ListTile(
// title:  Text('DAY',
// style:TextStyle(color: Colors.grey) ,),
// subtitle: Text('28'),
// ),
// ),
// Card(
// elevation: 10,
// child: ListTile(
// title:  Text('MONTH',
// style:TextStyle(color: Colors.grey) ,),
// subtitle: Text('JUNE'),
// ),
// ),
// Card(
// elevation: 10,
// child: ListTile(
// title:  Text('YEAR',
// style:TextStyle(color: Colors.grey) ,),
// subtitle: Text('1985'),
// ),
// ),
// ],
// ),


