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
      height: 200,
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
                 return Future.delayed(const Duration(seconds: 2));},

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
        return Card(
          child: ExpansionTile(
            tilePadding: const EdgeInsets.all(10),

            // Circular Avatar and Card indicator
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            leading: SizedBox(
              width: 60,
              child: Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/img/profile_img.png"),
                    radius: 32,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 2,
                    child: Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return ref.watch(entryCardProvider(updates[i])).when(
                            data: (int cardId) {
                          return Container(
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
                          );
                        }, error: (Object e, _) {
                          return Container();
                        }, loading: () {
                          return const CircularProgressIndicator(
                            color: Colors.blue,
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            // Entry name
            //-----------------------------------------------------------------
            title: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ref.watch(entryNameProvider(updates[i])).when(
                    data: (String name) {
                  return Text(
                    name,
                    style: const TextStyle(fontSize: 16, letterSpacing: 0.3),
                  );
                }, error: (Object e, _) {
                  return Container();
                }, loading: () {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                });
              },
            ),
            //-----------------------------------------------------------------

            // Entry Department
            //*****************************************************************
            subtitle: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ref.watch(entryDeptProvider(updates[i])).when(
                    data: (String department) {
                  return Text(department);
                }, error: (Object e, _) {
                  return Container();
                }, loading: () {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                });
              },
            ),
            //*****************************************************************

            children: <Widget>[

              // Register number
              //---------------------------------------------------------------
              ListTile(
                title: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ref.watch(entryRegNoProvider(updates[i])).when(
                        data: (String regNo) {
                          return Text(
                            "Reg Number: "+regNo,
                          );
                        }, error: (Object e, _) {
                      return Container();
                    }, loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    });
                  },
                ),
              ),
              //---------------------------------------------------------------


              // Entry Description
              //===============================================================
              ListTile(
                title: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ref.watch(entryDescProvider(updates[i])).when(
                        data: (String description) {
                      return Text(
                        description,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            letterSpacing: 0.3),
                      );
                    }, error: (Object e, _) {
                      return Container();
                    }, loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    });
                  },
                ),
              ),
              //===============================================================


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Entry Date
                    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return ref.watch(entryDateProvider(updates[i])).when(
                            data: (String date) {
                          return Text(
                            date,
                          );
                        }, error: (Object e, _) {
                          return Container();
                        }, loading: () {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        });
                      },
                    ),
                    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                    // Entry Time
                    //---------------------------------------------------------
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return ref.watch(entryTimeProvider(updates[i])).when(
                            data: (String time) {
                              return Text(
                                time,
                              );
                            }, error: (Object e, _) {
                          return Container();
                        }, loading: () {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        });
                      },
                    ),
                    //---------------------------------------------------------


                    // Entry Submitted by
                    //*********************************************************
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return ref.watch(entrySubByProvider(updates[i])).when(
                            data: (String subBy) {
                              return Text(
                                "- "+subBy,
                              );
                            }, error: (Object e, _) {
                          return Container();
                        }, loading: () {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        });
                      },
                    ),
                    //*********************************************************
                  ],
                ),
              )
            ],


          ),
        );
      }, error: (Object e, _) {
        return const Center(
            child: Text(
          "No Entry yet",
          style: TextStyle(color: Colors.grey, fontSize: 24),
        ));
      }, loading: () {
        return const CircularProgressIndicator(
          color: Colors.white,
        );
      });
    },
  );
}
