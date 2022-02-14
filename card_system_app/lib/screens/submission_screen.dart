import 'package:card_system_app/resources/submission_methods.dart';
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

  DateTime now = DateTime.now();

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
        cardId: "red",
        description: descriptionController.text,
        regNo: regNumController.text,
        dateTime: now.year.toString() +
            now.month.toString() +
            now.day.toString() +
            now.hour.toString() +
            now.minute.toString());
    // SnackBar response
    if (res == 'success') {
      showSnackBar("Entry Successful", context);
    } else if (res == 'error occurred') {
      showSnackBar("Error Occurred", context);
    }
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
                        'Two',
                        'Free',
                        'Four'
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
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _redIsChecked == true
                            ? Colors.red
                            : Colors.red[400]),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
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
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _yellowIsChecked == true
                            ? Colors.amber
                            : Colors.amber[400]),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
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
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _blueIsChecked == true
                            ? Colors.blue
                            : Colors.blue[400]),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
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
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _greenIsChecked == true
                            ? Colors.green
                            : Colors.green[400]),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
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
                )
              ],
            ),
            Card(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 460,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 520,
                          child: TextField(
                            expands: true,
                            maxLines: null,
                            decoration: const InputDecoration(
                                filled: true, fillColor: Colors.black12),
                            controller: descriptionController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.all(12),
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
