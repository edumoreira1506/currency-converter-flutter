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
    _calcValues('BRL', '1');

    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcValues(coin, value) {
    Map values = this.conversor.getValues(coin, value);

    dollarController.text = values['USD'];
    euroController.text = values['EUR'];
    poundController.text = values['GBP'];
    pesoController.text = values['ARS'];
    bitCoinController.text = values['BTC'];
    realController.text = values['BRL'];
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
                (text) { _calcValues('BRL', text); }
              ),
              Input(
                TextInputType.number, 
                'USD', 
                dollarController,
                (text) { _calcValues('USD', text); }
              ),
              Input(
                TextInputType.number, 
                'EUR', 
                euroController,
                (text) { _calcValues('EUR', text); }
              ),
              Input(
                TextInputType.number, 
                'GBP', 
                poundController,
                (text) { _calcValues('GBP', text); }
              ),
              Input(
                TextInputType.number, 
                'ARS', 
                pesoController,
                (text) { _calcValues('ARS', text); }
              ),
              Input(
                TextInputType.number, 
                'BTC', 
                bitCoinController,
                (text) { _calcValues('BTC', text); }
              ),
            ],
          ),
        )
      )
    );
  }
}
