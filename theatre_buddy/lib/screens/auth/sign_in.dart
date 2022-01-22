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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 150,
          ),
          Container(
            color: Colors.lightBlue[100],
            height: 70.0,
            child: Text(
              " Theatre Buddy ",
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 40,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          TextField(
            controller: _nameCon,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: false,
                fillColor: Colors.grey,
                hintText: "Email"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            controller: _passwordCon,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: false,
                fillColor: Colors.grey,
                hintText: "Password"),
          ),
          const SizedBox(
            height: 50,
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

                  print(userCredential);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } on FirebaseAuthException catch (e) {
                  print(e.toString());
                  error = e.toString();
                }
              },
              child: Text('Sign In')),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            child: Text(
              "New User? Click to Register",
              style: TextStyle(color: Colors.blue[900]),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
          ),
          if (error != "")
            Text("Error Signing In", style: TextStyle(color: Colors.red[900]))
        ],
      ),
    );
  }
}
