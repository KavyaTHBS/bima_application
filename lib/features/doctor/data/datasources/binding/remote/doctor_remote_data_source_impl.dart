import 'dart:convert';

import 'package:bima_application/features/doctor/data/core/api_client.dart';
import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../../core/util/constants.dart';
import 'doctor_remote_data_source.dart';

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource{
 //final ApiClient client;
  final http.Client client;
  DoctorRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DoctorModel>> getDoctorList() async {
    final response = await client.get(Uri.parse(Constants.apiUri));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final doctorList = List.from(result).map((e) => DoctorModel.fromJson(e)).toList();
      doctorList.sort((a, b) => b.rating.compareTo(a.rating));
      return doctorList;
    }else{
      throw Exception(response.reasonPhrase);
    }
   /* final response = await client.get(Uri.parse(Constants.apiUri));
    final doctorList = List.from(response).map((e) => DoctorModel.fromJson(e)).toList();
    doctorList.sort((a, b) => b.rating.compareTo(a.rating));
    return doctorList;*/
  }


}