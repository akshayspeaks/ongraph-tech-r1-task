import 'package:flutter/material.dart';

class WelcomeLoadingView extends StatelessWidget {
  const WelcomeLoadingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Please wait while we fetch data',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          CircularProgressIndicator()
        ],
      )),
    );
  }
}
