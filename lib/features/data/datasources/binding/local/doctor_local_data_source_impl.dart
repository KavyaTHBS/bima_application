import 'package:bima_application/features/data/datasources/binding/local/doctor_local_data_source.dart';
import 'package:bima_application/features/data/datasources/binding/tables/doctor_table.dart';
import 'package:bima_application/features/data/models/doctor_model.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorLocalDataSourceImpl implements DoctorLocalDataSource{
 // final SharedPreferences sharedPreferences;

  DoctorLocalDataSourceImpl();

  @override
  Future<List<DoctorTable>> getDoctorList() async{
    final doctorListBox  = await Hive.openBox('DoctorTable');
    final ids = doctorListBox.keys;
    List<DoctorTable> doctorList = [];

    ids.forEach((doctorId) {
      final doctor = doctorListBox.get(doctorId);
      if (doctor != null) {
        doctorList.add(doctorListBox.get(doctorId));
      }
    });
    return doctorList;  }



  @override
  Future<void> cacheDoctorList(DoctorTable doctorTable)async {
    final doctorListBox = await Hive.openBox('DoctorTable');
    await doctorListBox.put(doctorTable.id, doctorTable);
  }
}