import 'package:flutter/material.dart';
import 'package:ongraph_tech_r1_task/models/app_config.dart';
import 'package:ongraph_tech_r1_task/pages/fields_screen/widgets/my_dropdown_field.dart';
import 'package:ongraph_tech_r1_task/pages/fields_screen/widgets/my_star_rating_field.dart';
import 'package:ongraph_tech_r1_task/pages/fields_screen/widgets/my_text_form_field.dart';
import 'package:ongraph_tech_r1_task/pages/thank_you_screen/thank_you_page.dart';

class FieldsPage extends StatelessWidget {
  final AppConfig appConfig;
  final FieldConfig fieldListConfig;
  FieldsPage({Key key, this.appConfig})
      : fieldListConfig = appConfig.fieldConfig,
        super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    var ob = fieldListConfig.formFieldList[1];
    if (ob is DropdownField) print(ob.choices.toString());
    return Scaffold(
      appBar: AppBar(),
      body: _buildFieldsBody(context),
    );
  }

  Widget _buildFieldsBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(children: <Widget>[
          ..._getFieldChildrenFromConfig(),
          RaisedButton(
              child: Text('Sumbit'),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThankYouPage(
                              appConfig: appConfig,
                            )));
              })
        ]),
      ),
    );
  }

  List<Widget> _getFieldChildrenFromConfig() {
    return fieldListConfig.formFieldList.map((formField) {
      var fft = formField.runtimeType;
      switch (fft) {
        case ShortTextField:
          return MyTextFormField(
            hintText: formField.title,
            validator: (String value) {
              if (value.length < 3) {
                return 'Too short';
              }
              return null;
            },
            textInputType: TextInputType.text,
          );
        case NumberField:
          return MyTextFormField(
            hintText: formField.title,
            validator: (String value) {
              if (value.length < 1) {
                return 'Enter a number';
              }
              return null;
            },
            textInputType: TextInputType.number,
          );
        case EmailField:
          return MyTextFormField(
            hintText: formField.title,
            validator: formField.shouldRequireValidation
                ? (String value) {
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  }
                : () {},
            textInputType: TextInputType.emailAddress,
          );
        case PhoneNumberField:
          return MyTextFormField(
            hintText: formField.title,
            validator: formField.shouldRequireValidation
                ? (String value) {
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  }
                : null,
            textInputType: TextInputType.phone,
          );
        case DropdownField:
          return MyDropdownField(
            hintText: formField.title,
            dropMenuItems: (formField as DropdownField).choices,
          );
        case RatingField:
          return MyStarRatingField(
            steps: (formField as RatingField).steps,
            title: formField.title,
          );

        default:
          return Container();
      }
    }).toList();
  }
}
