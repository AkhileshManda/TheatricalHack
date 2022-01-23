import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/audition_screen.dart';
import 'package:theatre_buddy/screens/app/costumes_page.dart';
import 'package:theatre_buddy/screens/app/script_screen.dart';
import 'package:theatre_buddy/widgets/carousel.dart';
import 'package:theatre_buddy/widgets/cod_card.dart';
import 'package:theatre_buddy/widgets/costumes_card.dart';
import 'package:theatre_buddy/widgets/drawer.dart';
import 'package:theatre_buddy/widgets/play_of_day.dart';
import 'package:theatre_buddy/widgets/reuseable_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        drawer: DrawerWidget(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO UPDATE IMAGE
                Carousel(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Quick Navigation :",
                      style: TextStyle(fontSize: 25)),
                ),

                SizedBox(
                  height: 50,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuditionScreen()));
                        },
                        child: ReuseableCard(
                          cardChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Auditions',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScriptsScreen()));
                        },
                        child: ReuseableCard(
                          cardChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Scripts',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CostumesPage()));
                        },
                        child: ReuseableCard(
                          cardChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Shop',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text("Play of the day :", style: TextStyle(fontSize: 25)),
                ),
                //TODO UPDATE IMAGE
                const PlayOfTheDayCard(
                    title: "Hamlet",
                    author: "Shakespeare",
                    image: 'images/hamlet.jpg',
                    url: 'http://shakespeare.mit.edu/hamlet/full.html'),
                //TODO: UPDATE IMAGE
                const PlayOfTheDayCard(
                    title: "Merchant Of Venice",
                    author: "Shakespeare",
                    image: 'images/mov.jpg',
                    url: 'http://shakespeare.mit.edu/merchant/full.html'),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Costume of the day:",
                      style: TextStyle(fontSize: 25)),
                ),

                CostumeOfTheDayCard(),
              ],
            ),
          ),
        ));
  }
}
