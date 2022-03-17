import 'package:card_system_app/resources/CRUD/submission_methods.dart';
import 'package:flutter/material.dart';

import '../Widgets/SubInputField.dart';
import '../Widgets/showSnackBar.dart';

class Submission extends StatefulWidget {
  const Submission({Key? key}) : super(key: key);

  @override
  _SubmissionState createState() => _SubmissionState();
}

class _SubmissionState extends State<Submission> {
  // Controllers
  TextEditingController regNumController = TextEditingController();
  TextEditingController stuNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool _redIsChecked = true;
  bool _yellowIsChecked = false;
  bool _blueIsChecked = false;
  bool _greenIsChecked = false;
  String dropdownValue = 'Dept of Computer Science';


  @override
  void dispose() {
    super.dispose();
    regNumController.dispose();
    stuNameController.dispose();
    descriptionController.dispose();
  }

  submitNewEntry() async {
    String res = await SubMethods().submitNewEntry(
      name: stuNameController.text,
      department: dropdownValue,
      cardId: _redIsChecked
          ? 0
          : _yellowIsChecked
              ? 1
              : _blueIsChecked
                  ? 2
                  : _greenIsChecked
                      ? 3
                      : 9,
      description: descriptionController.text,
      regNo: regNumController.text,
    );
    // SnackBar response
    showSnackBar(res, context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          children: [
            Column(
              children: [
                SubInputField(
                  textInputType: TextInputType.text,
                  hintText: 'Register Number',
                  type: 'register_num',
                  textEditingController: regNumController,
                ),
                SubInputField(
                  textInputType: TextInputType.text,
                  hintText: 'Name Of Student',
                  type: 'student_name',
                  textEditingController: stuNameController,
                ),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 16),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Dept of Computer Science',
                        'Department of English',
                        'Department of Commerce',
                        'Department of Psychology',
                        'Department of Mathematics',
                        'Department of Physics',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: _redIsChecked == true
                              ? Colors.red
                              : Colors.red[400]),
                      padding: const EdgeInsets.all(10),
                      child: _redIsChecked == true
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : const SizedBox(),
                    ),
                    onTap: () {
                      setState(() {
                        if (_redIsChecked) {
                          _redIsChecked = false;
                        } else {
                          _redIsChecked = true;
                          _yellowIsChecked = false;
                          _blueIsChecked = false;
                          _greenIsChecked = false;
                        }
                      });
                    },
                  ),
                ),
                Card(
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: _yellowIsChecked == true
                              ? Colors.amber
                              : Colors.amber[400]),
                      padding: const EdgeInsets.all(10),
                      child: _yellowIsChecked == true
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : const SizedBox(),
                    ),
                    onTap: () {
                      setState(() {
                        if (_yellowIsChecked) {
                          _yellowIsChecked = false;
                        } else {
                          _yellowIsChecked = true;
                          _redIsChecked = false;
                          _blueIsChecked = false;
                          _greenIsChecked = false;
                        }
                      });
                    },
                  ),
                ),
                Card(
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: _blueIsChecked == true
                              ? Colors.blue
                              : Colors.blue[400]),
                      padding: const EdgeInsets.all(10),
                      child: _blueIsChecked == true
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : const SizedBox(),
                    ),
                    onTap: () {
                      setState(() {
                        if (_blueIsChecked) {
                          _blueIsChecked = false;
                        } else {
                          _blueIsChecked = true;
                          _yellowIsChecked = false;
                          _redIsChecked = false;
                          _greenIsChecked = false;
                        }
                      });
                    },
                  ),
                ),
                Card(
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: _greenIsChecked == true
                              ? Colors.green
                              : Colors.green[400]),
                      padding: const EdgeInsets.all(10),
                      child: _greenIsChecked == true
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : const SizedBox(),
                    ),
                    onTap: () {
                      setState(() {
                        if (_greenIsChecked) {
                          _greenIsChecked = false;
                        } else {
                          _greenIsChecked = true;
                          _yellowIsChecked = false;
                          _blueIsChecked = false;
                          _redIsChecked = false;
                        }
                      });
                    },
                  ),
                )
              ],
            ),
            Card(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 440,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(fontSize: 16, color: Colors.black45),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 486,
                          child: TextField(
                            expands: true,
                            maxLines: null,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color(0x10050505)),
                            controller: descriptionController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(left: 12, right: 10),
                            child: const Text(
                              "CANCEL",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () {
                            print("Cancel button clicked");
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: const Text(
                              "SUBMIT",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () => submitNewEntry(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
