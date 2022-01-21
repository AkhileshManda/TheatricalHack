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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Theatre Buddy"),
            TextField(
              controller: _nameCon,
              decoration: const InputDecoration(
                  hintText: "Email"
              ),
            ),
            TextField(
              obscureText: true,
              controller: _passwordCon,
              decoration: const InputDecoration(
                  hintText: "Password"
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  name = _nameCon.text;
                  pass = _passwordCon.text;

                  try {
                    UserCredential userCredential = await _auth
                        .createUserWithEmailAndPassword(
                      email: name,
                      password: pass,
                    );

                    print(userCredential);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen())
                    );
                  } on FirebaseAuthException catch (e) {
                    print(e.toString());
                    error = e.toString();
                  }
                },
                child: Text('Sign Up'), 

            ),
            TextButton(
              child: const Text("Already Have an Account? Sign In Here"),
              onPressed: (){
                Navigator.push(context,
                 MaterialPageRoute(builder:(context)=> AuthScreen())
                 );
              },
              ),
            if(error!="")
              Text("Error Signing In", style: TextStyle(color:Colors.red))
          ],
        ),
      ),
    );
  }
}