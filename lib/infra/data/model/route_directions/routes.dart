part 'summary.dart';

part 'guidance.dart';

class Routes {
  Summary summary;
  Guidance guidance;

  Routes({required this.summary, required this.guidance});

  factory Routes.fromJSON(Map<String, dynamic> json) {
    return Routes(
        summary: Summary.fromJSON(json['summary']),
        guidance: Guidance.fromJSON(json['guidance']));
  }
}
