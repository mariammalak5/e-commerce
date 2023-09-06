import 'package:flutter/material.dart';

class textFormDef extends StatelessWidget {
   textFormDef({Key? key, required this.controller,required this.labelText,required this.validator}) : super(key: key);
var controller;
String validator;
String labelText;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
          style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        onFieldSubmitted: (String value) {},
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: (value)
        {
          if(value!.isEmpty)
          {
            return validator;
          }
          return null ;
        },
        decoration: InputDecoration(
          labelText:labelText,
          labelStyle: TextStyle(
            color: Color(0xFF252522),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
