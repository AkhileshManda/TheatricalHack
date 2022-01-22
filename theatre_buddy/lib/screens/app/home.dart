import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/audition_screen.dart';
import 'package:theatre_buddy/widgets/drawer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title")
      ),
      drawer: const DrawerWidget()
      
    );
  }
}