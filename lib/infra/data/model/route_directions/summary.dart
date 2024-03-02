
part of 'routes.dart';

class Summary {
  int lengthInMeters;

  Summary({required this.lengthInMeters});

  factory Summary.fromJSON(Map<String, dynamic> json) {
    return Summary(lengthInMeters: json['lengthInMeters']);
  }
}
