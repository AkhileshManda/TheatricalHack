import 'package:flutter/material.dart';
import 'package:theatre_buddy/widgets/costumes_card.dart';
import 'package:theatre_buddy/widgets/drawer.dart';

class CostumesPage extends StatelessWidget {
  const CostumesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shop")),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Costumes", style: TextStyle(fontSize: 40)),
                        Text("A great play needs great costumes",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          CostumeCard(isAvailable: true, imageLoad: "costume"),
                          CostumeCard(isAvailable: false, imageLoad: "costume"),
                          CostumeCard(isAvailable: true, imageLoad: "costume"),
                          CostumeCard(isAvailable: true, imageLoad: "costume"),
                          CostumeCard(isAvailable: true, imageLoad: "costume"),
                        ]),
                  ),
                ]),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Props", style: TextStyle(fontSize: 40)),
                        Text("Bring your play to life",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          CostumeCard(
                              isAvailable: true, imageLoad: "images/astro.png"),
                          CostumeCard(
                              isAvailable: false,
                              imageLoad: "images/santa.png"),
                          CostumeCard(
                              isAvailable: true,
                              imageLoad: "images/princess.png"),
                          CostumeCard(
                              isAvailable: true,
                              imageLoad: "images/schooluniform.png"),
                          CostumeCard(isAvailable: true, imageLoad: "costume"),
                        ]),
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
