import 'package:coin_converter/src/models/conversor.dart';
import 'package:coin_converter/src/widgets/header.dart';
import 'package:coin_converter/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  final Map currencies;
  final Conversor conversor;

  Home({
    @required this.currencies,
    @required this.conversor
  });

  @override
  _HomeState createState() => _HomeState(this.currencies, this.conversor);
}

class _HomeState extends State<Home> {
  final Map currencies;
  final Conversor conversor;

  TextEditingController dollarController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  TextEditingController poundController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController bitCoinController = TextEditingController();
  TextEditingController realController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _HomeState(this.currencies, this.conversor);

  void _resetFields() {
    realController.text = '';
    dollarController.text = '';
    euroController.text = '';
    poundController.text = '';
    pesoController.text = '';
    bitCoinController.text = '';

    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(this._resetFields),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Input(
                TextInputType.number, 
                'BRL', 
                realController,
              ),
              Input(
                TextInputType.number, 
                'USD', 
                dollarController,
              ),
              Input(
                TextInputType.number, 
                'EUR', 
                euroController,
              ),
              Input(
                TextInputType.number, 
                'GBP', 
                poundController,
              ),
              Input(
                TextInputType.number, 
                'ARS', 
                pesoController,
              ),
              Input(
                TextInputType.number, 
                'BTC', 
                bitCoinController,
              ),
            ],
          ),
        )
      )
    );
  }
}
