import 'package:flutter/material.dart';
class ResuseableCard extends StatelessWidget {

  final Color colour;
  final int flex;
  final Widget cardChild;
  ResuseableCard({this.colour = const Color(0xff1d1e33), @required this.cardChild, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}