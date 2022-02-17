import 'dart:convert';
import 'package:bima_application/core/util/constants.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client client;

  ApiClient(this.client);

  dynamic get(Uri uri) async {
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);

    }
  }

}
