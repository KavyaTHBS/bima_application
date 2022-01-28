import 'package:bima_application/features/data/core/api_client.dart';
import 'package:bima_application/features/data/datasources/binding/remote/doctor_remote_data_source.dart';
import 'package:bima_application/features/data/models/doctor_model.dart';

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource{
  final ApiClient client;
  DoctorRemoteDataSourceImpl(this.client);

  @override
  Future<List<DoctorModel>> getDoctorList() async {
    final response = await client.get();
    final doctorList = DoctorModel.fromJson(response).movies;
    return doctorList;
  }


}