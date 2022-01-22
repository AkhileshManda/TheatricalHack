import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String review;
  const ReviewCard({ Key? key, required this.review }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(review)
      )
    );
  }
}