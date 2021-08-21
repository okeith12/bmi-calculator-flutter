import 'package:flutter/material.dart';
import '../Constants/constants.dart';



class IconWithTitle extends StatelessWidget {


  final String title;
  final IconData icon;
  final double size;
  final double height;

  IconWithTitle({
    @required this.title,
    @required this.icon,
    this.height = 15,
    this.size = 80,
  }


    );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: size,
        ),
        SizedBox(height: height,),
        Text(title.toUpperCase(),
          style: kSubtitleStyle,
        ),
      ],
    );
  }
}