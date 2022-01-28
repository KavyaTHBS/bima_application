import 'package:bima_application/features/data/datasources/binding/local/doctor_local_data_source.dart';
import 'package:bima_application/features/data/models/doctor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorLocalDataSourceImpl implements DoctorLocalDataSource{
  final SharedPreferences sharedPreferences;

  DoctorLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<List<DoctorModel>> getDoctorList(){
    return null!;
  }



  @override
  Future<void> cacheDoctorList(List<DoctorModel> doctorListToCache) {
return null!;
  }
}