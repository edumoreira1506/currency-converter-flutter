import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  final String hgBrasilKey;

  Home(this.hgBrasilKey);

  @override
  Widget build(BuildContext context) {
    return Text(this.hgBrasilKey);
  }
}
