import 'package:flutter/material.dart';
import '../enum_coins.dart';

class MyRadioButton extends StatefulWidget{
  const MyRadioButton({Key? key, required this.coin}) :super(key: key);
  final Obj coin;// = Coins.BTC;

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton>{

  @override
  Widget build(BuildContext context) {
   // widget.coin.coin = Coins.LTC;
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Bitcoin'),
          leading: Radio<Coins>(
            value: Coins.BTC,
            groupValue: widget.coin.coin,
            onChanged: (Coins? value) {
              setState(() {
                widget.coin.coin = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Litecoin'),
          leading: Radio<Coins>(
            value: Coins.LTC,
            groupValue: widget.coin.coin,
            onChanged: (Coins? value) {
              setState(() {
                widget.coin.coin = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Cardano'),
          leading: Radio<Coins>(
            value: Coins.ADA,
            groupValue: widget.coin.coin,
            onChanged: (Coins? value) {
              setState(() {
                widget.coin.coin = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('UNI Coin'),
          leading: Radio<Coins>(
            value: Coins.UNI,
            groupValue: widget.coin.coin,
            onChanged: (Coins? value) {
              setState(() {
                widget.coin.coin = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('USD Coin'),
          leading: Radio<Coins>(
            value: Coins.USDC,
            groupValue: widget.coin.coin,
            onChanged: (Coins? value) {
              setState(() {
                widget.coin.coin = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Coins? coin(){
    return widget.coin.coin;
  }
}

