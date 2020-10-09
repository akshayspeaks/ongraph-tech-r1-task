import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ongraph_tech_r1_task/data/config_facade.dart';
import 'package:ongraph_tech_r1_task/models/app_config.dart';

part 'welcome_page_event.dart';
part 'welcome_page_state.dart';
part 'welcome_page_bloc.freezed.dart';

@injectable
class WelcomePageBloc extends Bloc<WelcomePageEvent, WelcomePageState> {
  final IConfigFacade _configFacade;
  WelcomePageBloc(this._configFacade) : super(const _Initial());

  @override
  Stream<WelcomePageState> mapEventToState(
    WelcomePageEvent event,
  ) async* {
    yield* event.map(fetchConfigurations: (e) async* {
      dynamic configOptions = await _configFacade.getAllConfigurations();
      yield WelcomePageState.loaded(AppConfig.fromDynamic(configOptions));
    });
  }
}
