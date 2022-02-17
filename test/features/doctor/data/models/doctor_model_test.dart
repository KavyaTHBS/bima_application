import 'dart:convert';

import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_resources/fixtures.dart';

void main() {
  final doctorModel = DoctorModel(
      id: 1,
      firstName: 'Amitabh',
      lastName: 'Bachchan',
      profilePic:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indian_actor_Amitabh_Bachchan.jpg/440px-Indian_actor_Amitabh_Bachchan.jpg',
      favorite: false,
      primaryContactNo: '+919793380800',
      rating: '3.5',
      emailAddress: 'ab@email.com',
      qualification:
          'BSc Medical Sciences (2006), MBChB (2010), LLB Bachelor of Laws (2015)',
      description:
          'Meet Dr. Amitabh, our Chief Medical Officer. Dr. Amitabh completed his medical training at University of India Medical School and has practiced medicine for over 8 years. His passion is to reach out to every Indiaian with quality medical information and care and this is why he loves telemedicine. He enjoys reading, watching movies and listening to music.',
      specialization: 'General Practice',
      languagesKnown: 'English, Hindi, Kannada');

  test('should be a subclass of Doctor entity', () async {
    //Assert
    expect(doctorModel, isA<DoctorModel>());
  });
  group('doctor details from json', () {
    test('should return a doctor model from JSON', () async {
    //Arrange
      final Map<String, dynamic> jsonData =
          json.decode(fixture('doctor_detail.json')) as Map<String, dynamic>;
    //Act
      final DoctorModel response = DoctorModel.fromJson(jsonData);
      expect(response, doctorModel);
    });
  });

  group('doctor details to json', () {
    test('should return json map containing actual data', () async {
    //Act
      final Map<String, dynamic> response = doctorModel.toJson();
    //Assert
      final responseExpected = {
        'id': 1,
        'first_name': 'Amitabh',
        'last_name': 'Bachchan',
        'profile_pic':
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indian_actor_Amitabh_Bachchan.jpg/440px-Indian_actor_Amitabh_Bachchan.jpg',
        'favorite': false,
        'primary_contact_no': '+919793380800',
        'rating': '3.5',
        'email_address': 'ab@email.com',
        'qualification':
            'BSc Medical Sciences (2006), MBChB (2010), LLB Bachelor of Laws (2015)',
        'description':
            'Meet Dr. Amitabh, our Chief Medical Officer. Dr. Amitabh completed his medical training at University of India Medical School and has practiced medicine for over 8 years. His passion is to reach out to every Indiaian with quality medical information and care and this is why he loves telemedicine. He enjoys reading, watching movies and listening to music.',
        'specialization': 'General Practice',
        'languagesKnown': 'English, Hindi, Kannada'
      };
      expect(response, responseExpected);
    });
  });
}
