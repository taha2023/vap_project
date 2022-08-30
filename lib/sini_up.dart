import 'package:flutter/material.dart';

class SiniUp extends StatefulWidget {
  const SiniUp({Key? key}) : super(key: key);

  @override
  State<SiniUp> createState() => _SiniUpState();
}

class _SiniUpState extends State<SiniUp> {
  TextEditingController inputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool loading = true;
    String _text = "";
    return Scaffold(
      backgroundColor: Color(0xFF38579c),
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFebeef5),
                image: DecorationImage(
                  image: AssetImage('assets/images/avater.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'CREATE ACCOUNT',
              style: TextStyle(
                fontFamily: 'pacifico',
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: TextField(
                controller: inputController,
                decoration: new InputDecoration(
                  hintText: 'Your nickname',
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: TextField(
                decoration: new InputDecoration(
                  hintText: 'Your e-mail',
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: TextField(
                decoration: new InputDecoration(
                  hintText: 'your phone',
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: TextField(
                decoration: new InputDecoration(
                  hintText: 'your passwored',
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: TextField(
                decoration: new InputDecoration(
                  hintText: 'Confirm passwored',
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  _text = inputController.text;
                });
              },
              icon: Icon(
                Icons.arrow_circle_right,
                color: Colors.amber,
              ),
            ),
            Text(
              '$_text',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
