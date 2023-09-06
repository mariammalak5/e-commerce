import 'package:dio/dio.dart';
import 'package:ecommerce/pres/screens/home.dart';
import 'package:ecommerce/pres/screens/regester.dart';
import 'package:ecommerce/pres/widgets/TextFormDef.dart';
import 'package:flutter/material.dart';
import 'bottomNavigationBar.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var Econtr = TextEditingController();
  var Pcontr = TextEditingController();
@override
Future Login() async {
  var response = await Dio().post("https://api.storerestapi.com/auth/login",
      data: {"email": Econtr.text, "password": Pcontr.text});

  if (response.statusCode == 200) {
    print("true");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottonN(),
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
          height: 690,
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
                SizedBox(
                  height: 25,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.black, letterSpacing: 5, fontSize: 35),
                ),
                SizedBox(
                  height: 50,
                ),
                textFormDef(controller: Econtr, labelText: "Email Address", validator: "Enter your Email"),
                SizedBox(
                  height: 50,
                ),
                textFormDef(controller: Pcontr, labelText: "Password", validator: "Enter your Password"),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 500,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Login();
                        },
                        child: Text(
                          "Sign in",
                        ))),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don\'t have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: Text(
                        "Register",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
