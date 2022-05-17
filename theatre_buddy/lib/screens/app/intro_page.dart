//splash screen
import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/auth/sign_in.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background1.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
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
                      child: Text("Theatre Buddy",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                    
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ),
                  child: Text("Lets get started !"), 
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthScreen()));
                  }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
