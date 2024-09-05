import 'dart:io';

import 'package:bitcoin_2/model%20dan%20convert/coin_data.dart';
import 'package:bitcoin_2/model%20dan%20convert/model.dart';
import 'package:bitcoin_2/service/network.dart';
import 'package:bitcoin_2/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Network network = Network();
  late Future<DataClass> btcData;
  late Future<DataClass> ethData;
  late Future<DataClass> ltcData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(); //memanggil fungsi get data
    print(selectedCurrency);
  }

  String selectedCurrency = 'USD';

  void getData() {
    setState(() {
      btcData = network.fetchData(selectedCurrency, 'BTC');
      ethData = network.fetchData(selectedCurrency, 'ETH');
      ltcData = network.fetchData(selectedCurrency, 'LTC');
    });
  }

  //Function untuk IOS dropDownItem
  CupertinoPicker iosPicker() {
    //Untuk tempat menampung hasil dari list
    List<Widget> pickerData = [];
    for (var element in currenciesList) {
      element;
      pickerData.add(Text(element));
    }
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCurrency = index.toString();
          getData();
          print(index);
        });
      },
      children: pickerData,
    );
  }

  //Function untuk membuat dropDownItem Android
  DropdownButton<String> andriodPicker() {
    //variabel untuk menyimpan data dari hasil
    List<DropdownMenuItem<String>> tempatSimpanList = [];

    for (var element in currenciesList) {
      element;
      var newItems = DropdownMenuItem(value: element, child: Text(element));
      tempatSimpanList.add(newItems);
    }
    return DropdownButton(
      value: selectedCurrency,
      items: tempatSimpanList,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getData();
        });
      },
    );
  }

  Widget deviceSelector() {
    if (Platform.isAndroid) {
      return andriodPicker();
    } else if (Platform.isIOS) {
      return iosPicker();
    }
    return bukanKeduaDeviceTersebut();
  }

  Widget bukanKeduaDeviceTersebut() {
    return Text('Bukan Dari Kedua Device Tersebut');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                masaDepanBuilder(btcData, 'BTC'),
                masaDepanBuilder(ethData, 'ETH'),
                masaDepanBuilder(ltcData, 'LTC')
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: deviceSelector(),
          ),
        ],
      ),
    );
  }
}
  

// FutureBuilder(
//                 future: data,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Text('1 BTC = ${snapshot.data!.price} USD',
//                     style: const TextStyle(fontSize: 20, color: Colors.white),);


// return Card(
//                   color: Colors.lightBlueAccent,
//                   elevation: 5.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 9.0),
//                     child: Text(
//                       '1 BTC = ?USD',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 );