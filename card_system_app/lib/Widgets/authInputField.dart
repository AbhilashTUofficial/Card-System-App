import 'package:card_system_app/Palette/constants.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final TextEditingController textEditingController;
  final String type;


  Icon getIcon(){
    if(type=='password'){
      return const Icon(Icons.lock,
        color: Colors.white,);
    }else if(type=='email'){
      return const Icon(Icons.email,
        color: Colors.white,);
    }else if(type=='username'){
      return const Icon(Icons.account_circle,
        color: Colors.white,);
    }
    return const Icon(Icons.error,
      color: Colors.white,);
  }

  const AuthInputField({
    Key? key,
    required this.textInputType,
    required this.hintText,
    required this.textEditingController,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: boxDecorationStyle,
      height: 60.0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: textEditingController,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14.0),
          prefixIcon: getIcon(),
          hintText: hintText,
          hintStyle: hintTextStyle,
        ),
      ),
    );
  }
}
