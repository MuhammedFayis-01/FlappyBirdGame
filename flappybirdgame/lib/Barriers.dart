import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Barriers extends StatelessWidget {
  final Size;
  const Barriers({super.key, this.Size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: Size,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 85, 222, 43),
        border: Border.all(width: 3, color: Color.fromARGB(255, 10, 129, 14)),
        borderRadius: BorderRadius.circular(15),
      ),
      
    );
  }
}
