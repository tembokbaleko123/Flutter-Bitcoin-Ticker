import 'package:bitcoin_2/model%20dan%20convert/model.dart';
import 'package:flutter/material.dart';

FutureBuilder<DataClass?> masaDepanBuilder(
    Future<DataClass> coin, String namaCoin) {
  return FutureBuilder(
      future: coin,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DataClass isiData = snapshot.data!;
          return newMethod(isiData, namaCoin);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      });
}

Card newMethod(DataClass isiData, String coin) {
  return Card(
    color: Colors.lightBlueAccent,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 9.0),
      child: Text(
        '1 $coin = ${isiData.rate} ${isiData.assetIdQuote}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    ),
  );
}
