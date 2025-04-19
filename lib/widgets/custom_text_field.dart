import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({this.hintText , this.onChanged , this.obSecure = false});

   Function(String)? onChanged ;
   String? hintText ;

   bool? obSecure ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecure!,
      validator: (data){
        if(data!.isEmpty){
          return 'failed is required';
        }
      },
      style: TextStyle(
        color: Colors.white
      ),
      onChanged: onChanged,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.5)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
