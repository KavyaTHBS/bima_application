import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Doctor extends Equatable{
   String first_name = "";
   String last_name = "";
   String specialization = "";
   String description = "";
   String profile_pic = "";
   int id = 0;



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  Doctor( this.first_name,  this.last_name,  this.specialization,  this.description,
       this.profile_pic,  this.id);
}