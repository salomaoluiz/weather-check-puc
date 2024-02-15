import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/entity/route.dart';

class RouteEntity {
  const RouteEntity({required this.route, required this.position});

  final Route route;
  final List<PositionEntity> position;
}
