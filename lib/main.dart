import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ongraph_tech_r1_task/injection.dart';
import 'package:ongraph_tech_r1_task/pages/welcome_screen/bloc/welcome_page_bloc.dart';
import 'package:ongraph_tech_r1_task/pages/welcome_screen/welcome_page.dart';

void main() {
  configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => getIt<WelcomePageBloc>()
          ..add(const WelcomePageEvent.fetchConfigurations()),
        child: WelcomePage(),
      ),
      // FieldsPage(
      //   fieldListConfig: FieldConfig(configParser(jsonDecode(fieldsDynamic))),
      // ),
    );
  }
}
