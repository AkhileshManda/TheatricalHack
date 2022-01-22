import 'package:flutter/material.dart';

class AuditionCard extends StatelessWidget {
  final String name; final String role; final String date; final String contact; 
  const AuditionCard({ 
    Key? key, 
    required this.name,
    required this.role, 
    required this.date, 
    required this.contact 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Play Name : "+name),
            Text("Role : "+role),
            Text("In :"+date+ " day(s)"),
            Text("Email :"+contact)
          ],
        
        ),
      )
        

      


    );
  }
}