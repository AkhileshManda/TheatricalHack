import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/audition_screen.dart';
import 'package:theatre_buddy/widgets/drawer.dart';
import '../../widgets/reuseable_card.dart';
import 'script_screen.dart';
import 'ar_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background1.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                    height: 200.0,
                    child: Image(
                      image: AssetImage('images/drama.png'),
                    )),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("What we Offer",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
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
                        Text(
                          'Check Auditions',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w900),
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
                        Text(
                          'View Scripts',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ARPage()));
                  },
                  child: ReuseableCard(
                    cardChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Buy Props',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
