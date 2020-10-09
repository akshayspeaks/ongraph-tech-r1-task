import 'package:flutter/material.dart';
import 'package:ongraph_tech_r1_task/models/app_config.dart';
import 'package:ongraph_tech_r1_task/pages/fields_screen/fields_page.dart';

class WelcomeLoadedView extends StatelessWidget {
  final AppConfig appConfig;
  const WelcomeLoadedView({Key key, @required this.appConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WelcomeScreenConfig config = appConfig.welcomeScreenConfig;
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(config.title),
          Text(config.description),
          SizedBox(
            height: 50,
          ),
          config.showButton
              ? RaisedButton(
                  child: Text(config.buttonText),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FieldsPage(
                                  appConfig: appConfig,
                                )));
                  })
              : Container(),
        ],
      ),
    ));
  }
}
