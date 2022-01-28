import 'package:bima_application/features/data/models/doctor_model.dart';

abstract class DoctorLocalDataSource{
  Future<List<DoctorModel>> getDoctorList();

  Future<void> cacheDoctorList(List<DoctorModel> doctorListToCache);

 }