
import 'dart:convert';
import 'dart:ffi';
import 'package:trab_criptomoedas/services/request.dart';

import '../enum_coins.dart';

class Moedas{
  Moedas({
    required this.tipoMoeda,
    required this.qtd,
    required this.compra,
    required this.moeda,
});

  Coins tipoMoeda;
  double qtd;
  bool compra;
  String moeda;

  Future <String> requestApi() async{

    final String uri = ('https://www.mercadobitcoin.net/api/$moeda/ticker');
    return await Request.resReq(req: uri);
  }

  Future <String> nomeQq() async{
    var res = await requestApi();
    var rel = json.decode(res);

    try{
      if(compra) {
        double c = qtd / (double.parse(rel['ticker']['buy']));
        return "R\$ $qtd = $moeda $c";
      } else {
        double c = (double.parse(rel['ticker']['sell'])) * qtd;
        return "$moeda $qtd = R\$ $c";
      }
    }catch(FormatException){
      print(FormatException);
    }
    return '';

  }
}