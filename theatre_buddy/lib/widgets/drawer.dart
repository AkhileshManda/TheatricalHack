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
            Stack(
              children: [
                const Image(
                  image:AssetImage('images/background1.png')
                ),

                Text("Your theatre buddy", style: TextStyle(color:Colors.white, fontSize:25)),
              ],
              alignment: Alignment.center
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ListTile(
                      leading: Icon(Icons.home,color:Colors.indigo),
                      title: Text("Home"),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const HomeScreen()));
                      }
                    ),

                    ListTile(
                      leading: Icon(Icons.camera_roll,color: Colors.indigo),
                      title: Text("Auditions"),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const AuditionScreen()));
                      }
                    ),

                    ListTile(
                      leading: Icon(Icons.book,color: Colors.indigo),
                      title: Text("scripts"),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const ScriptsScreen()));
                      }
                    ),

                    ListTile(
                      leading: Icon(Icons.shop,color: Colors.indigo),
                      title: Text("Shop"),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CostumesPage()));
                      }
                    ),



            
                           
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
           
           
          ],
        )
    );
  }
}