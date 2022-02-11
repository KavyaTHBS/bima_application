import 'package:bima_application/features/doctor/data/core/api_client.dart';
import 'package:bima_application/features/doctor/data/models/doctor_model.dart';

import 'doctor_remote_data_source.dart';

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource{
 final ApiClient client;
  DoctorRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DoctorModel>> getDoctorList() async {
    final response = await client.get();
    final doctorList = List.from(response).map((e) => DoctorModel.fromJson(e)).toList();
    doctorList.sort((a, b) => b.rating.compareTo(a.rating));
    return doctorList;
  }


}