// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';
  String rateBTC = '?', rateLTC = '?', rateETH = '?';
  NetworkHelper networkHelper = NetworkHelper();
  //rate = await networkHelper.getData(currency);

  // void getData(String currency) async {
  //   //NetworkHelper networkHelper = NetworkHelper();
  //   var value = await networkHelper.getData(currency);
  //   double temp = value['rate'];
  //   rate = temp.toString();
  //   print(rate);
  // }

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  void getExchangeData(String value) async {
    rateBTC = await networkHelper.getData('BTC', value);
    rateETH = await networkHelper.getData('ETH', value);
    rateLTC = await networkHelper.getData('LTC', value);
    setState(() {
      currency = value;
    });
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
        children: <Widget>[
          Padding(
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
                  '1 BTC = $rateBTC $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
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
                  '1 ETH = $rateETH $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
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
                  '1 LTC = $rateLTC $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              // height: 150,
              width: double.infinity,
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: currency,
              items: getDropDownItems(),
              onChanged: (value) {
                getExchangeData(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
