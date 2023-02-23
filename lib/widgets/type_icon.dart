
import 'package:flutter/material.dart';

import '../constants.dart';

class TypeIcon extends StatelessWidget {
  final String type;
  const TypeIcon({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 25,
      decoration:  BoxDecoration(
        color: color(type),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(type.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
      ),
    );
  }
}
