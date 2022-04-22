import 'package:card_system_app/Widgets/cardSelector.dart';
import 'package:card_system_app/Widgets/deptSeletor.dart';
import 'package:card_system_app/Widgets/descriptionField.dart';
import 'package:flutter/material.dart';

import '../Widgets/SubInputField.dart';

class Submission extends StatefulWidget {
  const Submission({Key? key}) : super(key: key);

  @override
  _SubmissionState createState() => _SubmissionState();
}

class _SubmissionState extends State<Submission> {
  final TextEditingController _regNumController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _regNumController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Column(
        children: [
          Column(
            children: [
              SubInputField(
                textInputType: TextInputType.text,
                hintText: 'Register Number',
                type: 'register_num',
                textEditingController: _regNumController,
              ),
              SubInputField(
                textInputType: TextInputType.text,
                hintText: 'Name Of Student',
                type: 'student_name',
                textEditingController: _regNumController,
              ),
              const DeptSelector(),
            ],
          ),
          const CardSelector(),
          const DescriptionField()
        ],
      ),
    );
  }
}
