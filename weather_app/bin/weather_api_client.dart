import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'www.metaweather.com';
  static const searchUrl = '/api/location/search';

  Future<int> getLocationId(String city) async {
    var url = Uri.https(baseUrl, searchUrl, {'query': '${city}'});
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception(
          'Error getting locationId for $city, ${response.statusCode}');
    }
    final responseJson = jsonDecode(response.body) as List;
    print('Returned data: $responseJson');
    final locationId = responseJson.first['woeid'] as int;
    return locationId;
  }
}
