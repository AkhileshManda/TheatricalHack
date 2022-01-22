import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/audition_screen.dart';
import 'package:theatre_buddy/screens/app/script_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(child: Text("Button1"), onPressed:(){}),
            TextButton(
              child: const Text("Schedule Auditions"), 
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AuditionScreen()));
              }
              ),
            TextButton(
             child: Text("View Scripts"),
             onPressed:(){
               Navigator.push(context,MaterialPageRoute(builder: (context)=>ScriptsScreen()));
             }
            ),
            TextButton(child: Text("Button4"), onPressed:(){}),
          ],),
      );
  }
}