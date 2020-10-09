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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  config.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildBottomButtons(context),
                )
              ],
            ),
          ))),
    );
  }

  List<Widget> _buildBottomButtons(BuildContext context) {
    List<Widget> bottomRowWidgets = [];
    if (config.showButton)
      bottomRowWidgets.add(RaisedButton(
          child: Text(config.buttonText),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => FieldsPage(
                          appConfig: appConfig,
                        )));
          }));
    if (config.shareIcons) {
      bottomRowWidgets
          .add(IconButton(icon: Icon(Icons.share), onPressed: () {}));
    }
    return bottomRowWidgets;
  }

  Future<void> _onWillPop(BuildContext context) async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => FieldsPage(
                  appConfig: appConfig,
                )));
  }
}
