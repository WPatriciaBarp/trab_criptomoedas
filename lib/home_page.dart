import 'package:flutter/material.dart';
import 'models/moedas.dart';
import 'widgets/my_radio_button_compra_venda.dart';
import 'widgets/my_radio_button.dart';
import 'enum_coins.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool compra;
  late Obj tipoMoeda;
  late double qtd;
  CompraVenda cv = CompraVenda();
  final TextEditingController _controllerQtd = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    tipoMoeda = Obj();
    tipoMoeda.coin = Coins.LTC;
    cv.setComprar(true);

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.titulo,
            //"Conversor de Moedas",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children:[
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controllerQtd,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.quantidade),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return AppLocalizations.of(context)!.campovazio;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyRadioButtonCompraVenda(compra:cv),
                Divider(
                  thickness: 5,
                ),
                MyRadioButton(coin:tipoMoeda),
                Divider(
                  thickness: 5,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black87,
                        primary: Colors.grey[300],
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(horizontal: 68),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                      ),
                      onPressed: () {
                        if(_formKey.currentState!.validate())
                          _calcValor();},
                      child: Text(AppLocalizations.of(context)!.consultar),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black87,
                        primary: Colors.grey[300],
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(horizontal: 68),

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                      ),
                      onPressed: () {_limpar();},
                      child: Text(AppLocalizations.of(context)!.limpar),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Future <void> _calcValor() async {
    try{
      Moedas moeda = Moedas(
          tipoMoeda: tipoMoeda.coin,
          moeda: tipoMoeda.tipo(),
          qtd: double.parse(_controllerQtd.text),
          compra: cv.compra);
      var t = await moeda.nomeQq();
      _controllerQtd.text = t;

    }catch(err){
      print(err);
    }
  }

  void _limpar(){
    setState(() {
      _controllerQtd.text = '';
    });
  }
}
