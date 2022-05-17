//Reviews of screen
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:theatre_buddy/widgets/review_card.dart';
import 'package:url_launcher/url_launcher.dart';
class ScriptReviewScreen extends StatelessWidget {
  final String name;
  final String url;
  final String description;

  ScriptReviewScreen({
    Key? key, 
    required this.name, 
    required this.url, 
    required this.description
    }) : super(key: key);
  
  Stream<QuerySnapshot> get _reviewStream => FirebaseFirestore.instance.collection("scripts/$name/reviews").snapshots();

  CollectionReference get _reviews => FirebaseFirestore.instance.collection("scripts/$name/reviews");

  TextEditingController _newReviewController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      appBar: AppBar(title: Text(name),elevation:0),
      body: Column(
        children: [
           Expanded(
            flex:1,
            child: Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background1.png'), fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text("View Script"), onPressed:()async{
                      if(await canLaunch(url)){
                        launch(url);
                      }
                    }),
                    const Text("Reviews", style: TextStyle(color:Colors.white, fontSize: 40, fontWeight: FontWeight.w300)),
                  ],
                ),
              )
              )
          ),
          
           Expanded(
            flex:1,
            child: StreamBuilder<QuerySnapshot>(
              stream: _reviewStream,
              builder: (ctx, snapshot){

                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  if (snapshot.data!.size == 0) {
                    return const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "Add Scripts",
                        ),
                      ),
                    );
                  }


                return ListView(
                  
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                     Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                      return ReviewCard(review: data["review"]);
          
                  }).toList()
                );
                          
              }
            ),
          ),
           Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            //REMEMBER
            //textfield in a row causes error
            //listview in a column causes error
            child: TextField(
              controller: _newReviewController,
              decoration: const InputDecoration(
                labelText: 'Send a message....'
              ),
                        
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
              icon: Icon(Icons.send),
              onPressed: (){
                _reviews.add({

                  "review": _newReviewController.text.toString()

                });
              }
          )
        ],
      ))
    ]
    )
    );
 }
}