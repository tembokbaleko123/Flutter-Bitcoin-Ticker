import 'dart:convert';
import 'package:bitcoin_2/model%20dan%20convert/model.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic>? data;

const String apiKey = ''; //Your api Key
const String link = ''; //Your link web api

class Network {
  Future<DataClass> fetchData(String selectedCurrency, coin) async {
    final url =
        '$link/$coin/$selectedCurrency?apikey=$apiKey'; // Ganti dengan URL API Anda
    // Mengirimkan permintaan GET
    final response = await http.get(Uri.parse(url));

    // Memeriksa status code
    if (response.statusCode == 200) {
      // Jika permintaan berhasil, decode JSON
      data = jsonDecode(response.body);
      // Tampilkan data di console
      print(data);
      return DataClass.fromJson(data!);
      //untuk mengakses data dari map
    } else {
      // Jika status code tidak 200, tampilkan pesan error
      throw Exception('Failed to load data');
    }
    // Map<String, dynamic> jsonMap = data!;
  }
}
