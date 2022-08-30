import 'package:flutter/material.dart';
import 'package:vap/location.dart';
import 'package:vap/login.dart';
import 'package:vap/sini_up.dart';

class Home extends StatelessWidget {
  static String id = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFe6e9ed),
                  image: DecorationImage(
                    image: AssetImage('assets/images/image2.jpeg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to APPDESIGN',
                style: TextStyle(
                  fontFamily: 'pacifico',
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: 'USERNAME',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_sharp),
                    hintText: 'PASSWORED',
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
              Container(
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Hotels()));
                },
                    child: Text('SINI IN'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.deepOrangeAccent,
                      onSurface: Colors.grey,
                      padding: EdgeInsets.all(10.0),
                      minimumSize: Size(300, 50)),

                ),
              ),
              SizedBox(height: 20),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SiniUp()));
                  },
                  child: Text('SINI UP'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.deepOrangeAccent,
                      onSurface: Colors.grey,
                      padding: EdgeInsets.all(10.0),
                      minimumSize: Size(300, 50)),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Chalange()));
                  },
                  child: Text('LOGIN'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.deepOrangeAccent,
                      onSurface: Colors.grey,
                      padding: EdgeInsets.all(10.0),
                      minimumSize: Size(300, 50)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

