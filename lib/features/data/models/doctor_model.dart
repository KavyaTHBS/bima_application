import 'package:bima_application/features/domain/entities/doctor.dart';

class DoctorModel extends Doctor {
  int id;
  String firstName;
  String lastName;
  String profilePic;
  bool? favorite;
  String primaryContactNo;
  String rating;
  String? emailAddress;
  String? qualification;
  String description;
  String specialization;
  String? languagesKnown;

  DoctorModel(
      {required this.id,
        required this.firstName,
        required this.lastName,
        required this.profilePic,
        this.favorite,
        required this.primaryContactNo,
        required this.rating,
        this.emailAddress,
        this.qualification,
        required this.description,
        required this.specialization,
        this.languagesKnown}): super(id: id, rating: rating, firstName: firstName, lastName: lastName, profilePic: profilePic, primaryContactNo: primaryContactNo, specialization: specialization, description: description);

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
    id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    profilePic: json['profile_pic'],
    favorite: json['favorite'],
    primaryContactNo: json['primary_contact_no'],
    rating: json['rating'],
    emailAddress: json['email_address'],
    qualification: json['qualification'],
    description: json['description'],
    specialization: json['specialization'],
    languagesKnown: json['languagesKnown'],);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_pic'] = profilePic;
    data['favorite'] = favorite;
    data['primary_contact_no'] = primaryContactNo;
    data['rating'] = rating;
    data['email_address'] = emailAddress;
    data['qualification'] = qualification;
    data['description'] = description;
    data['specialization'] =specialization;
    data['languagesKnown'] = languagesKnown;
    return data;
  }
}