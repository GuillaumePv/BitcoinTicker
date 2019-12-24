import 'package:flutter/material.dart';

import 'network_helper.dart';

const bitcoinAverageAPI =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class PriceModel {

  PriceModel({@required this.selectedCurrency, @required this.selectedCryptocurrency});

  final String selectedCurrency;
  final String selectedCryptocurrency;

  Future<dynamic> getPriceData() async {
    var url = '$bitcoinAverageAPI/$selectedCryptocurrency$selectedCurrency';
    NetworkHelper networkHelper = NetworkHelper(url);

    var priceData = await networkHelper.getData();

    return priceData;
  }
}
