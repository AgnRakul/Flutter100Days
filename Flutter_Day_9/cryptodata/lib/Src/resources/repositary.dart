import 'package:cryptodata/Src/model/crypto_model.dart';
import 'package:cryptodata/Src/resources/crypto_api_provider.dart';

class Repository {
  final cryptoApiProvider = CryptoApiProvider();

  Future<CryptoData> getAllCrypto() => cryptoApiProvider.getCryptoList();
}
