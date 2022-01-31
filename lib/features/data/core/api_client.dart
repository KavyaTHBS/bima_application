import 'dart:convert';

import 'package:http/http.dart';

class ApiClient {
  final Client _client;
    final String apiUri = "https://5efdb0b9dd373900160b35e2.mockapi.io/contacts";

  ApiClient(this._client);

  dynamic get() async {
    final response = await _client.get(Uri.parse(apiUri)
    );

    if (response.statusCode == 200) {
      print('response body: $response.body');

      return json.decode(response.body);
    } else {
      print('exception : $response');

      throw Exception(response.reasonPhrase);

    }
  }


  // Uri getPath(String path, Map<dynamic, dynamic>? params) {
  //   var paramsString = '';
  //   if (params?.isNotEmpty ?? false) {
  //     params?.forEach((key, value) {
  //       paramsString += '&$key=$value';
  //     });
  //   }

  //   return Uri.parse(
  //       '${apiUri}$path?api_key=${ApiConstants.API_KEY}$paramsString');
  // }
}
