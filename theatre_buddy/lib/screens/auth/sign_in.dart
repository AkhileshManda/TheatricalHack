import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theatre_buddy/screens/app/home.dart';
import 'package:theatre_buddy/screens/auth/register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String error = "";
  String name = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          //Title
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Theatre Buddy",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600
              )
            ),
          ),

          //subtitle
          const Padding(
            padding: EdgeInsets.fromLTRB(6, 6, 6, 10),
            child: Text(
              "One stop place for all theatre geeks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200
              )
            ),
          ),
          
          //email field
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _nameCon,
              decoration: InputDecoration(
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: false,
                  fillColor: Colors.grey,
                  hintText: "Email"),
            ),
          ),
          
          //password field
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              obscureText: true,
              controller: _passwordCon,
              decoration: InputDecoration(
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                  hintText: "Password"),
            ),
          ),
          
          ElevatedButton(
              onPressed: () async {
                name = _nameCon.text;
                pass = _passwordCon.text;

                try {
                  UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                    email: name,
                    password: pass,
                  );

                  //print(userCredential);

                  //if user is signed in go to home page

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                } on FirebaseAuthException catch (e) {
                  //print(e.toString());
                  
                  setState(() {
                    error = e.toString();
                  });
                }
                            },
              child: const Text('Sign In')
            ),
          
          //toggle
          TextButton(
            child: Text(
              "New User? Click to Register",
              style: TextStyle(color: Colors.blue[900]),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()));
            },
          ),
          
          //display error
          if (error != "")
            Text("Error Signing In", style: TextStyle(color: Colors.red[900]))
        ],
      ),
    );
  }
}
