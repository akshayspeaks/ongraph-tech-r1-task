import 'package:flutter/material.dart';

class MyYesNoWidget extends StatefulWidget {
  final String title;
  MyYesNoWidget({Key key, this.title}) : super(key: key);

  @override
  _MyYesNoWidgetState createState() => _MyYesNoWidgetState();
}

class _MyYesNoWidgetState extends State<MyYesNoWidget> {
  List<String> lst = ['YES', 'NO'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customRadio(lst[0], 0, Colors.green),
            customRadio(lst[1], 1, Colors.red),
          ],
        )
      ],
    ));
  }

  Widget customRadio(String txt, int index, Color onActiveColor) {
    return OutlineButton(
      onPressed: () => changeIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide: BorderSide(
          color: selectedIndex == index ? onActiveColor : Colors.grey),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex == index ? onActiveColor : Colors.grey),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
