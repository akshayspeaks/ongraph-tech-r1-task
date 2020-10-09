import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ongraph_tech_r1_task/pages/welcome_screen/welcome_loaded.dart';
import 'package:ongraph_tech_r1_task/pages/welcome_screen/welcome_loading.dart';

import 'bloc/welcome_page_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WelcomePageBloc, WelcomePageState>(
        builder: (context, state) {
          return state.map(initial: (_) {
            return WelcomeLoadingView();
          }, loaded: (val) {
            return WelcomeLoadedView(
              appConfig: val.appConfig,
            );
          });
        },
      ),
    );
  }
}
