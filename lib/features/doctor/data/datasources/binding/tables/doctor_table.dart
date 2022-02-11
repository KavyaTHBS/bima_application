import 'dart:convert';

import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:hive/hive.dart';
part 'doctor_table.g.dart';

@HiveType(typeId: 0)
class DoctorTable extends DoctorModel {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String firstName;

  @HiveField(2)
  late String lastName;

  @HiveField(3)
  late String profilePic;

  @HiveField(4)
  late String primaryContactNo;

  @HiveField(5)
  late String rating;

  @HiveField(6)
  late String description;

  @HiveField(7)
  late String specialization;

  DoctorTable({required this.id, required this.firstName, required this.lastName,
  required this.profilePic, required this.primaryContactNo, required this.rating,
    required this.description, required this.specialization}) : super(id: id,
  firstName: firstName, lastName: lastName,
   profilePic: profilePic, primaryContactNo: primaryContactNo,
  rating: rating, description: description, specialization: specialization);



  factory DoctorTable.fromModel(DoctorModel model) => DoctorTable(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
      profilePic: model.profilePic,
      specialization: model.specialization,
      description: model.description,
      rating: model.rating,
      primaryContactNo: model.primaryContactNo);

  static DoctorModel toModel(DoctorTable table) => DoctorModel(
      id: table.id,
      firstName: table.firstName,
      lastName: table.lastName,
      profilePic: table.profilePic,
      specialization: table.specialization,
      description: table.description,
      rating: table.rating,
  primaryContactNo: table.primaryContactNo);


}