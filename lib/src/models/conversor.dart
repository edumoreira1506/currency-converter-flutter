class Conversor {
  static const coins = const ['BRL', 'EUR', 'GBP', 'ARS', 'BTC', 'USD'];

  static const BRL_CODE = 'BRL';
  static const EUR_CODE = 'EUR';
  static const GBP_CODE = 'GBP';
  static const ARS_CODE = 'ARS';
  static const BTC_CODE = 'BTC';
  static const USD_CODE = 'USD';

  Map _currencies;

  Conversor(Map currencies) {
    _currencies = currencies;
  }

  Map getValues(coin, value) {
    if (coin == BRL_CODE) return _getValuesByReal(value);

    var values = new Map();
    var baseValue = double.tryParse(value) ?? 0;

    values[BRL_CODE] = baseValue / _currencies[coin]['buy'];

    _currencies.forEach((key, item) {
      if (key == coin) {
        values[key] = baseValue.toStringAsPrecision(3);
      } else {
        values[key] = (values[BRL_CODE] * item['buy']).toStringAsPrecision(3);
      }
    });

    values[BRL_CODE] = values[BRL_CODE].toStringAsPrecision(3);

    return values;
  }

  Map _getValuesByReal (value) {
    var baseValue = double.tryParse(value) ?? 0;
    var values = new Map();

    _currencies.forEach((key, value) {
      values[key] = (baseValue / value['buy']).toStringAsPrecision(3);
    });

    values[BRL_CODE] = baseValue.toStringAsPrecision(3);

    return values;
  }
}
