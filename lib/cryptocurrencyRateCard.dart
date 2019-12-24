import 'package:flutter/material.dart';
import 'coin_data.dart';

//c'est à cette classe que je dois transférer les datas des prix => faire asynchrone programmation.

class CryptocurrencyRateCard extends StatefulWidget {
  CryptocurrencyRateCard(
      {@required this.cryptocurrency, this.selectedCurrency});

  final String cryptocurrency;
  final String selectedCurrency;

  @override
  _CryptocurrencyRateCardState createState() => _CryptocurrencyRateCardState();
}

class _CryptocurrencyRateCardState extends State<CryptocurrencyRateCard> {
  double exchangeRate;

  void getExchangePrice() {
    setState(() async {
      var exchangeRateData = await CoinData()
          .getPriceData(widget.cryptocurrency, widget.selectedCurrency);
      exchangeRate = exchangeRateData['ask'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.cryptocurrency} = $exchangeRate ${widget.selectedCurrency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
