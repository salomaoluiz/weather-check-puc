import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:equatable/equatable.dart';

class RouteEntity extends Equatable {
  const RouteEntity({this.lengthInMeters, this.positions});

  final int? lengthInMeters;
  final List<PositionEntity>? positions;
  @override
  List<Object?> get props => <Object?>[lengthInMeters, positions];
}
