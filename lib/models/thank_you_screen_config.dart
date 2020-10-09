part of 'app_config.dart';

class ThankYouScreenConfig {
  final String title, buttonMode, buttonText;
  final bool showButton, shareIcons;
  factory ThankYouScreenConfig.fromThankYouDynamic(dynamic) {
    return ThankYouScreenConfig._(
      title: dynamic["title"],
      buttonMode: dynamic["properties"]["button_mode"],
      buttonText: dynamic["properties"]["button_text"],
      showButton: dynamic["properties"]["show_button"],
      shareIcons: dynamic["properties"]["share_icons"],
    );
  }

  const ThankYouScreenConfig._({
    this.shareIcons,
    this.showButton,
    this.title,
    this.buttonMode,
    this.buttonText,
  });
}
