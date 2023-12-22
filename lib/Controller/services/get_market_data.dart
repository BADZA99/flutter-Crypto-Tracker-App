import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:crypto_gen/Controller/services/API/api.dart';
import 'package:http/http.dart' as http;

class API{
  static Future getCryptoMarketData() async{
    final api=Uri.parse(cryptoMarketDataAPI);
    try{
      var response = await http
          .get(api,headers: {'content-type':'application/json'}).timeout(
          const Duration(seconds: 60),onTimeout: (){
            throw TimeoutException("connection time out");
          });
          log(response.statusCode.toString());
          if (response.statusCode==200) {
            var decodedResponse=jsonDecode(response.body);
            log(decodedResponse.toString());
            List<dynamic> products =decodedResponse as  List<dynamic> ;
            return products;
            
          }
    }
    catch(e){
      log(e.toString());
    }



  }
}