import 'package:card_system_app/Widgets/updatesLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../resources/provider.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
      // entryCountProvider provide the total count of updates
      // Return int update count as value
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ref.watch(entryCountProvider).when(data: (int value) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 2));
                },
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: value,
                  itemBuilder: (BuildContext context, int index) {
                    return _updateTile(index);
                  },
                ),
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
      ),
    );
  }
}

// UpdateTile widget

Widget _updateTile(i) {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return ref.watch(caseIdProvider).when(data: (List updates) {
        return Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return ref.watch(updateProvider(updates[i])).when(
                data: (List data) {
              String name = data[0];
              String department = data[1];
              int cardId = data[2];
              String registerNum = data[3];
              String description = data[4];
              String batch = data[5];
              String subBy = data[6];
              String time = data[7];
              String date = data[8];
              return Card(
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(10),

                  // Circular Avatar and Card indicator
                  leading: SizedBox(
                    width: 60,
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/img/profile_img.png"),
                          radius: 32,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 2,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: cardId == 0
                                  ? Colors.redAccent
                                  : cardId == 1
                                      ? Colors.amber
                                      : cardId == 2
                                          ? Colors.blueAccent
                                          : cardId == 3
                                              ? Colors.green
                                              : Colors.black,
                              borderRadius: BorderRadius.circular(
                                2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Entry name
                  title: Text(
                    name,
                    style: const TextStyle(fontSize: 16, letterSpacing: 0.3),
                  ),

                  // Entry Department
                  subtitle: Text(department),

                  children: <Widget>[
                    // Register number
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 1),
                            child: Text(
                              "Reg Number: " + registerNum,

                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 1),

                            child: Text(
                              "Batch: " + batch,
                            ),
                          ),
                        ],
                      ),
                    ),


                    // Entry Description
                    ListTile(
                      title: Text(
                        description,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            letterSpacing: 0.3),
                      ),
                    ),

                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Entry Date
                          Text(
                            date,
                          ),
                          // Entry Time
                          Text(
                            time,
                          ),

                          // Entry Submitted by
                          Text(
                            "- " + subBy,
                          ),
                        ],
                      ),
                    )
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
      }, error: (Object e, _) {
        return const Center(
            child: Text(
          "Error",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ));
      }, loading: () {
        return const UpdatesLoading();
      });
    },
  );
}
