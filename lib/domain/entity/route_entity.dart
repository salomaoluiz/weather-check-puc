import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/entity/route.dart';

class RouteEntity {
  const RouteEntity({required this.route, required this.positions});

  final Route route;
  final List<PositionEntity> positions;
}
