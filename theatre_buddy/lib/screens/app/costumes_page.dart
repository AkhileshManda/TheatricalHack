//Shop screen
import 'package:flutter/material.dart';
import 'package:theatre_buddy/models/costume_model.dart';
import 'package:theatre_buddy/screens/app/ar_page.dart';
import 'package:theatre_buddy/widgets/drawer.dart';

class CostumesPage extends StatelessWidget {

  List<CostumeCardModel> costumes = [

    CostumeCardModel(isAvailable: true, imageLoc: "images/astro.png"),
    CostumeCardModel(isAvailable: false, imageLoc: "images/princess.png"),
    CostumeCardModel(isAvailable: false, imageLoc: "images/santa.png"),
    CostumeCardModel(isAvailable: false, imageLoc: "images/schooluniform.png"),

  ];

  List<CostumeCardModel> props = [

    CostumeCardModel(isAvailable: false, imageLoc: "images/carnivalmask.png"),
    CostumeCardModel(isAvailable: false, imageLoc: "images/cosmeticprops.png"),
    CostumeCardModel(isAvailable: true, imageLoc: "images/astro.png"),
    CostumeCardModel(isAvailable: false, imageLoc: "images/background1.png"),

  ];

  CostumesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shop")),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
          //Costume Section 
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title and subtitle
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
                  
                  //display all costumes...scroll horizontal
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: costumes.length,
                      itemBuilder: (ctx, index){
                        return Card(
                            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             
                                SizedBox(
                                  width: 175,
                                  height: 175,
                                  child: Image(
                                    image: AssetImage(costumes[index].imageLoc), fit: BoxFit.cover),
                                ),
                                Container(
                                  child: Row(
                                   children: [
                                    costumes[index].isAvailable
                      ? const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Available",
                              style: TextStyle(color: Colors.green)),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Not Available",
                              style: TextStyle(color: Colors.red)),
                        ),
                  
                  //View in AR only if available
                  if (costumes[index].isAvailable)
                    ElevatedButton(
                      child: const Text("View in AR"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ARPage()));
                      },
                    )
                ],
              ),
            ),
            if (costumes[index].isAvailable)
              TextButton(child: const Text("Place Order"), onPressed: () {})
          ]));
                      }
                    )
                  ),
                ]),
          ),
          
          //Prop section 
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: props.length,
                      itemBuilder: (ctx, index){
                        return Card(
                            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                SizedBox(
                                  width: 175,
                                  height: 175,
                                  child: Image(
                                    image: AssetImage(props[index].imageLoc), fit: BoxFit.cover),
                                ),
                                Container(
                                  child: Row(
                                   children: [
                                    props[index].isAvailable
                      ? const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Available",
                              style: TextStyle(color: Colors.green)),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Not Available",
                              style: TextStyle(color: Colors.red)),
                        ),
                  if (props[index].isAvailable)
                    ElevatedButton(
                      child: const Text("View in AR"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ARPage()));
                      },
                    )
                ],
              ),
            ),
            if (props[index].isAvailable)
              TextButton(child: const Text("Place Order"), onPressed: () {})
          ]));
                      }
                    )
                  ),
                  
                ]),
          )
        ]),
      ),
    );
  }
}
