import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> getCurrencies() async {
  String requestUrl = await getRequestUrl();

  http.Response response = await http.get(requestUrl);

  Map<String, dynamic> parsedResponse = json.decode(response.body);
  Map<String, dynamic>  currencies = parsedResponse['results']['currencies'];

  currencies.remove('source');
  
  return currencies;
}

Future<String> getRequestUrl() async {
  await DotEnv().load('.env');

  String hgBrasilKey = DotEnv().env['HG_BRASIL_KEY'];
  String requestUrl = "https://api.hgbrasil.com/finance?format=json&key=$hgBrasilKey";

  return requestUrl;
}
