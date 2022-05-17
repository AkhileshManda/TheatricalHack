import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/script_review_screen.dart';
import 'package:theatre_buddy/widgets/drawer.dart';
import 'package:theatre_buddy/widgets/script_card.dart';
import './script_upload_screen.dart';

class ScriptsScreen extends StatefulWidget {
  const ScriptsScreen({Key? key}) : super(key: key);

  @override
  _ScriptsScreenState createState() => _ScriptsScreenState();
}

class _ScriptsScreenState extends State<ScriptsScreen> {
  final Stream<QuerySnapshot> _scriptsStream =
      FirebaseFirestore.instance.collection('scripts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Script Review")),
        drawer: DrawerWidget(),
        body: StreamBuilder<QuerySnapshot>(
            stream: _scriptsStream,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.data!.size == 0) {
                return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "No scripts",
                    ),
                  ),
                );
              }

              return ListView(
                shrinkWrap: true,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScriptReviewScreen(
                                      name: data["name"],
                                      url: data["url"],
                                      description: data["description"],
                                    )));
                      },
                      child: ScriptCard(
                          title: data["name"],
                          description: data["description"]));
                }).toList(),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScriptUploadScreeen()));
            }));
  }
}
