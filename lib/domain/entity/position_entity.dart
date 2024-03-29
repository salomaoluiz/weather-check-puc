class PositionEntity {
  const PositionEntity(
      {required this.latitude,
      required this.longitude,
      this.travelTimeInSeconds = 0,
      this.distanceInMeters});

  final double latitude;
  final double longitude;
  final int travelTimeInSeconds;
  final int? distanceInMeters;
}
