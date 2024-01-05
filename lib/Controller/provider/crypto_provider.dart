import "dart:async";
import "package:crypto_gen/Model/crypto_data_model.dart";
import 'package:flutter/cupertino.dart';
import '../services/get_market_data.dart';

class CryptoDataProvider extends ChangeNotifier {
  bool isLoading=true;
  List<CryptoDataModel> markets = [];

  CryptoDataProvider(){
    fetchData();
  }

  Future<void> fetchData() async {
    // isLoading=true;
    List<dynamic> markets = await API.getCryptoMarketData();

    List<CryptoDataModel> temp=[];
    for(var market in markets){
      CryptoDataModel newCrypto=CryptoDataModel.fromJSON(market);
      temp.add(newCrypto);

    }

    markets=temp;
    isLoading=false;
    notifyListeners();
  }
}
