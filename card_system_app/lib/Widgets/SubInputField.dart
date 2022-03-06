import 'package:flutter/material.dart';

class SubInputField extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final TextEditingController textEditingController;
  final String type;


  const SubInputField({
    Key? key,
    required this.textInputType,
    required this.hintText,
    required this.textEditingController,
    required this.type,
  }) : super(key: key);

  Icon _getIcon() {
    if (type == 'register_num') {
      return const Icon(
        Icons.app_registration,
        color: Colors.blueAccent,
      );
    } else if (type == 'student_name') {
      return const Icon(
        Icons.person,
        color: Colors.blueAccent,
      );
    }

    return const Icon(
      Icons.error,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: _getIcon(),),
      ),
    );
  }
}
