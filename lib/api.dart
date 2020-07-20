import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<ApiGlobal> fetchApiGlobal() async {
  final response = await http.get(
      'https://api.apify.com/v2/key-value-stores/pp4Wo2slUJ78ZnaAi/records/LATEST?disableRedirect=true');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ApiGlobal.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

class ApiGlobal {
  final int infected;
  final int hospital;
  final int recovered;
  final int deceased;
  final String lastUpdatedSource;
  final String lastUpdatedApi;

  ApiGlobal(
      {this.infected,
      this.hospital,
      this.recovered,
      this.deceased,
      this.lastUpdatedSource,
      this.lastUpdatedApi});

  factory ApiGlobal.fromJson(Map<String, dynamic> json) {
    return ApiGlobal(
      infected: json['infected'],
      hospital: json['hospitalized'],
      recovered: json['recovered'],
      deceased: json['deceased'],
      lastUpdatedApi: json["lastUpdatedAtApify"],
      lastUpdatedSource: json["lastUpdatedAtSource"],
    );
  }
}
