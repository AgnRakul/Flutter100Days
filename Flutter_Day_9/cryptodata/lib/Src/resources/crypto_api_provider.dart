// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cryptodata/Src/model/crypto_model.dart';
import 'package:http/http.dart' show Client;

class CryptoApiProvider {
  Client client = Client();
  final _apiKey =
      'Enter Your Api';

  Future<CryptoData> getCryptoList() async {
    final response = await client.get(
      Uri.parse(
          'https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=USD&api_key=$_apiKey'),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      return CryptoData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load the Data');
    }
  }
}



// https://www.cryptocompare.com/media/37746407/student.png&api_key=c73f7c0fd4b81ad17f3b63cafbc9626b1e4040c5995c525570eeb6046f193c56


// https://min-api.cryptocompare.com/data/top/totalvolfull?limit=10&tsym=USD&api_key=c73f7c0fd4b81ad17f3b63cafbc9626b1e4040c5995c525570eeb6046f193c56
