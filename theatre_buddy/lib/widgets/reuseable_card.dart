import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({required this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Card(
        color: Colors.lightBlue[100],
        elevation: 5,
        child: cardChild,
        margin: const EdgeInsets.all(25.0),
      ),
    );
  }
}
