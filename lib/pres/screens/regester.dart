import 'package:dio/dio.dart';
import 'package:ecommerce/pres/screens/home.dart';
import 'package:ecommerce/pres/screens/product.dart';
import 'package:ecommerce/pres/screens/regester.dart';
import 'package:flutter/material.dart';

import '../widgets/TextFormDef.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var Email = TextEditingController();
  var Password = TextEditingController();
  var Phone = TextEditingController();
  var Name = TextEditingController();
  var Passwordrepeat = TextEditingController();

  Future registeD() async {
    var response =
        await Dio().post("https://api.storerestapi.com/auth/register", data: {
      "name": Name.text,
      "email": Email.text,
      "number": Phone.text,
      "password": Password.text,
      "password_repeat": Passwordrepeat.text
    });

    if (response.statusCode == 201) {
      print("true");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } else {
      print("faild");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 10),
        child: Container(
          width: 390,
          padding: EdgeInsetsDirectional.all(30),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            border: Border.all(
              color: Color(0xFF02100D),
              width: 5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "REGISTER",
                  style: TextStyle(
                      color: Colors.black, letterSpacing: 5, fontSize: 35),
                ),
                SizedBox(
                  height: 50,
                ),
                textFormDef(controller: Name, labelText: "User name", validator: "Enter your name"),
                SizedBox(
                  height: 45,
                ),
                textFormDef(controller: Email, labelText: "Email Address", validator: "Enter your Email"),
                SizedBox(
                  height: 45,
                ),
                textFormDef(controller: Phone, labelText: "Phone", validator: "Enter your phone"),
                SizedBox(
                  height: 45,
                ),
                textFormDef(controller: Password, labelText: "Password", validator: "Enter Password"),
                SizedBox(
                  height: 45,
                ),
                textFormDef(controller: Passwordrepeat, labelText: "Password", validator: "Enter your Password"),
                SizedBox(
                  height: 45,
                ),
                ElevatedButton(
                  onPressed: () {
                    registeD();
                  },
                  child: Text("Register now"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
