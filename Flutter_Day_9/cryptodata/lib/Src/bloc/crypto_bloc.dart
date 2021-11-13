import 'package:cryptodata/Src/model/crypto_model.dart';
import 'package:cryptodata/Src/resources/repositary.dart';
import 'package:rxdart/rxdart.dart';

class CryptoBloc {
  final _repository = Repository();
  final _cryptoFetch = PublishSubject<CryptoData>();

  Stream<CryptoData> get allCrypto => _cryptoFetch.stream;

  getAllCrypto() async {
    CryptoData cryptoData = await _repository.getAllCrypto();
    _cryptoFetch.sink.add(cryptoData);
  }

  dispose() {
    _cryptoFetch.close();
  }
}

final bloc = CryptoBloc();
