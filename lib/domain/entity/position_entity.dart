import 'package:check_weather/domain/entity/position_weather_entity.dart';
import 'package:equatable/equatable.dart';

class PositionEntity extends Equatable {
  const PositionEntity(
      {this.latitude,
      this.longitude,
      this.travelTimeInSeconds,
      this.distanceInMeters,
      this.weather});

  final double? latitude;
  final double? longitude;
  final int? travelTimeInSeconds;
  final int? distanceInMeters;
  final PositionWeatherEntity? weather;

  @override
  List<Object?> get props => <Object?>[
        latitude,
        longitude,
        travelTimeInSeconds,
        distanceInMeters,
        weather
      ];
}
