import 'package:bima_application/features/doctor/data/datasources/binding/tables/doctor_table.dart';
import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:hive/hive.dart';

import 'doctor_local_data_source.dart';

class DoctorLocalDataSourceImpl implements DoctorLocalDataSource{
 // final SharedPreferences sharedPreferences;

  DoctorLocalDataSourceImpl();

  @override
  Future<List<DoctorTable>> getDoctorList() async{
    final Box<DoctorTable> doctorListBox  = await Hive.openBox('DoctorTable');
    final List<DoctorTable> doctorData = doctorListBox.toMap().values.toList();
    doctorData.sort((a, b) => b.rating.compareTo(a.rating));
    return doctorData;
  }



  @override
  Future<void> cacheDoctorList(DoctorTable doctorTable)async {
    final doctorListBox = await Hive.openBox('DoctorTable');
    await doctorListBox.put(doctorTable.id, doctorTable);
  }

  @override
  Future<void> deleteDoctorsList() async {
    // TODO: implement deleteDoctorsList
    final Box<DoctorTable> box = await Hive.openBox('DoctorTable');
    final List<String> boxKeys = await keys;
    await box.deleteAll(boxKeys);
  }

  Future<List<String>> get keys async {
    final Box<DoctorTable> box = await Hive.openBox('DoctorTable');
    final List<String> result = box.keys.map((k) => k.toString()).toList();
    return result;
  }

  @override
  Future<void> updateDoctorsList(List<DoctorModel> doctors) async {
    // TODO: implement updateDoctorsList
    final Map<String, DoctorTable> doctorMap = {
      for (var doctor in doctors)
        doctor.id.toString(): DoctorTable.fromModel(doctor)
    };
    final Box<DoctorTable> box = await Hive.openBox('doctor');
    await box.putAll(doctorMap);  }
}