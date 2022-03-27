import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../resources/provider.dart';

Widget ViewMore(BuildContext context, List cases) {
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
      child: ListView.builder(
        itemCount: cases.length,
        itemBuilder: (BuildContext context, int i) {
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ref.watch(updateProvider(cases[i])).when(
                  data: (List data) {
                int cardId = data[2];
                String description = data[4];
                String subBy = data[5];
                String time = data[6];
                String date = data[7];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 26, right: 26),
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: cardId == 0
                                          ? Colors.redAccent
                                          : cardId == 1
                                              ? Colors.amber
                                              : cardId == 2
                                                  ? Colors.blueAccent
                                                  : cardId == 3
                                                      ? Colors.green
                                                      : Colors.black),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    "Date : " + date,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    "Time : " + time,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    "Sub By : " + subBy,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, left: 8, right: 8, bottom: 12),
                          width: MediaQuery.of(context).size.width * .86,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Text(
                            description,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }, error: (Object e, _) {
                return Container();
              }, loading: () {
                return const CircularProgressIndicator(
                  color: Colors.transparent,
                );
              });
            },
          );
        },
      ),
    ),
  );
}
