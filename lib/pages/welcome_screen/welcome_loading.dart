import 'package:flutter/material.dart';

class WelcomeLoadingView extends StatelessWidget {
  const WelcomeLoadingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
