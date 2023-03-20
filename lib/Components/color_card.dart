import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Color_Card extends StatelessWidget {
  final Color data ;
  const Color_Card({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: data,
      ),
      
    );
  }
}
