import 'package:check_weather/domain/entity/position_entity.dart';

class Position {
  const Position({this.lat, this.lon});

  final double? lat;
  final double? lon;
}

class GetPositionsRequest {
  const GetPositionsRequest({this.startPosition, this.endPosition});

  final Position? startPosition;
  final Position? endPosition;
}

class GetWeatherByPositionsRequest {
  const GetWeatherByPositionsRequest({this.positions});

  final List<PositionEntity>? positions;
}
