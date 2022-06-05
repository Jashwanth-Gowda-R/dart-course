import 'dart:convert';
import 'package:http/http.dart' as http;

import 'weather.dart';

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

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw WeatherApiException(
          'Error getting weather for location: $locationId');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    final consolidatedWeather = weatherJson['consolidated_weather'] as List;
    if (consolidatedWeather.isEmpty) {
      throw WeatherApiException(
          'Weather data not available for locationId: $locationId');
    }
    return Weather.fromJson(consolidatedWeather[0]);
  }

  Future<Weather> getWeather(String city) async {
    final locationId = await getLocationId(city);
    return fetchWeather(locationId);
  }
}

class WeatherApiException implements Exception {
  const WeatherApiException(this.message);
  final String message;
}
