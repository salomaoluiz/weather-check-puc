import 'package:equatable/equatable.dart';

enum WeatherThemeOptions {
  raining,
  sunny,
  foggy
}

const rainingColor="#12167F";
const sunnyColor="#FF6700";
const foggyColor="#D4D4D4";

class WeatherThemeEntity extends Equatable {
  const WeatherThemeEntity({
    required this.theme
});

  final WeatherThemeOptions? theme;

  String getThemeColor() {
    switch(theme) {
      case WeatherThemeOptions.raining:
        return rainingColor;
      case WeatherThemeOptions.sunny:
        return sunnyColor;
      case WeatherThemeOptions.foggy:
        return foggyColor;
      default: {
        return rainingColor;
      }
    }
  }

  @override
  List<Object?> get props => <Object?>[
   theme
  ];
}