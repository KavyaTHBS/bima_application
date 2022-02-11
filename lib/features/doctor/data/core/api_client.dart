import 'dart:convert';
import 'package:bima_application/core/util/constants.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get() async {
    final response = await _client.get(Uri.parse(Constants.apiUri)
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);

    }
  }

}
