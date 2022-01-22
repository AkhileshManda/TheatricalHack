import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_document_picker/flutter_document_picker.dart';  
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage; 

class ScriptUploadScreeen extends StatefulWidget {
  const ScriptUploadScreeen({ Key? key }) : super(key: key);

  @override
  _ScriptUploadScreeenState createState() => _ScriptUploadScreeenState();
}

class _ScriptUploadScreeenState extends State<ScriptUploadScreeen> {


  Future<firebase_storage.UploadTask> uploadFile(File file) async {  
   //if (file == null) {  
    //Scaffold.of(context)  
        //.showSnackBar(SnackBar(content: Text("Unable to Upload")));  
    //return null;  
  // } 

   firebase_storage.UploadTask uploadTask;  
  
  // Create a Reference to the file  
   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance  
  .ref()  
      .child('playground')  
      .child('/some-file.pdf');  
  
  final metadata = firebase_storage.SettableMetadata(  
      contentType: 'file/pdf',  
      customMetadata: {'picked-file-path': file.path});  
  print("Uploading..!");  
  
  uploadTask = ref.putData(await file.readAsBytes(), metadata);  
  
  print("done..!");  
  return Future.value(uploadTask);  
  }

  final TextEditingController _scriptNamecon = TextEditingController();
  final TextEditingController _descCon = TextEditingController();
  final TextEditingController _urlCon = TextEditingController();

  final CollectionReference scripts = FirebaseFirestore.instance.collection("scripts");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Script")),
      drawer: const Drawer(),
      body: Column(
        children: [
          
          TextField(
            controller: _scriptNamecon,
            decoration: const InputDecoration(
              labelText : "Script Name",
            ),
          ),

          TextField(
            controller: _descCon,
            decoration: const InputDecoration(
              labelText : "Short Summary",
            )
          ),

          TextField(
            controller: _urlCon,
            decoration: const InputDecoration(
              labelText : "Script Url",
            )
          ),
          
          ElevatedButton(
            onPressed: (){

              scripts.doc(_scriptNamecon.text.toString().trim()).set({
                'name' : _scriptNamecon.text.toString(),
                'description' : _descCon.text.toString(),
                'url' : _urlCon.text.toString(),
              });
              

            }, 
            child: const Text("Upload"))
        ],
      )
    );
  }

 
}
