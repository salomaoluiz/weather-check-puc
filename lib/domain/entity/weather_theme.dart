enum WeatherThemeOptions {
  dayRaining,
  dayClear,
  dayFoggy,
  nightRaining,
  nightClear,
  nightFoggy
}

const dayRainingColor = "#7D9FB0";
const dayClearColor = "#FF6700";
const dayFoggyColor = "#D4D4D4";
const nightRainingColor = "#11487A";
const nightClearColor = "#02012C";
const nightFoggyColor = "#B6C0C9";

class WeatherThemeEntity {
  const WeatherThemeEntity({required this.theme});

  final WeatherThemeOptions theme;

  String getThemeColor() {
    switch (theme) {
      case WeatherThemeOptions.dayRaining:
        return dayRainingColor;
      case WeatherThemeOptions.dayClear:
        return dayClearColor;
      case WeatherThemeOptions.dayFoggy:
        return dayFoggyColor;
      case WeatherThemeOptions.nightRaining:
        return nightRainingColor;
      case WeatherThemeOptions.nightClear:
        return nightClearColor;
      case WeatherThemeOptions.nightFoggy:
        return nightFoggyColor;
    }
  }
}
