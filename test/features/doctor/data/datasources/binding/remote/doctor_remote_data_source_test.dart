import 'dart:convert';
import 'dart:io';
import 'package:bima_application/core/util/constants.dart';
import 'package:bima_application/features/doctor/data/datasources/binding/remote/doctor_remote_data_source_impl.dart';
import 'package:bima_application/features/doctor/data/models/doctor_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import '../../../../../../test_resources/fixtures.dart';
import 'doctor_remote_data_source_test.mocks.dart';

@GenerateMocks([
  http.Client
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient, returnNullOnMissingStub: true),
])
void main() {
  late DoctorRemoteDataSourceImpl doctorRemoteDataSourceImpl;
  late MockHttpClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockHttpClient();
    doctorRemoteDataSourceImpl =
        DoctorRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('fetchDoctorList', () {
    final doctorListModel = List<DoctorModel>.from(
        (json.decode(fixture('doctors_list.json')) as List)
            .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>)));
    doctorListModel.sort((a, b) => b.rating.compareTo(a.rating));

    test(
        'returns all the list of doctors if the http call completes successfully',
        () async {
//arrange
      when(mockHttpClient.get(any)).thenAnswer((_) async =>
          http.Response(fixture('doctors_list.json'), 200, headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          }));
      //Act
      await doctorRemoteDataSourceImpl.getDoctorList();

      //Assert
      //  verify(mockHttpClient.get(Uri.parse(Constants.apiUri)));
      verify(mockHttpClient.get(Uri.parse(Constants.apiUri)));
    });

    test('returns a list of doctorModel when response code is 200', () async {
//arrange
      when(mockHttpClient.get(any)).thenAnswer((_) async =>
          http.Response(fixture('doctors_list.json'), 200, headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          }));
      //Act
      final response = await doctorRemoteDataSourceImpl.getDoctorList();

      //Assert
      expect(response, equals(doctorListModel));
    });

    test('when list of doctorModel response code is not 200', () async {
//arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      //Act
      final responseCall = doctorRemoteDataSourceImpl.getDoctorList();

      //Assert
      expect(() => responseCall, throwsA(const TypeMatcher<Exception>()));
    });
  });
}
