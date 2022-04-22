import 'package:flutter/material.dart';


class DeptSelector extends StatefulWidget {
  const DeptSelector({Key? key}) : super(key: key);

  @override
  State<DeptSelector> createState() => _DeptSelectorState();
}

class _DeptSelectorState extends State<DeptSelector> {
  String dropdownValue = 'Dept of Computer Science';
  @override
  Widget build(BuildContext context) {
    return Card(

      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.black54,fontSize: 16),

          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Dept of Computer Science', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
