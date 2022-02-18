import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Doctor extends Equatable{
   String firstName;
   String lastName;
   String specialization;
   String description;
   String profilePic;
   String rating;
   String primaryContactNo;
   int id;



  @override
  // TODO: implement props
  List<Object?> get props => [firstName, lastName,specialization, description,profilePic, rating, primaryContactNo,id];

  Doctor( {required this.firstName, required this.lastName, required this.specialization, required this.description,
       required this.profilePic, required this.rating,required this.primaryContactNo,required this.id});
}