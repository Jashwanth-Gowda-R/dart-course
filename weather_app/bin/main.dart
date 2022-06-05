// import 'weather_api_client.dart';

import 'weather_api_client.dart';
import 'dart:io';

void main(List<String> arguments) async {
  if (arguments.length < 1) {
    print('Syntax: dart lib/main.dart <city name>');
  }
  final city = arguments.first;
  print('Your entered city is : $city');
  final api = WeatherApiClient();
  // // final locationId = await api.getLocationId(city);
  // // print(locationId);
  // final weather = api.getWeather(city);
  // print(weather);
  try {
    final weather = await api.getWeather(city);
    print(weather);
  } on WeatherApiException catch (e) {
    print(e.message);
  } on SocketException catch (_) {
    print('Could not fetch data. Check your connection.');
  } catch (e) {
    print(e);
  }
}
