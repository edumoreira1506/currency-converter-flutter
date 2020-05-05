import 'package:coin_converter/src/models/conversor.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  final Map currencies;
  final Conversor conversor;

  Home({
    @required this.currencies,
    @required this.conversor
  });

  @override
  Widget build(BuildContext context) {
    return Text('Brabo!');
  }
}
