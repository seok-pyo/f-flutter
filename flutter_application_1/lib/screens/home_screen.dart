import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  int time = 10;
  int totalCount = 0;
  late Timer timer;
  bool isCounting = false;

  void onTick(Timer timer) {
    if (time == 0) {
      timer.cancel();
      setState(() {
        time = 10;
        isCounting = false;
        totalCount += 1;
      });
    } else {
      setState(() {
        time = time - 1;
      });
    }
  }

  void onClicked() {
    if (!isCounting) {
      isCounting = true;
      timer = Timer.periodic(
        Duration(seconds: 1),
        onTick,
      );
    }
  }

  String formatter(int seconds) {
    var duration = Duration(seconds: seconds);
    print(duration);
    return duration.toString().substring(2, 7);
  }

  void onPause() {
    if (isCounting) {
      timer.cancel();
      setState(() {
        isCounting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  formatter(time),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 90,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ),
          Flexible(
            flex: 2,
            child: Center(
                child: IconButton(
              iconSize: 100,
              color: Theme.of(context).cardColor,
              onPressed: isCounting ? onPause : onClicked,
              icon: isCounting
                  ? Icon(Icons.stop_circle_outlined)
                  : Icon(Icons.play_circle_outlined),
            )),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pomodoros',
                            style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '$totalCount',
                            style: TextStyle(
                              fontSize: 50,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
