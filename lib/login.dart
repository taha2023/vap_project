import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vap/homescreen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

// }

class Chalange extends StatefulWidget {
  const Chalange({Key? key}) : super(key: key);

  @override
  State<Chalange> createState() => _ChalangeState();
}

class _ChalangeState extends State<Chalange> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
                child: Text('Signin'),
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));

                    print(auth.currentUser!.uid);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      //ScaffoldMessenger.of(context).showSnackBar(snac('User not found'));
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      // ScaffoldMessenger.of(context).showSnackBar(snac('Wrong Password'));
                    }

                    print('Wrong password provided for that user.');
                  }
                }),
            ElevatedButton(
              child: Text('Signup'),
              onPressed: () async {
                try {
                  await auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('weak pass');
                    //ScaffoldMessenger.of(context).showSnackBar(snac('weak password'));
                  } else if (e.code == 'email-already-in-use') {
                    print('email exist');
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(snac('email already in use'));
                  }
                }
              },
            )
          ])
        ],
      ),
    );
  }
}
