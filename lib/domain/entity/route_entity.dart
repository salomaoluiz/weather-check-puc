import 'package:check_weather/domain/entity/position.dart';
import 'package:check_weather/domain/entity/route.dart';

class RouteEntity {
  const RouteEntity({required this.route, required this.position});

  final Route route;
  final Position position;
}
