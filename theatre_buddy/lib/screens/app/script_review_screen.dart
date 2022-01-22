import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ScriptReviewScreen extends StatelessWidget {
  final String name;
  final String url;

  ScriptReviewScreen({Key? key, required this.name, required this.url}) : super(key: key);
  
  Stream<QuerySnapshot> get _reviewStream => FirebaseFirestore.instance.collection("scripts/$name/reviews").snapshots();

  CollectionReference get _reviews => FirebaseFirestore.instance.collection("scripts/$name/reviews");

  TextEditingController _newReviewController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _reviewStream,
              builder: (ctx, snapshot){
          
                return ListView(
                  
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                     Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                      return ListTile(title: Text(data["review"]));
          
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
              icon: Icon(
                Icons.send
              ),
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