class Position {
  const Position(
      {required this.latitude,
      required this.longitude,
      this.travelTimeInSeconds,
      this.distanceInMeters});

  final double latitude;
  final double longitude;
  final int? travelTimeInSeconds;
  final int? distanceInMeters;
}