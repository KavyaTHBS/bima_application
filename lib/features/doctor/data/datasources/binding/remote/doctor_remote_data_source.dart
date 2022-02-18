import 'package:bima_application/features/doctor/data/models/doctor_model.dart';

abstract class DoctorRemoteDataSource{

  Future<List<DoctorModel>> getDoctorList();
}