import 'dart:async';
// import 'dart:js';

import 'package:flappybirdgame/Barriers.dart';
import 'package:flappybirdgame/Bird.dart';
import 'package:flappybirdgame/animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static double? birdYaxis = 0;
  double? time = 0;
  double? height = 0;
  double? initialheight = birdYaxis;
  bool gamehasstarted = false;
  static double barrierxone = 1;

  double barrierxtwo = barrierxone + 1.2;

  void jump() {
    setState(() {
      time = 0;
      initialheight = birdYaxis;
    });
  }

  void resetGame() {
    // Navigator.pop(context);
    setState(() {
      birdYaxis = 0;
      time = 0;
      height = 0;
      barrierxone = 1;
      gamehasstarted = false;
      initialheight = 0;
      barrierxtwo = barrierxone + 1.2;
    });
  }

  void startgame() {
    gamehasstarted = true;
    Timer.periodic(
      Duration(milliseconds: 120),
      (timer) {
        time = (time! + 0.05);
        height = -4.9 * time! * time! + 2.8 * time!;
        setState(() {
          birdYaxis = initialheight! - height!;
          barrierxone -= 0.05;
          barrierxtwo -= 0.05;
        });

        setState(() {
          if (barrierxone < -2) {
            barrierxone += 3.5;
          } else {
            barrierxone -= 0.05;
          }
        });
        setState(() {
          if (barrierxtwo < -2) {
            barrierxtwo += 3.5;
          } else {
            barrierxtwo -= 0.05;
          }
        });

        if (birdYaxis! > 1) {
          timer.cancel();
          gamehasstarted = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 3,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (gamehasstarted) {
                      jump();
                    } else {
                      startgame();
                    }
                  },
                  child: AnimatedContainer(
                    alignment: Alignment(0, birdYaxis!),
                    color: Colors.blue[500],
                    duration: Duration(milliseconds: 0),
                    child: Bird(),
                  ),
                ),
                Container(
                  alignment: Alignment(0, -0.3),
                  child: gamehasstarted
                      ? Text("")
                      : Text(
                          "TAP  TO  PLAY",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                ),
                Animatedcon(x: barrierxone, y: 1.1, size2: 200.0),
                Animatedcon(x: barrierxone, y: -1.1, size2: 120.0),
                Animatedcon(x: barrierxtwo, y: 1.1, size2: 120),
                Animatedcon(x: barrierxtwo, y: -1.1, size2: 230),
              ],
            )),
        Container(
          height: 15,
          color: Color.fromARGB(255, 85, 222, 43),
        ),
        Expanded(
          child: Container(
            color: Color.fromARGB(255, 37, 51, 38),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Score',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Best score",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "20",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: resetGame,
                      child: Container(
                        child: Text(
                          "Restart",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

// void showDialog() {
//   showDialog(
//     context: context,
//   barrierDismissil
//    builder: builder
   
//    );
// }
