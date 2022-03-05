import 'package:flutter/material.dart';

class CardsInfo extends StatelessWidget {
  const CardsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .86,
        height: MediaQuery.of(context).size.height * .86,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                            color: Colors.amber),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 6, left: 6, right: 6, bottom: 12),
                      width:
                      MediaQuery.of(context).size.width * .86,
                      decoration: const BoxDecoration(
                          color: Colors.white),
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 6, left: 6, right: 6, bottom: 12),
                      width:
                      MediaQuery.of(context).size.width * .86,
                      decoration: const BoxDecoration(
                          color: Colors.white),
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                            color: Colors.green),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 6, left: 6, right: 6, bottom: 12),
                      width:
                      MediaQuery.of(context).size.width * .86,
                      decoration: const BoxDecoration(
                          color: Colors.white),
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 6, left: 6, right: 6, bottom: 12),
                      width:
                      MediaQuery.of(context).size.width * .86,
                      decoration: const BoxDecoration(
                          color: Colors.white),
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
