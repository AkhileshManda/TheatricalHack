import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
            flex:1,
            child: Container(
              child: Center(
                child: ElevatedButton(child: Text("View Script"), onPressed:()async{
                  if(await canLaunch(url)){
                    launch(url);
                  }
                }),
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