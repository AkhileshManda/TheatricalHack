import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/ar_page.dart';

class CostumeCard extends StatelessWidget {
  final bool isAvailable;
  final String image;
  CostumeCard({ Key? key, required this.isAvailable, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          const SizedBox(
            width: 200,
            height: 200,
            child: Image(
              image: AssetImage('images/background1.png'), fit: BoxFit.cover
              ),
          ),
          
          Container(
            child: Row(
              children: [
                isAvailable? const Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Text("Available", style: TextStyle(color: Colors.green)),
                ):
                const Padding(
                  padding:EdgeInsets.all(8.0),
                  child: Text("Not Available", style: TextStyle(color: Colors.red)),
                ),

                if(isAvailable)
                ElevatedButton(child: const Text("View in AR"),onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const ARPage()));
                } ,)
              ],
            ),
          )
        ]

      )
    );
  }
}