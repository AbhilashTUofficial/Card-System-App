import 'package:card_system_app/Widgets/customCheckBox.dart';
import 'package:flutter/material.dart';

class CardSelector extends StatefulWidget {
  const CardSelector({Key? key}) : super(key: key);

  @override
  _CardSelectorState createState() => _CardSelectorState();
}

class _CardSelectorState extends State<CardSelector> {
  bool _redIsChecked = true;
  bool _yellowIsChecked = false;
  bool _blueIsChecked = false;
  bool _greenIsChecked = false;

  bool invert(bool input) {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: _redIsChecked == true ? Colors.red : Colors.red[400]),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: _redIsChecked==true?const Icon(Icons.check,color: Colors.white,):const SizedBox(),
          ),
          onTap: (){
            setState(() {
              if(_redIsChecked){
               _redIsChecked=false;
              }else{
                _redIsChecked=true;
                _yellowIsChecked=false;
                _blueIsChecked=false;
                _greenIsChecked=false;
              }
            });
          },
        ),
        GestureDetector(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: _yellowIsChecked == true ? Colors.amber : Colors.amber[400]),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: _yellowIsChecked==true?const Icon(Icons.check,color: Colors.white,):const SizedBox(),
          ),
          onTap: (){
            setState(() {
              if(_yellowIsChecked){
                _yellowIsChecked=false;
              }else{
                _yellowIsChecked=true;
                _redIsChecked=false;
                _blueIsChecked=false;
                _greenIsChecked=false;
              }
            });
          },
        ),
        GestureDetector(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: _blueIsChecked == true ? Colors.blue : Colors.blue[400]),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: _blueIsChecked==true?const Icon(Icons.check,color: Colors.white,):const SizedBox(),
          ),
          onTap: (){
            setState(() {
              if(_blueIsChecked){
                _blueIsChecked=false;
              }else{
                _blueIsChecked=true;
                _yellowIsChecked=false;
                _redIsChecked=false;
                _greenIsChecked=false;
              }
            });
          },
        ),
        GestureDetector(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: _greenIsChecked == true ? Colors.green : Colors.green[400]),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: _greenIsChecked==true?const Icon(Icons.check,color: Colors.white,):const SizedBox(),
          ),
          onTap: (){
            setState(() {
              if(_greenIsChecked){
                _greenIsChecked=false;
              }else{
                _greenIsChecked=true;
                _yellowIsChecked=false;
                _blueIsChecked=false;
                _redIsChecked=false;
              }
            });
          },
        )
      ],
    );
  }
}
