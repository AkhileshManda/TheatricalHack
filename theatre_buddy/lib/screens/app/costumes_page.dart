import 'package:flutter/material.dart';
import 'package:theatre_buddy/widgets/costumes_card.dart';
import 'package:theatre_buddy/widgets/drawer.dart';

class CostumesPage extends StatelessWidget {
  const CostumesPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Props")),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Costumes", style: TextStyle(fontSize: 40)),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        CostumeCard(isAvailable: true, image: "costume"),
                        CostumeCard(isAvailable: false, image: "costume"),
                        CostumeCard(isAvailable: true, image: "costume"),
                        CostumeCard(isAvailable: true, image: "costume"),
                        CostumeCard(isAvailable: true, image: "costume"),
      
                      ]
                    ),
                  ),
                ]
              ),
            ),
      
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Props", style: TextStyle(fontSize: 40)),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        CostumeCard(isAvailable: true, image: "costume"),
                        CostumeCard(isAvailable: false, image: "costume"),
                        CostumeCard(isAvailable: true, image: "costume"),
                        CostumeCard(isAvailable: true, image: "costume"),
                        CostumeCard(isAvailable: true, image: "costume"),
      
                      ]
                    ),
                  ),
                ]
              ),
            )
          ]
        ),
      ),

    );
  }
}