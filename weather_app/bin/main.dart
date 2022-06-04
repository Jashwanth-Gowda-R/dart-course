// import 'weather_api_client.dart';

import 'weather_api_client.dart';

void main(List<String> arguments) async {
  if (arguments.length < 1) {
    print('Syntax: dart lib/main.dart <city name>');
  }
  final city = arguments.first;
  print('Your entered city is : $city');
  final api = WeatherApiClient();
  final locationId = await api.getLocationId(city);
  print(locationId);
}
