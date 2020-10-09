// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data/config_facade.dart';
import 'pages/welcome_screen/bloc/welcome_page_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<WelcomePageBloc>(() => WelcomePageBloc(get<IConfigFacade>()));

  // Eager singletons must be registered in the right order
  gh.singleton<IConfigFacade>(ConfigStoreImpl());
  return get;
}
