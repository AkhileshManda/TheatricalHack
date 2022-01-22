import 'package:flutter/material.dart';

class ScriptCard extends StatelessWidget {
  final String title; final String description;
  const ScriptCard({ Key? key, required this.title, required this.description }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        
        title: Text(title),
        subtitle: SizedBox(width : 200,child: Text(description, overflow: TextOverflow.fade,)),
        trailing: Text("Click To review", style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w700)),
      ),
    );
  }
}