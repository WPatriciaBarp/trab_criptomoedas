import 'package:flutter/material.dart';
import '../enum_coins.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyRadioButtonCompraVenda extends StatefulWidget{
  const MyRadioButtonCompraVenda({Key? key, required this.compra}) :super(key: key);
  final CompraVenda compra;

  @override
  State<MyRadioButtonCompraVenda> createState() => _MyRadioButtonCompraVendaState();
}

class _MyRadioButtonCompraVendaState extends State<MyRadioButtonCompraVenda>{

  @override
  Widget build(BuildContext context) {
    // widget.coin.coin = Coins.LTC;
    return Row(
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: Text(AppLocalizations.of(context)!.comprar),
            leading: Radio<bool>(
              value: true,
              groupValue: widget.compra.compra,
              onChanged: (bool? value) {
                setState(() {
                  widget.compra.compra = value!;
                });
              },
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            title: Text(AppLocalizations.of(context)!.vender),
            leading: Radio<bool>(
              value: false,
              groupValue: widget.compra.compra,
              onChanged: (bool? value) {
                setState(() {
                  widget.compra.compra = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

