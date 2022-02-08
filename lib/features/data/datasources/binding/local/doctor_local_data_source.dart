import 'package:bima_application/features/data/datasources/binding/tables/doctor_table.dart';
import 'package:bima_application/features/data/models/doctor_model.dart';

abstract class DoctorLocalDataSource{
  Future<List<DoctorModel>> getDoctorList();
  Future<void> cacheDoctorList(DoctorTable doctorTable);
  Future<void> updateDoctorsList(List<DoctorModel> doctors);
  Future<void> deleteDoctorsList();


}