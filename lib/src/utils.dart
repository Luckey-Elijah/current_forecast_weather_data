import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

/// Fetches the API Key from the selected path.
String getSecretKey({String path = 'secrets.yaml'}) {
  var file = File(path);
  var key = '';
  if (file?.existsSync() == true) {
    var doc = loadYaml(file.readAsStringSync());
    key = doc['open_weather_api_key'] ??
        (throw ArgumentError('open_weather_api_key does not exist'));
  } else {
    throw PathException('File does not exist.');
  }
  return key;
}

/// Formats contents of a JSON body response [source] nicely.
String prettyJson(String source) {
  var map = json.decode(source);

  var encoder = JsonEncoder.withIndent('    ');

  var pretty = encoder.convert(map);

  return pretty;
}
