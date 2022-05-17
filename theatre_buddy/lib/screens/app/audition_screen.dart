import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theatre_buddy/widgets/audition_card.dart';
import 'package:theatre_buddy/widgets/drawer.dart';

class AuditionScreen extends StatefulWidget {
  const AuditionScreen({Key? key}) : super(key: key);

  @override
  State<AuditionScreen> createState() => _AuditionScreenState();
}

class _AuditionScreenState extends State<AuditionScreen> {
  
  @override
  Widget build(BuildContext context) {
    
    //get all the events from cloud firestore
    final CollectionReference events =
        FirebaseFirestore.instance.collection('auditions');

    final Stream<QuerySnapshot> _auditionsStream =
        FirebaseFirestore.instance.collection('auditions').snapshots();
    
    final TextEditingController dateinput = TextEditingController();
    final TextEditingController eventNameInput = TextEditingController();
    final TextEditingController roleInput = TextEditingController();
    final TextEditingController contactInput = TextEditingController();

    void initState() {
      eventNameInput.text = "";
      dateinput.text = "";
      super.initState();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Auditions Calendar"),
          elevation: 0,
               
        ),
        drawer: DrawerWidget(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Listen to the stream of auditions and display data accordingly
              StreamBuilder<QuerySnapshot>(
                builder: (ctx, snapshot) {
                  //Load For Data
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  //Firebase expired condition 

                  if(snapshot.data == null){
                    return Center(child: Text(
                      "Database failed contact admin"
                    ));
                  }
                  
                  //If no auditions
                  if (snapshot.data!.size == 0) {
                    return const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "No auditions nearby",
                          style: TextStyle(color: Colors.white54, fontSize: 20),
                        ),
                      ),
                    );
                  }

                  //else
                  return Expanded(
                    child: ListView(
                      shrinkWrap: true,
                         children: snapshot.data!.docs
                             .map((DocumentSnapshot document) {
                           Map<String, dynamic> data =
                               document.data()! as Map<String, dynamic>;
                           //print(data);
                           //calculate days remaining
                           
                           int days = DateTime.parse(data["time"])
                               .difference(DateTime.now())
                               .inDays;
                  
                           return AuditionCard(
                             name: data["play_name"] ,
                             role: data["role"],
                             date: days.toString(),
                             contact: data["contact"]
                           );
                         }).toList(),
                       ),
                  );
                },
                stream: _auditionsStream,
              ),
            ],
          ),
        ),
        //Add Event button
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          //open modal sheet on pressed
          onPressed: () {
            showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Form
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: eventNameInput,
                              decoration:
                                  const InputDecoration(hintText: "Event Name"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: dateinput,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  labelText: "Enter Date"),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    //DateTime.now() - not to allow to choose before today.

                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  //print(pickedDate);
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  //print(formattedDate);
                                  setState(() {
                                    dateinput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  //print("Date is not selected");
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: roleInput,
                              decoration:
                                  const InputDecoration(hintText: "Role"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: contactInput,
                              decoration:
                                  const InputDecoration(hintText: "Email"),
                            ),
                          ),
                          
                          //Submit button
                          ElevatedButton(
                              onPressed: () {
                                //print(EventNameInput.text.toString());
                                //set data on pressed
                                events.doc(eventNameInput.text.toString()).set({
                                  'play_name': eventNameInput.text.toString(),
                                  'time': dateinput.text.toString(),
                                  'role': roleInput.text,
                                  'contact': contactInput.text,
                                });

                                Navigator.pop(context);
                              },
                              child: const Text("Add Event"))
                        ],
                      ),
                    ),
                  );
                });
          },
          
          
          child: const Center(
              child: Icon(
            Icons.add,
          )),
        ));
  }
}
