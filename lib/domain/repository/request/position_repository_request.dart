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
