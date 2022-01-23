import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

            Text("Play Name : "+name, 
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: Text("Role : "+role,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                )
                
                 ),
               ),

               Text("In: "+date+ " day(s)", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                )),
              ]
            ),
            
            TextButton(child: Text("Email : "+contact),onPressed: ()async{
              var url = 'mailto:'+contact;
              if(await canLaunch(url)){
                await launch(url);
              }else{
                throw 'Couldnt Launch';
              }
            })
          ],
        
        ),
      )
    );
  }
}