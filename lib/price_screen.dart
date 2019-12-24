import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'cryptocurrencyRateCard.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String cryptocurrency = 'BTC';
  double exchangeRate;

  void initState() {
    super.initState();
    CoinData();
  }

  void updateUI(String currency) {
    setState(() {
      CryptocurrencyRateCard(selectedCurrency: currency,cryptocurrency: cryptocurrency,);
    });
  }
  

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  //fais les cartes et les exhcanges rates
  List<Widget> getExchangeRates() {
    List<Widget> exchangeRates = [];
    for (String cryptocurrency in cryptoList) {
      var newItem = CryptocurrencyRateCard(
        cryptocurrency: cryptocurrency,
        selectedCurrency: selectedCurrency,
      );
      exchangeRates.add(newItem);
    }
    var picker = Container(
        height: 150.0,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 30.0),
        color: Colors.lightBlue,
        child: Platform.isIOS ? iosPicker() : androidDropDown());
    exchangeRates.add(picker);
    return exchangeRates;
  }

  CupertinoPicker iosPicker() {
    List<Text> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      dropDownItems.add(newItem);
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() async {
          
          selectedCurrency = dropDownItems[selectedIndex].data;
          updateUI(selectedCurrency);
        });
      },
      children: dropDownItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: getExchangeRates(),
      ),
    );
  }
}
