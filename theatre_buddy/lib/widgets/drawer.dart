import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/ar_page.dart';
import 'package:theatre_buddy/screens/app/audition_screen.dart';
import 'package:theatre_buddy/screens/app/costumes_page.dart';
import 'package:theatre_buddy/screens/app/home.dart';
import 'package:theatre_buddy/screens/app/script_screen.dart';
import 'package:theatre_buddy/screens/auth/sign_in.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({ Key? key }) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image:AssetImage('images/background1.png')
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            
                    TextButton(
                  child: const Text("Home"), 
                onPressed:(){
            
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  
                }),
            
                TextButton(
                  child: const Text("Schedule Auditions"), 
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AuditionScreen()));
                  }
                  ),
            
                  TextButton(
                 child: Text("View Scripts"),
                 onPressed:(){
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>ScriptsScreen()));
                 }
                ),
            
                 TextButton(child: Text("Shop"), onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const CostumesPage() ));
                }),
            
                ]
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10,right: 10),
              child: Align(
                alignment:Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigo,
                  ),
                  child: IconButton(
                    onPressed: (){
                      _auth.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen() ));
                      }, icon: Icon(Icons.logout_sharp, color: Colors.white,)
                  ),
                ),
              ),
            )
           
           
          ],),
      );
  }
}