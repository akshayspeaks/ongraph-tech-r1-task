import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateFormField extends StatelessWidget {
  final DateFormat format; //DateFormat("yyyy-MM-dd");
  final String title, structure;

  MyDateFormField({Key key, this.title, this.structure})
      : format = DateFormat("MM-dd-yyyy"),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}
