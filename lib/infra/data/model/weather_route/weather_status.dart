import 'package:check_weather/domain/entity/weather_theme.dart';

enum WeatherStatusByIconCode {
  sunny([1], WeatherStatus.sunny),
  partlyCloudy([2, 3, 4], WeatherStatus.partlyCloudy),
  hazy([5], WeatherStatus.hazy),
  cloudy([6, 7, 8], WeatherStatus.cloudy),
  fog([11], WeatherStatus.fog),
  pouring([12, 43], WeatherStatus.pouring),
  partlyRainy([13, 14], WeatherStatus.partlyRainy),
  lightning([15, 41, 42], WeatherStatus.lightning),
  partlyLightning([16, 17], WeatherStatus.partlyLightning),
  rainy([18, 39, 40], WeatherStatus.rainy),
  hail([19], WeatherStatus.hail),
  partlySnowy([20, 21, 23], WeatherStatus.partlySnowy),
  snowy([22, 44], WeatherStatus.snowy),
  snowyHeavy([24, 25], WeatherStatus.snowyHeavy),
  snowyRainy([26, 29], WeatherStatus.snowyRainy),
  hot([30], WeatherStatus.hot),
  cold([31], WeatherStatus.cold),
  windy([32], WeatherStatus.windy),
  night([33], WeatherStatus.night),
  nightPartlyCloudy([34, 35, 36, 37, 38], WeatherStatus.nightPartlyCloudy);

  final List<int> iconCode;
  final WeatherStatus? status;
  const WeatherStatusByIconCode(this.iconCode, this.status);
}

class WeatherStatusModel {
  WeatherStatusByIconCode? status;
  int iconCode;

  WeatherStatusModel({required this.iconCode}) {
    status = WeatherStatusByIconCode.values
        .firstWhere((element) => element.iconCode.contains(iconCode));
  }

  factory WeatherStatusModel.fromJSON(Map<String, dynamic> json) {
    return WeatherStatusModel(iconCode: json['iconCode']);
  }
}
