part of 'welcome_page_bloc.dart';

@freezed
abstract class WelcomePageEvent with _$WelcomePageEvent {
  const factory WelcomePageEvent.fetchConfigurations() = _FetchConfigurations;
}
