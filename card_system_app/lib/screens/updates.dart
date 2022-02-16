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
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: value,
                itemBuilder: (BuildContext context, int index) {
                  return _updateTile(index);
                },
              ),
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
    );
  }
}


// UpdateTile widget

Widget _updateTile(i) {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return ref.watch(updateProvider).when(data: (List updates) {
        return Card(
          child: ExpansionTile(
            tilePadding: const EdgeInsets.all(10),
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
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Apparently i could only fetch the data through another provider
            // not sure why, maybe it hold some special exception statements
            // here usernameProvider is not in use
            title: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ref.watch(usernameProvider).when(data: (String name) {
                  return Text(updates[i][0]);
                }, error: (Object e, _) {
                  return Container();
                }, loading: () {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                });
              },
            ),
            subtitle: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ref.watch(usernameProvider).when(data: (String name) {
                  return Text(updates[i][1]);
                }, error: (Object e, _) {
                  return Container();
                }, loading: () {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                });
              },
            ),
            children: <Widget>[
              ListTile(
                title: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ref.watch(usernameProvider).when(
                        data: (String name) {
                      return Text(updates[i][2]);
                    }, error: (Object e, _) {
                      return Container();
                    }, loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    });
                  },
                ),
              )
            ],
          ),
        );
      }, error: (Object e, _) {
        return Container();
      }, loading: () {
        return const CircularProgressIndicator(
          color: Colors.white,
        );
      });
    },
  );
}
