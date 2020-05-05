import 'package:coin_converter/src/models/conversor.dart';
import 'package:coin_converter/src/screens/home.dart';
import 'package:coin_converter/src/services/currencies.dart';
import 'package:flutter/material.dart';

Future main() async {
  Map currencies = await getCurrencies();
  Conversor conversor = Conversor(currencies);

  runApp(MaterialApp(
    home: Home(currencies: currencies, conversor: conversor)
  ));
}
