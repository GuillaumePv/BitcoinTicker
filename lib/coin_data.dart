import 'price.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {

  Future<dynamic> getPriceData(String selectCryptocurrency, String selectedCurrency) async {
    PriceModel priceModel = PriceModel(
        selectedCurrency: selectedCurrency,
        selectedCryptocurrency: selectCryptocurrency);
    var priceData = await priceModel.getPriceData();
    return priceData;
  }

}
