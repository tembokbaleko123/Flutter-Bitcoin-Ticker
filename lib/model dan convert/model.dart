import 'dart:convert';

DataClass dataClassFromJson(String str) => DataClass.fromJson(json.decode(str));

String dataClassToJson(DataClass data) => json.encode(data.toJson());

class DataClass {
  DateTime time;
  String assetIdBase;
  String assetIdQuote;
  double rate;

  DataClass({
    required this.time,
    required this.assetIdBase,
    required this.assetIdQuote,
    required this.rate,
  });

  factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
        time: DateTime.parse(json["time"]),
        assetIdBase: json["asset_id_base"],
        assetIdQuote: json["asset_id_quote"],
        rate: json["rate"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "asset_id_base": assetIdBase,
        "asset_id_quote": assetIdQuote,
        "rate": rate,
      };
}
