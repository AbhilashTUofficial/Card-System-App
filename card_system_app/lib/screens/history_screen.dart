import 'package:card_system_app/Widgets/viewHistory.dart';
import 'package:card_system_app/resources/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .80,
                  child: const Center(
                    child: TextField(
                      // controller: textEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort),
                  ),
                )
              ],
            ),
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ref.watch(historyCountProvider).when(data: (List history) {
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
                      itemCount: history.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _historyTile(context, history, index);
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
        ],
      ),
    );
  }
}

Widget _historyTile(BuildContext context, history, i) {
  return Card(
    child: ExpansionTile(
      tilePadding: const EdgeInsets.all(10),
      // Circular Avatar and Card indicator
      //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      leading: const SizedBox(
        width: 60,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/img/profile_img.png"),
          radius: 32,
        ),
      ),
      //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      // History name
      //-----------------------------------------------------------------------
      title: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ref.watch(historyNameProvider(history[i])).when(
              data: (String name) {
            return Text(
              name,
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
      //-----------------------------------------------------------------------

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ref.watch(historyDeptProvider(history[i])).when(
                  data: (String dept) {
                return Text(
                  dept,
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
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ref
                        .watch(historyRedCardsCountProvider(history[i]))
                        .when(data: (List cards) {
                      return redCards(cards.length);
                    }, error: (Object e, _) {
                      return Container();
                    }, loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    });
                  },
                ),
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ref
                        .watch(historyYellowCardsCountProvider(history[i]))
                        .when(data: (List cards) {
                      return yellowCards(cards.length);
                    }, error: (Object e, _) {
                      return Container();
                    }, loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    });
                  },
                ),
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ref
                        .watch(historyBlueCardsCountProvider(history[i]))
                        .when(data: (List cards) {
                      return blueCards(cards.length);
                    }, error: (Object e, _) {
                      return Container();
                    }, loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    });
                  },
                ),
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ref
                        .watch(historyGreenCardsCountProvider(history[i]))
                        .when(data: (List cards) {
                      return greenCards(cards.length);
                    }, error: (Object e, _) {
                      return Container();
                    }, loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Course : N/A",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
              Text(
                "Register number : " + history[i],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return ref.watch(historyBatchProvider(history[i])).when(
                      data: (String batch) {
                    return Text(
                      "Batch : " + batch,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1),
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
              const Text(
                "Phone number : N/A",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
              const Text(
                "Address : N/A",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
        ListTile(
          title: GestureDetector(
            child: const Text(
              "View History",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ViewHistory(context, history[i]);
                },
              );
            },
          ),
        )
      ],
    ),
  );
}

Container redCards(count) {
  _card() {
    return Container(
      margin: const EdgeInsets.only(left: 2, top: 6),
      height: 16,
      width: 16,
      decoration: const BoxDecoration(color: Colors.red),
    );
  }

  return Container(
    child: count == 1
        ? _card()
        : count == 2
            ? Row(
                children: [_card(), _card()],
              )
            : count == 3
                ? Row(
                    children: [_card(), _card(), _card()],
                  )
                : Container(),
  );
}

Container yellowCards(count) {
  _card() {
    return Container(
      margin: const EdgeInsets.only(left: 2, top: 6),
      height: 16,
      width: 16,
      decoration: const BoxDecoration(color: Colors.amber),
    );
  }

  return Container(
    child: count == 1
        ? _card()
        : count == 2
            ? Row(
                children: [_card(), _card()],
              )
            : count == 3
                ? Row(
                    children: [_card(), _card(), _card()],
                  )
                : Container(),
  );
}

Container blueCards(count) {
  _card() {
    return Container(
      margin: const EdgeInsets.only(left: 2, top: 6),
      height: 16,
      width: 16,
      decoration: const BoxDecoration(color: Colors.blueAccent),
    );
  }

  return Container(
    child: count == 1
        ? _card()
        : count == 2
            ? Row(
                children: [_card(), _card()],
              )
            : count == 3
                ? Row(
                    children: [_card(), _card(), _card()],
                  )
                : Container(),
  );
}

Container greenCards(count) {
  _card() {
    return Container(
      margin: const EdgeInsets.only(left: 2, top: 6),
      height: 16,
      width: 16,
      decoration: const BoxDecoration(color: Colors.green),
    );
  }

  return Container(
    child: count == 1
        ? _card()
        : count == 2
            ? Row(
                children: [_card(), _card()],
              )
            : count == 3
                ? Row(
                    children: [_card(), _card(), _card()],
                  )
                : Container(),
  );
}
