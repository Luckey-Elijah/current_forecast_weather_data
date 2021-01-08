import 'package:http/http.dart';
import '../utils.dart';
import '../constants.dart' show currentWeatherBaseUrl;

/// Get CurrentWeather JSON string by by city name.
Future<String> byCityName(
  String city, {
  String stateCode,
  String countryCode,
  String apiKey,
  String baseUrl = currentWeatherBaseUrl,
}) async {
  // Throw error on null city
  if (city == null) {
    throw ArgumentError('City name cannot be null.');
  }

  apiKey ??= getSecretKey();

  stateCode = (stateCode == null) ? '' : ',${stateCode}';
  countryCode = (countryCode == null) ? '' : ',${countryCode}';

  var url = baseUrl + '?q=${city}' + stateCode + countryCode + '&appid=$apiKey';
  var res = await get(url);
  var body = '';

  if (res.statusCode == 200) {
    body = res.body;
  } else {
    throw ArgumentError('Made a bad request. Status code ${res.statusCode}.');
  }

  return body;
}

/// Get CurrentWeather JSON string by by City ID
Future<String> byCityId(
  int cityId, {
  String apiKey,
  String baseUrl = currentWeatherBaseUrl,
}) async {
  if (cityId == null) {
    throw ArgumentError('City ID cannot be null.');
  }

  apiKey ??= getSecretKey();

  var url = baseUrl + '?id=$cityId&appid=$apiKey';
  var res = await get(url);
  var body = '';

  if (res.statusCode == 200) {
    body = res.body;
  } else {
    throw ArgumentError('Made a bad request. Status code ${res.statusCode}.');
  }

  return body;
}

// ignore: missing_return
Future<String> byCoordinates(
  double lat,
  double lon, {
  String apiKey,
  String baseUrl = currentWeatherBaseUrl,
}) async {
  if (lat == null || lon == null) {
    throw ArgumentError('Lattitude or longitude cannot be null.');
  }
  apiKey ??= getSecretKey();

  // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  var url = baseUrl + '?lat=$lat&lon=$lon&appid=$apiKey';
  var res = await get(url);
  var body = res.body;

  if (res.statusCode == 200) {
    body = res.body;
  } else {
    throw ArgumentError('Made a bad request. Status code ${res.statusCode}.');
  }
  return body;
}

// ignore: missing_return
Future<String> byZipCode(
  String zip, {
  String countryCode = 'us',
  String apiKey,
  String baseUrl = currentWeatherBaseUrl,
}) async {
  if (zip == null) {
    throw ArgumentError('Zip cannot be null.');
  }
  apiKey ??= getSecretKey();
  countryCode = (countryCode == null) ? '' : ',${countryCode}';

  var url = baseUrl + '?zip=$zip' + countryCode + '&appid=$apiKey';
  var res = await get(url);
  var body = res.body;

  if (res.statusCode == 200) {
    body = res.body;
  } else {
    throw ArgumentError('Made a bad request. Status code ${res.statusCode}.');
  }

  return body;
}
