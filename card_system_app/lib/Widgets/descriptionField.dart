import 'package:card_system_app/Palette/constants.dart';
import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 410,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(color: Colors.grey[100]),
              ),
            ),
            Row(
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
                  onTap: () {
                    print("Submit button clicked");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
