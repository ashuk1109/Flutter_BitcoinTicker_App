// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
//import 'package:flutter_bitcointicker_app/loading_screen.dart';

import 'coin_data.dart';
import 'networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';
  String rateBTC = '?', rateLTC = '?', rateETH = '?';
  dynamic rates = ['?', '?', '?'];

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

  Future getExchangeData(String value) async {
    //NetworkHelper networkHelper = NetworkHelper(value);
    rates = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NetworkHelper(value);
        },
      ),
    ) as List<String>;
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
              color: Color(0xFF62727b),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${rates[0].toString()} $currency',
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
              color: Color(0xFF62727b),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = ${rates[1].toString()} $currency',
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
              color: Color(0xFF62727b),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = ${rates[2].toString()} $currency',
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
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.blueGrey,
            ),
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Color(0xFF263238),
              ),
              child: DropdownButton<String>(
                style: TextStyle(
                  fontSize: 20,
                ),
                icon: Icon(Icons.arrow_drop_down_circle_rounded),
                iconEnabledColor: Color(0xFF37474F),
                elevation: 10,
                value: currency,
                items: getDropDownItems(),
                onChanged: (value) {
                  setState(() {
                    currency = value!;
                  });
                  getExchangeData(currency);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
