import 'package:check_weather/domain/entity/position.dart';
import 'package:check_weather/domain/entity/route.dart';

class RouteEntity {
  const RouteEntity({this.route, this.position});

  final Route? route;
  final Position? position;
}
