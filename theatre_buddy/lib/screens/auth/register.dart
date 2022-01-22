import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theatre_buddy/screens/app/home.dart';
import 'package:theatre_buddy/screens/auth/sign_in.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          const Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Theatre Buddy",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              )),
          ),

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
                  hintText: "Email")
            ),
          ),

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
                    await _auth.createUserWithEmailAndPassword(
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
            child: Text('Sign Up'),
          ),
          TextButton(
            child: const Text("Already Have an Account? Sign In Here"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AuthScreen()));
            },
          ),
          if (error != "")
            const Text("Error Signing In", style: TextStyle(color: Colors.red))
        ],
      ),
    );
  }
}
