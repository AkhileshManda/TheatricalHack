import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/ar_page.dart';

class CostumeOfTheDayCard extends StatelessWidget {
  const CostumeOfTheDayCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //Update Image TODO
        leading: Image(image: AssetImage('images/background1.png')),
        title: Text("Astronaut costume"),
        subtitle: Text("Available on discount", style: TextStyle(color: Colors.green)),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>const ARPage()));
        }
      ),
    );
  }
}