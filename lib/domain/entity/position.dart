class Position {
  const Position(
      {this.latitude,
      this.longitude,
      this.travelTimeInSeconds,
      this.distanceInMeters});

  final double? latitude;
  final double? longitude;
  final int? travelTimeInSeconds;
  final int? distanceInMeters;
}
