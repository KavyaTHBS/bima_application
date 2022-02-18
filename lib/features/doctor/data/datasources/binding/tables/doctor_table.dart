import 'dart:convert';

import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'doctor_table.g.dart';

@HiveType(typeId: 0)
class DoctorTable extends Equatable {
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

  DoctorTable(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.profilePic,
      required this.primaryContactNo,
      required this.rating,
      required this.description,
      required this.specialization})
      : super();

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

  Doctor toEntity(DoctorTable table) => Doctor(
      id: table.id,
      firstName: table.firstName,
      lastName: table.lastName,
      profilePic: table.profilePic,
      primaryContactNo: table.primaryContactNo,
      specialization: table.specialization,
      rating: table.rating,
      description: table.description);

  factory DoctorTable.fromEntity(Doctor entity) => DoctorTable(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      profilePic: entity.profilePic,
      primaryContactNo: entity.primaryContactNo,
      rating: entity.rating,
      description: entity.description,
      specialization: entity.specialization);

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic,
        'primaryContactNo': primaryContactNo,
        'specialization': specialization,
        'rating': rating,
        'description': description
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        profilePic,
        primaryContactNo,
        specialization,
        rating,
        description
      ];
}
