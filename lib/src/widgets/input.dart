import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Input extends StatelessWidget {
  final TextInputType type;
  final String labelText;
  final TextEditingController controller;

  Input(this.type, this.labelText, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
        labelText: this.labelText,
        labelStyle: TextStyle(
          color: Colors.lightBlue
        )
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.lightBlue,
        fontSize: 25
      ),
      controller: controller,
    );
  }
}
