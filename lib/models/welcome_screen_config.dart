part of 'app_config.dart';

class WelcomeScreenConfig {
  final String title, description, buttonText;
  final bool showButton;
  factory WelcomeScreenConfig.fromWelcomeDynamic(dynamic) {
    return WelcomeScreenConfig._(
      title: dynamic["title"],
      description: dynamic["properties"]["description"],
      buttonText: dynamic["properties"]["button_text"],
      showButton: dynamic["properties"]["show_button"],
    );
  }

  const WelcomeScreenConfig._(
      {this.showButton, this.title, this.description, this.buttonText});
}
