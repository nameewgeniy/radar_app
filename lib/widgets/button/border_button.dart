import 'package:flutter/material.dart';
import 'package:radar/enum/enum.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  BorderButton({this.text, this.onPressed, this.isActive});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: isActive ? Enum.firstColor : Colors.black54 , fontSize: 11)),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: isActive
                            ? Enum.firstColor
                            : Colors.grey
                    )
                )
            )
        )
    );
  }
}