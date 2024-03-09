enum WeatherStatusByIconCode {
  sunny([1]),
  partlyCloudy([2, 3, 4]),
  hazy([5]),
  cloudy([6, 7, 8]),
  fog([11]),
  pouring([12, 43]),
  partlyRainy([13, 14]),
  lightning([15, 41, 42]),
  partlyLightning([16, 17]),
  rainy([18, 39, 40]),
  hail([19]),
  partlySnowy([20, 21, 23]),
  snowy([22, 44]),
  snowyHeavy([24, 25]),
  snowyRainy([26, 29]),
  hot([30]),
  cold([31]),
  windy([32]),
  night([33]),
  nightPartlyCloudy([34, 35, 36, 37, 38]);

  final List<int> iconCode;

  const WeatherStatusByIconCode(this.iconCode);
}

class WeatherStatus {
  WeatherStatusByIconCode? status;
  int iconCode;

  WeatherStatus({required this.iconCode}) {
    status = WeatherStatusByIconCode.values
        .firstWhere((element) => element.iconCode.contains(iconCode));
  }

  factory WeatherStatus.fromJSON(Map<String, dynamic> json) {
    return WeatherStatus(iconCode: json['iconCode']);
  }
}
