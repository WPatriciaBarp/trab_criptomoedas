enum Coins{BTC, LTC, ADA, UNI, USDC}

class Obj{
  Coins coin = Coins.BTC;

  String tipo(){
    if(coin == Coins.BTC)
      return 'BTC';
    if(coin == Coins.LTC)
      return 'LTC';
    if(coin == Coins.USDC)
      return 'USDC';
    if(coin == Coins.UNI)
      return 'UNI';
    if(coin == Coins.ADA)
      return 'ADA';

    return '';
  }
}

class CompraVenda{
  late bool compra;
  setComprar(bool praComprar){
    compra = praComprar;
  }
}