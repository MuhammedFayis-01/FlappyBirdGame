import 'package:flappybirdgame/Barriers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Animatedcon extends StatelessWidget {
  double x;
  double y;
  double size2;
  Animatedcon({required this.x, required this.y,required this.size2});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment(x, y),
      duration: Duration(milliseconds: 0),
      child: Barriers(Size: size2),
    );
  }
}
