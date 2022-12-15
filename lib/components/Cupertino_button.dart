import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoRowButtons extends StatelessWidget {
  String buttonName;
  IconData icon;
  void Function() onPressed;
  CupertinoRowButtons({Key? key,required this.buttonName,required this.icon,required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 15),
          Text(buttonName),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
