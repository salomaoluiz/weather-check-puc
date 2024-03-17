import 'package:check_weather/domain/repository/request/position_repository_request.dart';

class AddressViewport {
  Position topLeftPoint;
  Position bottomRightPoint;

  AddressViewport({required this.topLeftPoint, required this.bottomRightPoint});
}

class AddressEntity {
  Position position;
  AddressViewport viewport;

  AddressEntity({required this.position, required this.viewport});
}
