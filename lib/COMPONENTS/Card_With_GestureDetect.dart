import 'package:flutter/material.dart';






class CardWithoutExpanded extends StatelessWidget {

  final Color colour;
  final Color borderColour;
  final Widget cardChild;
  final Function onPressed;
  CardWithoutExpanded({this.colour, @required this.cardChild, this.onPressed, this.borderColour =  const Color(0xff1d1e33)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
          border: Border.all(
            color: borderColour,
            width: 2,
          ),
        ),
      ),
    );
  }
}
