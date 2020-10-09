import 'package:flutter/material.dart';
import 'package:ongraph_tech_r1_task/models/app_config.dart';
import 'package:ongraph_tech_r1_task/pages/fields_screen/fields_page.dart';

class ThankYouPage extends StatelessWidget {
  final AppConfig appConfig;
  final ThankYouScreenConfig config;
  ThankYouPage({Key key, this.appConfig})
      : config = appConfig.thankYouScreenConfig,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
          appBar: AppBar(),
          body: Container(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(config.title),
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
          ))),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => FieldsPage(
                  appConfig: appConfig,
                )));
  }
}
