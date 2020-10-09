import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final TextInputType textInputType;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSaved,
        keyboardType: textInputType,
      ),
    );
  }
}
