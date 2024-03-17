class SearchAddressResultPosition {
  double lat;
  double lon;

  SearchAddressResultPosition({required this.lat, required this.lon});

  factory SearchAddressResultPosition.fromJSON(Map<String, dynamic> json) {
    return SearchAddressResultPosition(lat: json['lat'], lon: json['lon']);
  }
}

class SearchAddressResultViewport {
  SearchAddressResultPosition topLeftPoint;
  SearchAddressResultPosition btmRightPoint;

  SearchAddressResultViewport(
      {required this.topLeftPoint, required this.btmRightPoint});

  factory SearchAddressResultViewport.fromJSON(Map<String, dynamic> json) {
    return SearchAddressResultViewport(
        topLeftPoint:
            SearchAddressResultPosition.fromJSON(json['topLeftPoint']),
        btmRightPoint:
            SearchAddressResultPosition.fromJSON(json['btmRightPoint']));
  }
}

class SearchAddressResult {
  SearchAddressResultPosition position;
  SearchAddressResultViewport viewport;

  SearchAddressResult({required this.position, required this.viewport});

  factory SearchAddressResult.fromJSON(Map<String, dynamic> json) {
    return SearchAddressResult(
        position: SearchAddressResultPosition.fromJSON(json['position']),
        viewport: SearchAddressResultViewport.fromJSON(json['viewport']));
  }
}

class SearchAddressModel {
  List<SearchAddressResult> results = [];

  SearchAddressModel({required this.results});

  factory SearchAddressModel.fromJSON(Map<String, dynamic> json) {
    return SearchAddressModel(
        results: List<SearchAddressResult>.from(json['results']
            .map((result) => SearchAddressResult.fromJSON(result))));
  }
}
