import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart' as validator;
import 'package:email_validator/email_validator.dart';


class SiniUp extends StatefulWidget {
  const SiniUp({Key? key}) : super(key: key);

  @override
  State<SiniUp> createState() => _SiniUpState();
}

class _SiniUpState extends State<SiniUp> {
  TextEditingController _passwordController = TextEditingController();

  TextEditingController inputController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ScaffoldKey = GlobalKey<ScaffoldState>();




  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';
    bool loading = true;
    String _text = "";
    String? _passwordError;
    bool isVisible = true;

    var passkey;
    TextEditingController password = TextEditingController();
    // var ConfirmPasswored;
    return Scaffold(
      key: ScaffoldKey,
      backgroundColor: Color(0xFF38579c),
      body: ListView(children: <Widget>[
        Form(
          key:formKey ,
          autovalidateMode: AutovalidateMode.always,child:  Column(
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
                child: TextFormField(
                  controller: inputController,
                  decoration: new InputDecoration(
                      hintText: 'Your nickname',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                  ),
                    validator: (value){
                      if(value!.isEmpty || !int.parse(value).isNaN){
                        return "Name required";
                        
                      }
                      return null;
                    }

                ),
              ),

            SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Your e-mail',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
              ),

            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: new InputDecoration(
                  hintText: 'your phone',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: TextFormField(
                  key: passkey,
                  controller: password,
                  decoration: new InputDecoration(
                    hintText: 'your passwored',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 30),

              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: TextFormField(
                    validator: (s){
                    return  confirmPasswordValidation(s, password.text);
                    },
                    decoration: new InputDecoration(
                      hintText: 'ConfirmPasswored',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),

                  ),
                ),
              ),

            SizedBox(height: 20),
            IconButton(

              onPressed: () {
                print("Password: " + _passwordController.text);
                // setState(() {
                //   if(password==ConfirmPasswored){
                //       isVisible= false;
                //     }else{
                //       isVisible= true;
                //     }
                //   }
                // );

                setState(() {
                  if(formKey.currentState!.validate()){
                    ScaffoldKey.currentState!.showSnackBar(SnackBar(
                      content: Text('Store data local or on the server',
                    ),
                    ));
                  }
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
        ),

    ]
    ),
    );
  }
  String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty || value.length < 6) {
      return ('Invalid password');
    } else if (password != value) {
      return ('password dosent match');
    } else {
      return null;
    }
  }
}
