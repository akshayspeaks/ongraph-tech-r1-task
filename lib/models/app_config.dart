import 'package:meta/meta.dart';

part 'fields_config.dart';
part 'welcome_screen_config.dart';
part 'thank_you_screen_config.dart';

class AppConfig {
  final FieldConfig fieldConfig;
  final WelcomeScreenConfig welcomeScreenConfig;
  final ThankYouScreenConfig thankYouScreenConfig;
  factory AppConfig.fromDynamic(dynamic) {
    return AppConfig._(
        fieldConfig: FieldConfig(configParser(dynamic["fields"])),
        welcomeScreenConfig: WelcomeScreenConfig.fromWelcomeDynamic(
            dynamic["welcome_screens"][0]),
        thankYouScreenConfig: ThankYouScreenConfig.fromThankYouDynamic(
            dynamic["thankyou_screens"][0]));
  }
  const AppConfig._({
    this.fieldConfig,
    this.welcomeScreenConfig,
    this.thankYouScreenConfig,
  });
}
