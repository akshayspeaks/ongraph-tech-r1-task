part of 'welcome_page_bloc.dart';

@freezed
abstract class WelcomePageState with _$WelcomePageState {
  const factory WelcomePageState.initial() = _Initial;
  // const factory WelcomePageState.loading() = _Loading; [_Initial] is [_Loading], in this case
  const factory WelcomePageState.loaded(AppConfig appConfig) = _Loaded;
}
